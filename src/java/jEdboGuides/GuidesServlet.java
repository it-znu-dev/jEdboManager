package jEdboGuides;

import jFuncList.FuncList;
import jSoapCommon.GuidesSoapExecutor;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
  public File koatuuFileSQL;
  
  public jSoapCommon.GuidesSoapRealExecutor soapEx     
          = new jSoapCommon.GuidesSoapRealExecutor();

  public GuidesServlet() {
    this.koatuuFileSQL = new File(FuncList.getWorkingAbsolutePath()+"/koatuu.sql");
  }
  
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
      GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      GuidesSoapExecutor._debug("=========================");
      return jerr;
    }
    if ((this.jGuid == null || this.jGuid.isEmpty()) && !func_name.equals("Login")){
      jerr.put("error","Дія заборонена для НЕавторизованого користувача");
      out.println(this.jResponseString(callback, jerr));
      GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      GuidesSoapExecutor._debug("=========================");
      return jerr;
    }
    GuidesSoapExecutor._debug("Виклик методу execEdboSoapFunc для SOAP-функції '"+func_name+"' ...");
    JSONObject jret;
      GuidesSoapExecutor._debug("Використовується ДІЙСНА БАЗА ЄДЕБО.");
      jret = this.soapEx.execEdboSoapFunc(jo, params, err);
