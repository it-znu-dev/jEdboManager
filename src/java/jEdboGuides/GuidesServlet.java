package jEdboGuides;

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
  
  public static HashMap<String,String> jGuids =  new HashMap<>();
  public String jGuid;
  public final String actionName = "_$action";
  public jSoapCommon.SoapExecutor soapEx = new jSoapCommon.SoapExecutor();
  
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
      jo.put("error", "Сталася дивна помилка: помилка при запиті на отримання інформації про помилку.");
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
   * Виклик SOAP-функції на рівні сервлету
   * @param func JSON-об'єкт - інфо SOAP-функції, яку треба викликати
   * @param err JSON-об'єкт - інфо SOAP-функції "GetLastError"
   * @param params хеш-мапа REQUEST-параметрів
   * @param callback пуста строка, якщо не тип jsonp, інакше REQUEST-параметр [callback]
   * @param session екземпляр класу HttpSession
   * @param out екземпляр класу PrintWriter
   * @throws JSONException 
   */
  public void execSoapFunc(JSONObject func, JSONObject err, 
          HashMap <String, String> params, String callback, 
          HttpSession session, PrintWriter out) throws JSONException{
    JSONObject jo = func;
    String func_name = func.getString("name");
    if (this.jGuid != null && !this.jGuid.isEmpty() && func_name.equals("Login")){
      jo.put("error","Дія заборонена для авторизованого користувача");
      out.println(this.jResponseString(callback, jo));
      this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      this._debug("=========================");
      return ;
    }
    if ((this.jGuid == null || this.jGuid.isEmpty()) && !func_name.equals("Login")){
      jo.put("error","Дія заборонена для НЕавторизованого користувача");
      out.println(this.jResponseString(callback, jo));
      this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      this._debug("=========================");
      return ;
    }
    this._debug("Виклик методу execEdboSoapFunc для SOAP-функції '"+func_name+"' ...");

    JSONObject jret = this.soapEx.execEdboSoapFunc(jo, params, err);

    this._debug("Заверешено виклик методу execEdboSoapFunc.");
    if (jret == null){
      jret = new JSONObject();
      jret.put("error", "помилка формування JSON-даних");
      out.println(this.jResponseString(callback, 
              jret));
      this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      this._debug("=========================");
      return ;
    }
    if (func_name.equals("Login") && jret.has("guid")){
      String guid = jret.getString("guid");
      if (guid.matches("^[-0-9a-f]+$")){
        this._debug("Збереження SessionGUID в пам'яті Http-сесії: ("+session.getId()+" <-- "+guid+")");
        GuidesServlet.jGuids.put(session.getId(),guid);
        this.jGuid = guid;
      }
    }
    if (func_name.equals("Logout")){
      String guid = GuidesServlet.jGuids.get(session.getId());
      if (guid != null){
        this._debug("Знищення SessionGUID="+guid+" в пам'яті Http-сесії: X("+session.getId()+")X");
        GuidesServlet.jGuids.remove(session.getId());
        this.jGuid = null;
      }
    }
    out.println(this.jResponseString(callback, 
            jret));
    this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
    this._debug("=========================");
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
    
    this._debug("=========================");
    this._debug("Старт сервлету "+this.getCurrentTime()+" ; обробка REQUESТ-запиту...");
    request.setCharacterEncoding("UTF-8");
    HttpSession session = request.getSession();
    session.setMaxInactiveInterval(60*60*8);
    this.jGuid = GuidesServlet.jGuids.get(session.getId());
    if (this.jGuid == null){
      this.jGuid = "";
      GuidesServlet.jGuids.put(session.getId(),this.jGuid);
    }
    String callback = request.getParameter("callback");
    String action = 
      ((request.getParameter(this.actionName)==null)? 
            "__undefined__" : request.getParameter(this.actionName));
    
    if (callback == null || callback.isEmpty()){
      response.setContentType("text/json;charset=UTF-8");
      this._debug("Буде повернено JSON-дані (content-type: text/json;charset=UTF-8).");
    } else {
      response.setContentType("text/javascript;charset=UTF-8");
      this._debug("Буде повернено JSONP-дані (content-type: text/javascript;charset=UTF-8, callback: '"
              +callback
              +"').");
    }
    if (action == null || action.isEmpty()){
      action = "";
    }
    
    
    //////////////////////////////////////////////////////////////
    
    try (PrintWriter out = response.getWriter()) {
      
      this._debug("Отримання списку доступних для виклику SOAP-функцій ...");

      jFuncList.FuncList fl = new jFuncList.FuncList();

      JSONArray f_arr = null;
      try {
        f_arr = fl.getJsonEdboGuidesFuncList();
      } catch (JSONException ex) {
         this._debug("Сталася помилка при отриманні списку доступних SOAP-функцій.");
         this._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
         JSONObject jret = new JSONObject();
          jret.put("error", "помилка формування JSON-даних");
          out.println(this.jResponseString(callback, 
                  jret));
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return;
      }
      this._debug("Отримано список доступних SOAP-функцій (к-сть: "+String.valueOf(f_arr.length())+" ).");
      
      Map<String, String[]> parameters = request.getParameterMap();
      HashMap<String,String> params = new HashMap();
      this._debug("Збірка REQUESТ-параметрів...");
      for(String parameter : parameters.keySet()) {
        if (parameter.equals("SessionGUID") && this.jGuid != null){
          String guid = GuidesServlet.jGuids.get(session.getId());
          this._debug("Відновлення SessionGUID із пам'яті Http-сесії: ("+session.getId()+" --> "+guid+")");
          params.put(parameter, guid);
        } else {
          params.put(parameter, request.getParameter(parameter));
        }
      }
      //////
      
      for (int i = 0; i < f_arr.length(); i++){
        JSONObject jo;
        try {
          jo = f_arr.getJSONObject(i);
        } catch (JSONException ex) {
          this._debug("Сталася помилка під час виконання виразу `jo = f_arr.getJSONObject("+i+");` .");
          this._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
        String func_name = "";
        try {
          func_name = jo.getString("name");
        } catch (JSONException ex) {
          this._debug("Сталася помилка під час виконання виразу `func_name = jo.getString(\"name\");` .");
          this._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
        if (func_name.equals("GetLastError")){
          this._debug("Знайшли JSON-інфо для GetLastError (#"+String.valueOf(i)+")");
          err = jo;
        }
        if (action.equals("j"+func_name)){
          this._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
          calling_func = jo;
        }
      }
      //////
      
      if (err == null){
        this._debug("Не знайдено JSON-інфо для SOAP-функції GetLastError!");
        this._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        return ;
      }
      
      if (calling_func != null){
        try {
          //!!!!
          this.execSoapFunc(calling_func,err,params,callback, session, out) ;
          return ;
          //!!!!
        } catch (JSONException ex) {
          this._debug("Сталася помилка під час виконання виразу `func_name = jo.getString(\"name\");` .");
          this._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
      }
      
      this._debug("Виведення результатів виконання методу getJsonEdboGuidesFuncList()");
      out.print(f_arr.toString());
      
      this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      this._debug("=========================");
      
    } catch (JSONException ex){
      this._debug("Сталася помилка під час роботи з JSON.");
      this._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
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
