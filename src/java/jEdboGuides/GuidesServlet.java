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
  public JSONObject koatuuJSON = new JSONObject();
  
  public jSoapCommon.GuidesSoapRealExecutor soapEx     
          = new jSoapCommon.GuidesSoapRealExecutor();
  
  public jSoapCommon.GuidesSoapTestExecutor soapTestEx 
          = new jSoapCommon.GuidesSoapTestExecutor();
  
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
   * Виклик SOAP-функції на рівні сервлету
   * @param func JSON-об'єкт - інфо SOAP-функції, яку треба викликати
   * @param err JSON-об'єкт - інфо SOAP-функції "GetLastError"
   * @param params хеш-мапа REQUEST-параметрів
   * @param callback пуста строка, якщо не тип jsonp, інакше REQUEST-параметр [callback]
   * @param session екземпляр класу HttpSession
   * @param out екземпляр класу PrintWriter
   * @throws JSONException 
   */
  public JSONObject execSoapFunc(JSONObject func, JSONObject err, 
          HashMap <String, String> params, String callback, 
          HttpSession session, PrintWriter out) throws JSONException{
    JSONObject jerr = new JSONObject(),jo = func;
    String func_name = func.getString("name");
    if (this.jGuid != null && !this.jGuid.isEmpty() && func_name.equals("Login")){
      jerr.put("error","Дія заборонена для авторизованого користувача");
      out.println(this.jResponseString(callback, jerr));
      this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      this._debug("=========================");
      return jerr;
    }
    if ((this.jGuid == null || this.jGuid.isEmpty()) && !func_name.equals("Login")){
      jerr.put("error","Дія заборонена для НЕавторизованого користувача");
      out.println(this.jResponseString(callback, jerr));
      this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      this._debug("=========================");
      return jerr;
    }
    this._debug("Виклик методу execEdboSoapFunc для SOAP-функції '"+func_name+"' ...");
    JSONObject jret;
    if (params.containsKey("test")){
      this._debug("Використовується ТЕСТОВА БАЗА ЄДЕБО.");
      jret = this.soapTestEx.execEdboSoapFunc(jo, params, err);
    } else {
      this._debug("Використовується ДІЙСНА БАЗА ЄДЕБО.");
      jret = this.soapEx.execEdboSoapFunc(jo, params, err);
    }

    this._debug("Заверешено виклик методу execEdboSoapFunc.");
    if (jret == null){
      jret = new JSONObject();
      jret.put("error", "помилка формування JSON-даних");
      out.println(this.jResponseString(callback, 
              jret));
      this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      this._debug("=========================");
      return jerr;
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
      if (guid != null && !guid.isEmpty()){
        this._debug("Знищення SessionGUID="+guid+" в пам'яті Http-сесії: X("+session.getId()+")X");
        GuidesServlet.jGuids.put(session.getId(),"");
        this.jGuid = null;
      }
    }
    out.println(this.jResponseString(callback, 
            jret));
    this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
    this._debug("=========================");
    return jerr;
  }
  
  
  /**
   * 
   * @param koatuu1
   * @param koatuu2
   * @param koatuu3
   * @param err
   * @param callback
   * @param session
   * @param out
   * @param level
   * @param add_param
   * @return 
   */
  public JSONObject koatuuExecSoap(JSONObject koatuu1, 
          JSONObject koatuu2, JSONObject koatuu3, 
          JSONObject err,  String callback, 
          HttpSession session, PrintWriter out,
          int level, String add_param){
    try {
      JSONObject jret,  jK = new JSONObject();
      JSONArray jA = new JSONArray();
      JSONObject koatuu = null;
      HashMap <String,String> params = new HashMap();
      
      params.put("SessionGUID", this.jGuid);
      params.put("ActualDate", this.getCurrentTime());
      params.put("Id_Language", "1");
      
      if (level == 1){
        koatuu = koatuu1;
      }
      if (level == 2){
        koatuu = koatuu2;
        params.put("KOATUUCodeL1", add_param);
      }
      if (level == 3){
        koatuu = koatuu3;
        params.put("KOATUUCodeL2", add_param);
        params.put("NameMask", "");
      }
      
      
      jret = this.execSoapFunc(koatuu1,err,params,callback, session, out);
      if (jret.has("body")){
        JSONArray jret_arr = jret.getJSONArray("body");
        if (level == 1){
          this.koatuuJSON.put("head", jret.get("head"));
          this.koatuuJSON.put("body", new JSONArray());
        } else {
          JSONArray koatuuJSON_arr = this.koatuuJSON.getJSONArray("body");
          //Я остановился тут!!!
          //koatuuJSON_arr.
        }
        for (int i = 0; i < jret_arr.length(); i++){
          JSONObject jitem = jret_arr.getJSONObject(i);
          String add__param = "";
          if (level == 1){
            koatuu = koatuu2;
            add__param = jitem.getString("KOATUUCodeL1");
          }
          if (level == 2){
            koatuu = koatuu3;
            add__param = jitem.getString("KOATUUCodeL2");
          }
          if (level < 3){
            this.koatuuExecSoap(koatuu1, 
              koatuu2, koatuu3, err, callback, 
              session,  out,
              level+1, add__param);
          }
        }
      }
      return null;
      //!!!!
    } catch (JSONException ex) {
      this._debug("Сталася помилка під час виклику методу `execSoapFunc` .");
      this._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
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
    JSONObject koatuu1 = null ,koatuu2 = null ,koatuu3 = null;
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
        if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL1")){
          this._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
          koatuu1 = jo;
        }
        if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL2")){
          this._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
          koatuu2 = jo;
        }
        if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL3")){
          this._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
          koatuu3 = jo;
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
          this._debug("Сталася помилка під час виклику методу `execSoapFunc` .");
          this._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
      }
      
      if (action.equals("jKOATUUGetAll")){

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