//    if (params.containsKey("test")){
//      GuidesSoapExecutor._debug("Використовується ТЕСТОВА БАЗА ЄДЕБО.");
//      jret = this.soapTestEx.execEdboSoapFunc(jo, params, err);
//    } else {
//      GuidesSoapExecutor._debug("Використовується ДІЙСНА БАЗА ЄДЕБО.");
//      jret = this.soapEx.execEdboSoapFunc(jo, params, err);
//    }
    if (func_name.matches("^.+Get(.{1,4})?$")){
      // + SQL
      String sql = "";
      String sqlStruct = this.soapEx.getSqlTableStruct(func);
      String sqlData = this.soapEx.getSqlTableData(func,jret);
      if (sqlStruct != null && sqlData != null){
        sql = sqlStruct + sqlData;
      }
      try {
        jret.put("sql", sql);
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
      //
    }

    GuidesSoapExecutor._debug("Заверешено виклик методу execEdboSoapFunc.");
    if (jret == null){
      jret = new JSONObject();
      jret.put("error", "помилка формування JSON-даних");
      out.println(this.jResponseString(callback, 
              jret));
      GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      GuidesSoapExecutor._debug("=========================");
      return jerr;
    }
    if (func_name.equals("Login") && jret.has("guid")){
      String guid = jret.getString("guid");
      if (guid.matches("^[-0-9a-f]+$")){
        GuidesSoapExecutor._debug("Збереження SessionGUID в пам'яті Http-сесії: ("+session.getId()+" <-- "+guid+")");
        GuidesServlet.jGuids.put(session.getId(),guid);
        this.jGuid = guid;
      }
    }
    if (func_name.equals("Logout")){
      String guid = GuidesServlet.jGuids.get(session.getId());
      if (guid != null && !guid.isEmpty()){
        GuidesSoapExecutor._debug("Знищення SessionGUID="+guid+" в пам'яті Http-сесії: X("+session.getId()+")X");
        GuidesServlet.jGuids.put(session.getId(),"");
        this.jGuid = null;
      }
    }
    out.println(this.jResponseString(callback, 
            jret));
    GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
    GuidesSoapExecutor._debug("=========================");
    return jret;
  }
  
  
  /**
   * Окремий випадок для збірки даних КОАТУУ усіх рівнів
   * @param koatuu1 json-об’єкт для SOAP-функції KOATUUGetL1
   * @param koatuu2 json-об’єкт для SOAP-функції KOATUUGetL2
   * @param koatuu3 json-об’єкт для SOAP-функції KOATUUGetL3
   * @param err json-об’єкт для SOAP-функції GetLastError
   * @param callback пуста строка, якщо не тип jsonp, інакше REQUEST-параметр [callback]
   * @param session екземпляр класу HttpSession
   * @param out екземпляр класу PrintWriter
   * @param level рівень КОАТУУ (1|2|3)
   * @param add_param параметр KOATUUCodeL1 або KOATUUCodeL2 або null
   */
  public synchronized void koatuuExecSoap(JSONObject koatuu1, 
          JSONObject koatuu2, JSONObject koatuu3, 
          JSONObject err,  String callback, 
          HttpSession session, PrintWriter out,
          int level, String add_param){
    try {
      JSONObject jret; //execEdboSoapFunc result
      JSONObject koatuu = null; // koatuu1|koatuu2|koatuu3
      HashMap <String,String> params = new HashMap(); //SOAP input params
      JSONObject jerr = new JSONObject(); //json for error
      String func_name; //SOAP-function name
      JSONArray koatuuJSON_arr; //body of this.koatuuJSON
      JSONArray jret_arr;// body of jret
      BufferedWriter sql_out = null;
      String sql = "drop table if exists KOATUU ;\n" +
    "create table KOATUU(\n" +
    "  id int primary key auto_increment,\n" +
    "  Id_KOATUU int comment 'Идентификатор КОАТУУ.',\n" +
    "  KOATUUCode varchar(255) comment 'Строка с десятизначным кодом населенного пункта.',\n" +
    "  Type varchar(255) comment 'Тип населенного пункта.',\n" +
    "  Id_KOATUUName int comment 'Идентификатор названия населенного пункта',\n" +
    "  KOATUUName varchar(255) comment 'Название населенного пункта',\n" +
    "  KOATUUFullName varchar(255) comment 'Полное название населенного пункта, включая область и район.',\n" +
    "  KOATUUDateBegin dateTime comment 'Дата начала действия записи',\n" +
    "  KOATUUDateEnd dateTime comment 'Дата окончания действия записи',\n" +
    "  Id_Language int comment 'Идентификатор языка для названия населенных пунктов',\n" +
    "  KOATUUCodeL1 varchar(255) comment 'КОАТУУ уровня 1',\n" +
    "  KOATUUCodeL2 varchar(255) comment 'КОАТУУ уровня 2',\n" +
    "  KOATUUCodeL3 varchar(255) comment 'КОАТУУ уровня 3'\n" +
    ");\n";
      
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
      func_name = koatuu.getString("name");
      if ((this.jGuid == null || this.jGuid.isEmpty())){
        jerr.put("error","Дія заборонена для НЕавторизованого користувача");
        out.println(this.jResponseString(callback, jerr));
        GuidesSoapExecutor._debug("Знищення об’єкта this.koatuuJSON .");
        this.koatuuJSON = new JSONObject();
        GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
        GuidesSoapExecutor._debug("=========================");
        return ;
      }
      GuidesSoapExecutor._debug("Виклик методу koatuuExecSoap для SOAP-функції '"+func_name+"' ...");
      jret = this.soapEx.execEdboSoapFunc(koatuu, params, err);
      if (!jret.has("body") 
              || (jret.getJSONArray("body") == null)
              || (jret.getJSONArray("body").length() == 0)){
        GuidesSoapExecutor._debug("ІНФО: не отримано дані після виклику SOAP-функції '"
                +func_name+"' з параметрами\n  "+params.toString());
        GuidesSoapExecutor._debug(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
        GuidesSoapExecutor._debug("Вихід з рівня #"+level);
        GuidesSoapExecutor._debug("```````````````````````````````````````");
        return ;
      }
      GuidesSoapExecutor._debug("Радіємо : виклик методу koatuuExecSoap для SOAP-функції '"
              +func_name+"' має json-об’єкт `body`");
      if (level == 1){
        GuidesSoapExecutor._debug("Ініціалізація атрибуту koatuuJSON ...");
        this.koatuuJSON.put("head", jret.get("head"));
        this.koatuuJSON.put("body", new JSONArray());
      }
      jret_arr = jret.getJSONArray("body");
      GuidesSoapExecutor._debug("Отримали масив (кількість елементів: "+jret_arr.length()+")");
      //GuidesSoapExecutor._debug("Атрибут koatuuJSON зараз = "+this.koatuuJSON.toString());
      koatuuJSON_arr = this.koatuuJSON.getJSONArray("body");
      if (koatuuJSON_arr == null){
        GuidesSoapExecutor._debug("ІНФО: json-об’єкт body атрибуту koatuuJSON має пусте значення!");
        GuidesSoapExecutor._debug(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
        GuidesSoapExecutor._debug("Вихід з рівня #"+level);
        GuidesSoapExecutor._debug("```````````````````````````````````````");
        return ;
      }
      if (level == 1){
        GuidesSoapExecutor._debug("Запис у SQL-файл ... ");
        try  {
          sql_out = new BufferedWriter( new FileWriter(this.koatuuFileSQL, (level > 1)));
          sql_out.write(sql);
          sql_out.close();
        }
        catch (IOException e){
            jerr.put("error",this.koatuuFileSQL.getAbsolutePath()+" не відкрився.");
            if (level == 1){
              out.println(this.jResponseString(callback, jerr));
            }
            GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
            GuidesSoapExecutor._debug("=========================");
            return ;
        }
      }
      //LOOP
      for (int i = 0; i < jret_arr.length(); i++){
        JSONObject jitem = jret_arr.getJSONObject(i);
        String add__param;
        String koatuuInsertSQL = "";
        koatuuInsertSQL += "insert into KOATUU (\n";
        Iterator iter = jitem.keys();
        for (Object obj=iter.next();(obj != null);obj=iter.next()){
          String key = (String)obj;
          koatuuInsertSQL += key;
          if (iter.hasNext()){
            koatuuInsertSQL += ",\n";
          } else {
            break;
          }
        }
        koatuuInsertSQL += "\n)\n values \n";
        Iterator iter2 = jitem.keys();
        koatuuInsertSQL += "(\n";
        for (Object obj=iter2.next();(obj != null);obj=iter2.next()){
          String key = (String)obj;
          String val = String.valueOf(jitem.get(key));
          koatuuInsertSQL += "'" + val.replace("'", "`") + "'";
          if (iter2.hasNext()){
            koatuuInsertSQL += ",\n";
          } else {
            break;
          }
        }
        koatuuInsertSQL += "\n);\n";
        GuidesSoapExecutor._debug("Запис у SQL-файл ... ");
        try  {
          sql_out = new BufferedWriter( new FileWriter(this.koatuuFileSQL, true));
          sql_out.write(koatuuInsertSQL);
          sql_out.close();
        }
        catch (IOException e){
            jerr.put("error",this.koatuuFileSQL.getAbsolutePath()+" не відкрився.");
            if (level == 1 && i == 0){
              out.println(this.jResponseString(callback, jerr));
            }
            GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
            GuidesSoapExecutor._debug("=========================");
            return ;
        }
        koatuuJSON_arr.put(jitem);
        add__param = jitem.getString("KOATUUCodeL"+String.valueOf(level));
        if (level < 3){
          GuidesSoapExecutor._debug("Перевизначення koatuuJSON, тепер масив body має розмір = "+koatuuJSON_arr.length()+".");
          this.koatuuJSON.put("body", koatuuJSON_arr);
          //РЕКУРСИВНО
          this.koatuuExecSoap(koatuu1, 
            koatuu2, koatuu3, err, callback, 
            session,  out,
            level+1, add__param);
        }
      }
      //END LOOP

      GuidesSoapExecutor._debug("Вийшли з циклу.");
      GuidesSoapExecutor._debug("Перевизначення koatuuJSON, тепер масив body має розмір = "+koatuuJSON_arr.length()+".");
      this.koatuuJSON.put("body", koatuuJSON_arr);
      if (level > 1){
        GuidesSoapExecutor._debug(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
        GuidesSoapExecutor._debug("Вихід з рівня #"+level);
        GuidesSoapExecutor._debug("```````````````````````````````````````");
        return ;
      }
      FileInputStream ifstream;
      try {
        ifstream = new FileInputStream(this.koatuuFileSQL);
        byte[] sql_data = new byte[(int) this.koatuuFileSQL.length()];
        ifstream.read(sql_data);
        String str = new String(sql_data, "UTF-8");
        sql = str;
        ifstream.close();
      } catch (IOException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
      try {
        this.koatuuJSON.put("sql", sql);
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
      out.println(this.jResponseString(callback, 
              this.koatuuJSON));
      GuidesSoapExecutor._debug("Знищення об’єкта this.koatuuJSON .");
      this.koatuuJSON = new JSONObject();
      GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      GuidesSoapExecutor._debug("=========================");
      //
    } catch (JSONException ex) {
      GuidesSoapExecutor._debug("Сталася помилка під час виклику методу `koatuuExecSoap` .");
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
    
    GuidesSoapExecutor._debug("=========================");
    GuidesSoapExecutor._debug("Старт сервлету "+this.getCurrentTime()+" ; обробка REQUESТ-запиту...");
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
      GuidesSoapExecutor._debug("Буде повернено JSON-дані (content-type: text/json;charset=UTF-8).");
    } else {
      response.setContentType("text/javascript;charset=UTF-8");
      GuidesSoapExecutor._debug("Буде повернено JSONP-дані (content-type: text/javascript;charset=UTF-8, callback: '"
              +callback
              +"').");
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
      
      Map<String, String[]> parameters = request.getParameterMap();
      HashMap<String,String> params = new HashMap();
      GuidesSoapExecutor._debug("Збірка REQUESТ-параметрів...");
      for(String parameter : parameters.keySet()) {
        if (parameter.equals("SessionGUID") && this.jGuid != null){
          String guid = GuidesServlet.jGuids.get(session.getId());
          GuidesSoapExecutor._debug("Відновлення SessionGUID із пам'яті Http-сесії: ("+session.getId()+" --> "+guid+")");
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
          GuidesSoapExecutor._debug("Сталася помилка під час виконання виразу `jo = f_arr.getJSONObject("+i+");` .");
          GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
        String func_name = "";
        try {
          func_name = jo.getString("name");
        } catch (JSONException ex) {
          GuidesSoapExecutor._debug("Сталася помилка під час виконання виразу `func_name = jo.getString(\"name\");` .");
          GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
        if (func_name.equals("GetLastError")){
          GuidesSoapExecutor._debug("Знайшли JSON-інфо для GetLastError (#"+String.valueOf(i)+")");
          err = jo;
        }
        if (action.equals("j"+func_name) && !action.equals("jKOATUUGetAll")){
          GuidesSoapExecutor._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
          calling_func = jo;
        }
        if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL1")){
          GuidesSoapExecutor._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
          koatuu1 = jo;
        }
        if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL2")){
          GuidesSoapExecutor._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
          koatuu2 = jo;
        }
        if (action.equals("jKOATUUGetAll") && func_name.equals("KOATUUGetL3")){
          GuidesSoapExecutor._debug("Знайшли JSON-інфо для '"+func_name+"' (#"+String.valueOf(i)+")");
          koatuu3 = jo;
        }
      }
      //////
      
      if (err == null){
        GuidesSoapExecutor._debug("Не знайдено JSON-інфо для SOAP-функції GetLastError!");
        GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
        return ;
      }
      
      if (calling_func != null){
        try {
          //!!!!
          this.execSoapFunc(calling_func,err,params,callback, session, out) ;
          return ;
          //!!!!
        } catch (JSONException ex) {
          GuidesSoapExecutor._debug("Сталася помилка під час виклику методу `execSoapFunc` .");
          GuidesSoapExecutor._debug("ЗАВЕРШЕНО з помилкою ||||||||||||||| "+this.getCurrentTime());
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return ;
        }
      }
      
      if (action.equals("jKOATUUGetAll")){
        GuidesSoapExecutor._debug("Виклик методу koatuuExecSoap.");
        GuidesSoapExecutor._debug("Використовується ДІЙСНА БАЗА ЄДЕБО.");
        this.koatuuExecSoap(koatuu1, koatuu2, koatuu3, err, callback, session, out, 1, null);
        return ;
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
