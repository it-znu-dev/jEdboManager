package jEdboGuides;

import jSoapCommon.GuidesSoapExecutor;
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
@WebServlet(name = "GuidesServlet", urlPatterns = {"/GuidesServlet"})
public class GuidesServlet extends HttpServlet {
  
  public final String actionName = "_$action";
  
  public jSoapCommon.GuidesSoapRealExecutor soapEx     
          = new jSoapCommon.GuidesSoapRealExecutor();
  
//  public jSoapCommon.GuidesSoapTestExecutor soapTestEx 
//          = new jSoapCommon.GuidesSoapTestExecutor();
  
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
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        GuidesSoapExecutor._debug("Сталася помилка під час виконання виразу `jo = f_arr.getJSONObject("+i+");` .");
        GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
      try {
        func_name = jo.getString("name");
      } catch (JSONException ex) {
        GuidesSoapExecutor._debug("Сталася помилка під час виконання виразу `func_name = jo.getString(\"name\");` .");
        GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
      if (func_name.equals("GetLastError")){
        GuidesSoapExecutor._debug("Знайшли JSON-інфо для GetLastError (#"+String.valueOf(i)+")");
        funcs.put(func_name, jo);//err = jo;
      }
      if (action.equals("j"+func_name) && !action.equals("jKOATUUGetAll")){
        GuidesSoapExecutor._debug("Знайшли JSON-інфо для SOASP ф-ції '"
                +func_name+"' (#"+String.valueOf(i)+")");
        funcs.put(func_name, jo);//calling_func = jo;
      }
      if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL1")){
        GuidesSoapExecutor._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
        funcs.put(func_name, jo);//koatuu1 = jo;
      }
      if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL2")){
        GuidesSoapExecutor._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
        funcs.put(func_name, jo);//koatuu2 = jo;
      }
      if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL3")){
        GuidesSoapExecutor._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
        funcs.put(func_name, jo);//koatuu3 = jo;
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
    String jGuid = "";
    JSONObject koatuu1 = null ,koatuu2 = null ,koatuu3 = null;
    JSONObject err = null;
    Map<String, String[]> parameters;
    HashMap<String,String> params = new HashMap();
    HashMap < String, JSONObject > funcs;
    GuidesSoapExecutor._debug("=========================");
    GuidesSoapExecutor._debug("Старт сервлету "+this.getCurrentTime()+" ; обробка REQUESТ-запиту...");
    request.setCharacterEncoding("UTF-8");
    HttpSession session = request.getSession();
    session.setMaxInactiveInterval(60*10);
    String callback = request.getParameter("callback");
    String action = 
      ((request.getParameter(this.actionName)==null)? 
            "__undefined__" : request.getParameter(this.actionName));
    if (callback == null || callback.isEmpty()){
      response.setContentType("text/json;charset=UTF-8");
      GuidesSoapExecutor._debug("Буде повернено JSON-дані (content-type: text/json;charset=UTF-8).");
    } else {
      response.setContentType("text/javascript;charset=UTF-8");
      GuidesSoapExecutor._debug("Буде повернено JSONP-дані "
              + "(content-type: text/javascript;charset=UTF-8, callback: '"
              +callback+"').");
    }
    if (action == null || action.isEmpty()){
      action = "";
    }
    //////////////////////////////////////////////////////////////
    try (PrintWriter out = response.getWriter()) {
      GuidesSoapExecutor._debug("Отримання списку доступних для виклику SOAP-функцій ...");
      jFuncList.FuncList fl = new jFuncList.FuncList();
      JSONArray f_arr = null;
      try {
        f_arr = fl.getJsonEdboGuidesFuncList();
      } catch (JSONException ex) {
         GuidesSoapExecutor._debug("Сталася помилка при отриманні списку доступних SOAP-функцій.");
         GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
         JSONObject jret = new JSONObject();
          jret.put("error", "помилка формування JSON-даних");
          out.println(this.jResponseString(callback, 
                  jret));
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return;
      }
      GuidesSoapExecutor._debug("Отримано список доступних SOAP-функцій (к-сть: "+String.valueOf(f_arr.length())+" ).");
      parameters = request.getParameterMap();
      for(String parameter : parameters.keySet()) {
        if (parameter.equals("SessionGUID") && !request.getParameter(parameter).isEmpty()){
          jGuid = request.getParameter(parameter);
        }
        params.put(parameter, request.getParameter(parameter));
      }
      GuidesSoapExecutor._debug("Збірка REQUESТ-параметрів: зібрано.");
      GuidesSoapExecutor._debug("Пошук json-інфо SOAP-функції для дії '"+action+"' ");
      
      funcs = this.getAllSoapFuncInfo(f_arr,action);
      if (funcs == null) return;
      err = (JSONObject)funcs.get("GetLastError");
      koatuu1 = (JSONObject)funcs.get("KOATUUGetL1");
      koatuu2 = (JSONObject)funcs.get("KOATUUGetL2");
      koatuu3 = (JSONObject)funcs.get("KOATUUGetL3");
      calling_func = (JSONObject)funcs.get(action.substring(1));
      
      if (err == null){
        JSONObject jret = this._jsonError("Не знайдено json-інфо для SOAP-функцій GetLastError.");
        out.print(this.jResponseString(callback, jret));
        GuidesSoapExecutor._debug("Не знайдено JSON-інфо для SOAP-функції GetLastError!");
        GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        return ;
      }
      if (action.equals("jKOATUUGetAll") 
              && (koatuu1 == null || koatuu2 == null || koatuu3 == null)){
        JSONObject jret = this._jsonError("Не знайдено json-інфо для SOAP-функцій КОАТУУ усіх рівнів.");
        out.print(this.jResponseString(callback, 
                jret));
        GuidesSoapExecutor._debug("Не знайдено json-інфо для SOAP-функцій КОАТУУ усіх рівнів.");
        GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        return ;  
      }
      if (action.equals("jKOATUUGetAll")){
        GuidesSoapExecutor._debug("Виклик методу koatuuExecSoap.");
        GuidesSoapExecutor._debug("Використовується ДІЙСНА БАЗА ЄДЕБО.");
        this.soapEx.koatuuExecSoap(jGuid, koatuu1, koatuu2, koatuu3, err, callback, out, 1, null);
        return ;
      }
      if (calling_func != null){
        try {
          String func_name = calling_func.getString("name");
          JSONObject jret = this.soapEx.execSoap(jGuid, calling_func, params, err, callback, out);
          if (jret == null){
            return ;
          }
          if (func_name.equals("Login") && jret.has("guid")){
            String guid = jret.getString("guid");
            if (guid.matches("^[-0-9a-f]+$")){
              GuidesSoapExecutor._debug("Login проведено успішно: SessionGUID = "+guid);
              jGuid = guid;
            }
          }
          if (func_name.equals("Logout")){
            if (jGuid != null && !jGuid.isEmpty()){
              GuidesSoapExecutor._debug("Знищення SessionGUID="+jGuid+"");
              jGuid = null;
            } else {
              JSONObject jrete = this._jsonError("Сесія вже знищена.");
              out.print(this.jResponseString(callback, 
                      jrete));
            }
          }
          return ;
        } catch (JSONException ex) {
          GuidesSoapExecutor._debug("Сталася помилка під час виклику методу `execSoapFunc` .");
          GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
      } else {
        GuidesSoapExecutor._debug("Не знайдено json-інфо для дії "+action);
      }
      GuidesSoapExecutor._debug("Виведення результатів виконання методу getJsonEdboGuidesFuncList()");
      out.print(f_arr.toString());
      GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      GuidesSoapExecutor._debug("=========================");
    } catch (JSONException ex){
      GuidesSoapExecutor._debug("Сталася помилка під час роботи з JSON.");
      GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
