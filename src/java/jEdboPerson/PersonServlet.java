package jEdboPerson;

import jSoapCommon.SoapExecutor;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author sinepolsky
 */
@WebServlet(name = "PersonServlet", urlPatterns = {"/PersonServlet"})
public class PersonServlet extends HttpServlet {
  
  public static HashMap<String,String> jGuids =  new HashMap<>();
  public String jGuid;
  public final String actionName = "_$action";
  
  public jSoapCommon.PersonSoapRealExecutor soapEx     
          = new jSoapCommon.PersonSoapRealExecutor();
  
//  public jSoapCommon.PersonSoapTestExecutor soapTestEx 
//          = new jSoapCommon.PersonSoapTestExecutor();
  
  protected String getCurrentTime(){
    DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
    Date date = new Date();
    String actual_datetime = dateFormat.format(date);
    return actual_datetime;
  }
  
  protected void _debug(String info){
    System.out.println(info);
  }
  
  protected JSONObject _jsonError(String err){
    JSONObject jo = new JSONObject();
    try {
      jo.put("error", err);
      return jo;
    } catch (JSONException ex) {
      Logger.getLogger(PersonServlet.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
  }
  
  /**
   * Формування в залежності від способу взаємодії (json|jsonp)
   * відповіді дії сервлету
   * @param callback callback-параметр при кросдоменній AJAX-взаємодії
   * @param jo json-об’єкт, який буде виведено
   * @return строкове представлення json-об’єкту
   */
  public String jResponseString(String callback, JSONObject jo){
    if (callback == null || callback.isEmpty()){
      return jo.toString();
    }
    return callback
            + "("+ jo.toString() + ")";
  }
  
  /**
   * Формування в залежності від способу взаємодії (json|jsonp)
   * відповіді дії сервлету
   * @param callback callback-параметр при кросдоменній AJAX-взаємодії
   * @param ja json-масив, який буде виведено
   * @return строкове представлення json-об’єкту
   */
  public String jResponseString(String callback, JSONArray ja){
    if (callback == null || callback.isEmpty()){
      return ja.toString();
    }
    return callback
            + "("+ ja.toString() + ")";
  }
  
  /**
   * Збирає json-інфо для SOAP-функцій GetLastError, KOATUUGetL1, KOATUUGetL2, KOATUUGetL3
   * і для SOAP-функції, пов’язаною з дією action
   * @param f_arr json-масив усієї інформації про доступні для виклику SOAP-функції
   * @param action дія, (змінна REQUEST-параметру)
   * @return HashMap < String, JSONObject >
   */
  public HashMap < String, JSONObject > getAllSoapFuncInfo(JSONArray f_arr, String action){
    HashMap < String, JSONObject > funcs = new HashMap<>();
    for (int i = 0; i < f_arr.length(); i++){
      JSONObject jo;
      String func_name = "";
      try {
        jo = f_arr.getJSONObject(i);
      } catch (JSONException ex) {
        SoapExecutor._debug("Сталася помилка під час виконання виразу `jo = f_arr.getJSONObject("+i+");` .");
        SoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        Logger.getLogger(PersonServlet.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
      try {
        func_name = jo.getString("name");
      } catch (JSONException ex) {
        SoapExecutor._debug("Сталася помилка під час виконання виразу `func_name = jo.getString(\"name\");` .");
        SoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        Logger.getLogger(PersonServlet.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
      if (func_name.equals("GetLastError")){
        SoapExecutor._debug("Знайшли JSON-інфо для GetLastError (#"+String.valueOf(i)+")");
        funcs.put(func_name, jo);//err = jo;
      }
      if (action.equals("j"+func_name) && !action.equals("jKOATUUGetAll")){
        SoapExecutor._debug("Знайшли JSON-інфо для SOAP-ф-ції '"
                +func_name+"' (#"+String.valueOf(i)+")");
        funcs.put(func_name, jo);//calling_func = jo;
      }
    }
    return funcs;
  }
  
  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    JSONObject calling_func = null;
    JSONObject err = null;
    Map<String, String[]> parameters;
    HashMap<String,String> params = new HashMap();
    HashMap < String, JSONObject > funcs;
    SoapExecutor._debug("=========================");
    SoapExecutor._debug("Старт сервлету "+this.getCurrentTime()+" ; обробка REQUESТ-запиту...");
    request.setCharacterEncoding("UTF-8");
    HttpSession session = request.getSession();
    session.setMaxInactiveInterval(60*60*3);
    this.jGuid = PersonServlet.jGuids.get(session.getId());
    if (this.jGuid == null){
      this.jGuid = "";
      PersonServlet.jGuids.put(session.getId(),this.jGuid);
    }
    String callback = request.getParameter("callback");
    String action = 
      ((request.getParameter(this.actionName)==null)? 
            "__undefined__" : request.getParameter(this.actionName));
    if (callback == null || callback.isEmpty()){
      response.setContentType("text/json;charset=UTF-8");
      SoapExecutor._debug("Буде повернено JSON-дані (content-type: text/json;charset=UTF-8).");
    } else {
      response.setContentType("text/javascript;charset=UTF-8");
      SoapExecutor._debug("Буде повернено JSONP-дані "
              + "(content-type: text/javascript;charset=UTF-8, callback: '"
              +callback+"').");
    }
    if (action == null || action.isEmpty()){
      action = "";
    }
    //////////////////////////////////////////////////////////////
    try (PrintWriter out = response.getWriter()) {
      SoapExecutor._debug("Отримання списку доступних для виклику SOAP-функцій ...");
      jFuncList.FuncList fl = new jFuncList.FuncList();
      JSONArray f_arr = null;
      try {
        f_arr = fl.getJsonEdboPersonFuncList();
      } catch (JSONException ex) {
         SoapExecutor._debug("Сталася помилка при отриманні списку доступних SOAP-функцій.");
         SoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
         JSONObject jret = new JSONObject();
          jret.put("error", "помилка формування JSON-даних");
          out.println(this.jResponseString(callback, 
                  jret));
        Logger.getLogger(PersonServlet.class.getName()).log(Level.SEVERE, null, ex);
        return;
      }
      SoapExecutor._debug("Отримано список доступних SOAP-функцій (к-сть: "+String.valueOf(f_arr.length())+" ).");
      parameters = request.getParameterMap();
      for(String parameter : parameters.keySet()) {
        if (parameter.equals("SessionGUID") && this.jGuid != null){
          String guid = PersonServlet.jGuids.get(session.getId());
          SoapExecutor._debug("Відновлення SessionGUID із пам'яті Http-сесії: ("+session.getId()+" --> "+guid+")");
          params.put(parameter, guid);
        } else {
          params.put(parameter, request.getParameter(parameter));
        }
      }
      SoapExecutor._debug("Збірка REQUESТ-параметрів: зібрано.");
      SoapExecutor._debug("Пошук json-інфо SOAP-функції для дії '"+action+"' ");
      
      funcs = this.getAllSoapFuncInfo(f_arr,action);
      if (funcs == null) return;
      err = (JSONObject)funcs.get("GetLastError");
      calling_func = (JSONObject)funcs.get(action.substring(1));
      
      if (err == null){
        JSONObject jret = this._jsonError("Не знайдено json-інфо для SOAP-функцій GetLastError.");
        out.print(this.jResponseString(callback, jret));
        SoapExecutor._debug("Не знайдено JSON-інфо для SOAP-функції GetLastError!");
        SoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        return ;
      }
      if (calling_func != null){
        try {
          String func_name = calling_func.getString("name");
          JSONObject jret = this.soapEx.execSoap(this.jGuid, calling_func, params, err, callback, out);
          if (jret == null){
            return ;
          }
          if (func_name.equals("Login") && jret.has("guid")){
            String guid = jret.getString("guid");
            if (guid.matches("^[-0-9a-f]+$")){
              SoapExecutor._debug("Збереження SessionGUID в пам'яті Http-сесії: ("+session.getId()+" <-- "+guid+")");
              PersonServlet.jGuids.put(session.getId(),guid);
              this.jGuid = guid;
            }
          }
          if (func_name.equals("Logout")){
            String guid = PersonServlet.jGuids.get(session.getId());
            if (guid != null && !guid.isEmpty()){
              SoapExecutor._debug("Знищення SessionGUID="+guid+" в пам'яті Http-сесії: X("+session.getId()+")X");
              PersonServlet.jGuids.put(session.getId(),"");
              this.jGuid = null;
            } else {
              JSONObject jrete = this._jsonError("Сесія вже знищена.");
              out.print(this.jResponseString(callback, 
                      jrete));
            }
          }
          return ;
        } catch (JSONException ex) {
          SoapExecutor._debug("Сталася помилка під час виклику методу `execSoapFunc` .");
          SoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(PersonServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
      } else {
        SoapExecutor._debug("Не знайдено json-інфо для дії "+action);
      }
      SoapExecutor._debug("Виведення результатів виконання методу getJsonEdboPersonFuncList()");
      out.print(f_arr.toString());
      SoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      SoapExecutor._debug("=========================");
    } catch (JSONException ex){
      SoapExecutor._debug("Сталася помилка під час роботи з JSON.");
      SoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
      Logger.getLogger(PersonServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Edbo GUIDES via SOAP";
  }// </editor-fold>

}
