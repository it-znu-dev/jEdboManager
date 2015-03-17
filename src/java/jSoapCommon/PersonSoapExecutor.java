/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jSoapCommon;

//import jEdboGuides.PersonServlet;
import jFuncList.FuncList;
import java.beans.Introspector;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author sysadmin
 */
public class PersonSoapExecutor extends SoapExecutor {
  public Object edbo_guides;
  protected JSONObject soapResultJSON = new JSONObject();
  protected File fileSQL;
    
  /**
   * Повертає SQL-код для формування структури таблиці значень, що повертає SOAP-функція
   * @param func JSON-об'єкт даних SOAP-методу
   * @return SQL-string
   */
  public String getSqlTableStruct(JSONObject func){
    String sql_str = "";
    String func_name, table_name;
    JSONArray ret_params;
    try {
       func_name = func.getString("name");
    } catch (JSONException ex) {
      Logger.getLogger(SoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
    table_name = func_name.replace("Get", "");
    sql_str += "drop table if exists "+table_name+" ;\n";
    sql_str += "create table "+table_name+"(\n";
    sql_str += "  `id` int primary key auto_increment,\n";
    
    try {
      ret_params = func.getJSONArray("return");
    } catch (JSONException ex) {
      Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
    for (int i = 0; i < ret_params.length(); i++){
      JSONObject jret;
      String name,type,descr;
      try {
        jret = ret_params.getJSONObject(i);
        name = "`"+jret.getString("name")+"`";
        type = jret.getString("type").replace("string","varchar(255)");
        descr = jret.getString("description");
        if (name.isEmpty()){
          continue;
        }
        sql_str += "  "+name
                +" "+type
                +" comment '"+descr.replaceAll("'", "`")+"'";
        if (i < ret_params.length()-1){
          sql_str += ",\n";
        } else {
          sql_str += "\n);\n";
        }
      } catch (JSONException ex) {
        Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
    }
    return sql_str;
  }
  
  /**
   * Повертає SQL-код для формування даних таблиці значень, що повертає SOAP-функція
   * @param func JSON-об'єкт даних SOAP-методу
   * @param result JSON-об'єкт - результат методу packResultsToJson
   * @return SQL-string
   */
  public String getSqlTableData(JSONObject func, JSONObject result){
    String sql_str = "";
    String func_name, table_name;
    JSONArray ret_vals;
    try {
       ret_vals = result.getJSONArray("body");
    } catch (JSONException ex) {
      Logger.getLogger(SoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
    try {
       func_name = func.getString("name");
    } catch (JSONException ex) {
      Logger.getLogger(SoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
    table_name = func_name.replace("Get", "");

    for (int i = 0; i < ret_vals.length(); i++){
      JSONObject jo;
      try {
        jo = ret_vals.getJSONObject(i);
        if (i == 0){
          sql_str += "insert into "+table_name+" (\n";
          Iterator iter = jo.keys();
          for (Object obj=iter.next();(obj != null);obj=iter.next()){
            String key = (String)obj;
            sql_str += key;
            if (iter.hasNext()){
              sql_str += ",\n";
            } else {
              break;
            }
          }
          sql_str += "\n)\n values \n";
        }
        Iterator iter = jo.keys();
        sql_str += "(\n";
        for (Object obj=iter.next();(obj != null);obj=iter.next()){
          String key = (String)obj;
          String val = String.valueOf(jo.get(key));
          sql_str += "'" + val.replace("'", "`") + "'";
          if (iter.hasNext()){
            sql_str += ",\n";
          } else {
            break;
          }
        }
        sql_str += "\n)";
        if (i < ret_vals.length() - 1){
          sql_str += ",\n";
        } else {
          sql_str += ";\n";
        }
        
      } catch (JSONException ex) {
        Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
    }
    return sql_str;
  }
  
  /**
   * rename method by rules aposteriori
   * @param $method_name
   * @return String
   */
  public String methodRename(String $method_name){
    String $pref = "get", new_method_name;
    if ($method_name.equals("IsAvailableForReceiptOfRequest") 
        || $method_name.equals("IsAvailableForBindStudentPersons") 
        || $method_name.equals("IsAvailableForBindStaffPersons")){
      $pref = "is";
    }
    if ($method_name.equals("LanguageName")){
      $method_name = "NameLanguage";
    }
    new_method_name = $pref + $method_name;
    return new_method_name.replace("_","");
  }
  
  /**
   * Упакування результатів виконання SOAP-функції у JSON-об'єкт
   * @param func JSON-об'єкт даних SOAP-методу
   * @param edbo_type назва класу, що повертається SOAP-функцією
   * @param items результати виконання SOAP-функції
   * @return JSONObject
   */
  public JSONObject packResultsToJson(JSONObject func, String edbo_type, List<Object> items){
    JSONObject jo = new JSONObject();
    if (items == null){
      return this._jsonError("Сталася помилка: проблеми з методом "+"'get"+edbo_type.replace("ArrayOf", "")+"'");
    }
    JSONArray ja = new JSONArray();
    //head
    JSONObject jStruct = new JSONObject();
    JSONArray ret_params = new JSONArray();
    try {
      ret_params = func.getJSONArray("return");
    } catch (JSONException ex) {
      Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
    for (int i = 0; i < ret_params.length(); i++){
      JSONObject jret;
      String name;
      try {
        jret = ret_params.getJSONObject(i);
        name = jret.getString("name");
        if (name.isEmpty()){
          continue;
        }
        jStruct.put(name, jret);
      } catch (JSONException ex) {
        Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
    }
    //body
    for (Object item : items) {
      JSONObject jItems = new JSONObject();
      for (int i = 0; i < ret_params.length(); i++){
        JSONObject jret;
        String name;
        try {
          jret = ret_params.getJSONObject(i);
          name = jret.getString("name");
          if (name.isEmpty()){
            continue;
          }
        } catch (JSONException ex) {
          Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
        String $method_name = this.methodRename(name); // aposteriori
        Object item_value = this.invokeMethod(item,$method_name);
        if (item_value == null){
          return this._jsonError("Сталася помилка: проблеми з методом "+$method_name);
        }
        try {
          jItems.put(name, item_value);
        } catch (JSONException ex) {
          Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
      }
      ja.put(jItems);
    }
    try {
      jo.put("body", ja);
      jo.put("head", jStruct);
    } catch (JSONException ex) {
      Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
    return jo;
  }
  
  /**
   * Обробка випадку, коли SOAP-функція повертає масив
   * @param _package "jEdboPerson" | "jEdboPersonTest"
   * @param func JSON-об'єкт - інформація про функцію SOAP
   * @param edbo_type назва класу, що повертає виконання SOAP-функції
   * @param paramTypes список класів вхідних параметрів SOAP-функції
   * @param paramValues список вхідних параметрів SOAP-функції
   * @param params хеш-мапа REQUET-параметрів
   * @param err_func JSON-об'єкт - інформація про функцію SOAP "GetLastError"
   * @return JSONObject
   */
  public JSONObject getJsonResultForArray(String _package, JSONObject func, String edbo_type, 
          ArrayList<Class> paramTypes, ArrayList <Object> paramValues,
          HashMap <String, String> params, JSONObject err_func){
    JSONObject jo = new JSONObject();
    String func_name = "";
    try {
      func_name = func.getString("name");
    } catch (JSONException ex) {
      Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return this._jsonError("Не знайдено назву функції в JSON-об'єкті: "+func.toString());
    }
    SoapExecutor._debug("З`ясовано: SOAP-функція повертає масив: ввімкнення обробки цього випадку ...");
    Object edboClass_arr_instance = this.createClassInstanceByName(_package+"."+edbo_type);
    Object edboClass_instance = this.createClassInstanceByName(_package+"."+edbo_type.replace("ArrayOf", ""));
    if (edboClass_arr_instance == null){
      return this._jsonError("Не вдалося створити екземпляр класу '"+_package+"."+edbo_type+"'");
    }
    if (edboClass_instance == null){
      return this._jsonError("Не вдалося створити екземпляр класу '"
              +_package+"."+edbo_type.replace("ArrayOf", "")+"'");
    }
    if (edboClass_arr_instance.getClass().getSimpleName().equals("JSONObject")){
      return (JSONObject)edboClass_arr_instance;
    }
    if (edboClass_instance.getClass().getSimpleName().equals("JSONObject")){
      return (JSONObject)edboClass_instance;
    }

    String method_soap_name = "";
    if (func_name.contains("KOATUU")){
      method_soap_name = func_name.replace("KOATUU", "koatuu");
    } else {
      method_soap_name = Introspector.decapitalize(func_name);
    }
    SoapExecutor._debug("Заміна  "+func_name+" --> "+method_soap_name);
    SoapExecutor._debug("Виклик функції invokeMethod з параметрами "
            +"\n\tSOAP-object: "+this.soap.toString()
            +"\n\tfunc_name: "+method_soap_name
            +"\n\tparamTypes: "+paramTypes.toString()
            +"\n\tparamValues: "+paramValues.toString()
            +"\n...");

    edboClass_arr_instance = this.invokeMethod((Object)this.soap, method_soap_name, paramTypes, paramValues);
    SoapExecutor._debug("Виклик функції invokeMethod завершено ");
    if (edboClass_arr_instance == null && !func_name.equals("GetLastError")){
      SoapExecutor._debug("Виклик функції invokeMethod завершено з пустим результатом: виклик GetLastError ...");
      return this.execEdboSoapFunc(err_func, params, err_func);
    }
    if (edboClass_arr_instance == null && func_name.equals("GetLastError")){
      return this._jsonError("Сталася дивна помилка: помилка при запиті на отримання інформації про помилку.");
    }
    if (edboClass_arr_instance.getClass().getSimpleName().equals("String")){
      return this._jsonError((String)edboClass_arr_instance);
    }
    SoapExecutor._debug("Обробка результатів виклику функції invokeMethod ... ");
    Object objGet = this.invokeMethod(edboClass_arr_instance,"get"+edbo_type.replace("ArrayOf", ""));
    if (objGet.getClass().getSimpleName().equals("String")){
      return this._jsonError((String)objGet);
    }
    List<Object> items = (List<Object>)objGet;
    jo = this.packResultsToJson(func,edbo_type,items);
    return jo;
  }
  
  
  /**
   * Обробка випадку, коли SOAP-функція повертає ціле число
   * @param func JSON-об'єкт - інформація про функцію SOAP
   * @param paramTypes список класів вхідних параметрів SOAP-функції
   * @param paramValues список вхідних параметрів SOAP-функції
   * @param params хеш-мапа REQUET-параметрів
   * @param err_func JSON-об'єкт - інформація про функцію SOAP "GetLastError"
   * @return JSONObject
   */
  public JSONObject getJsonResultForInt(JSONObject func,
          ArrayList<Class> paramTypes, ArrayList <Object> paramValues,
          HashMap <String, String> params, JSONObject err_func){
    JSONObject jo = new JSONObject();
    String func_name = "";
    try {
      func_name = func.getString("name");
    } catch (JSONException ex) {
      Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return this._jsonError("Не знайдено назву функції в JSON-об'єкті: "+func.toString());
    }
    SoapExecutor._debug("З`ясовано: SOAP-функція повертає ціле значення: ввімкнення обробки цього випадку ...");
    int return_val = 0;
    String method_soap_name;
    if (func_name.contains("KOATUU")){
      method_soap_name = func_name.replace("KOATUU", "koatuu");
    } else {
      method_soap_name = Introspector.decapitalize(func_name);
    }
    SoapExecutor._debug("Виклик функції invokeMethod з параметрами "
            +"\n\tSOAP-object: "+this.soap.toString()
            +"\n\tfunc_name: "+method_soap_name
            +"\n\tparamTypes: "+paramTypes.toString()
            +"\n\tparamValues: "+paramValues.toString()
            +"\n...");
    Object obj = this.invokeMethod((Object)this.soap, 
              method_soap_name, paramTypes, paramValues);
    if (obj == null){
      return this._jsonError("Очікувалось ціле число, але повернулося пусте значення (NULL).");
    }
    String str = String.valueOf(obj);
    if (obj.getClass().getSimpleName().equals("String")){
      return this._jsonError(str);
    }
    try {
      return_val = Integer.parseInt(str);
    } catch (NumberFormatException ex){
      return this._jsonError("Очікувалось ціле число, але не роспізнано як таке : '"+str+"'");
    }
    SoapExecutor._debug("Виклик функції invokeMethod завершено ");
    if (func_name.equals("ChangePassword")){
      SoapExecutor._debug("Обробка виклику функції ChangePassword ... ");
      if (return_val == 1){
        try {
          jo.put("message", "Пароль змінено.");
          return jo;
        } catch (JSONException ex) {
          Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
      } else if (return_val == 0) {
        if (!func_name.equals("GetLastError")){
          return this.execEdboSoapFunc(err_func, params, err_func);
        }
        try {
          jo.put("error", "Сталася дивна помилка: помилка при запиті на отримання інформації про помилку.");
          return jo;
        } catch (JSONException ex) {
          Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
      }
    }
    if (return_val > 0){
      SoapExecutor._debug("Обробка випадку, коли повернулось значення більше нуля ... ");
      try {
        jo.put("message", "Виконання функції завершилось. Повернулось значення: "
                +String.valueOf(return_val));
      } catch (JSONException ex) {
        Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
    } else {
      SoapExecutor._debug("Обробка випадку, коли повернулось значення менше нуля або нуль ... ");
      try {
        jo.put("message", "Виконання функції завершилось. Повернулось значення: "
                +String.valueOf(return_val));
      } catch (JSONException ex) {
        Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
    }
    return jo;
  }
  
  /**
   * Обробка випадку, коли SOAP-функція повертає строкове значення
   * @param func JSON-об'єкт - інформація про функцію SOAP
   * @param paramTypes список класів вхідних параметрів SOAP-функції
   * @param paramValues список вхідних параметрів SOAP-функції
   * @param params хеш-мапа REQUET-параметрів
   * @param err_func JSON-об'єкт - інформація про функцію SOAP "GetLastError"
   * @return JSONObject
   */
  public JSONObject getJsonResultForString(JSONObject func,
          ArrayList<Class> paramTypes, ArrayList <Object> paramValues,
          HashMap <String, String> params, JSONObject err_func){
    JSONObject jo = new JSONObject();
    String func_name = "";
    try {
      func_name = func.getString("name");
    } catch (JSONException ex) {
      Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return this._jsonError("Не знайдено назву функції в JSON-об'єкті: "+func.toString());
    }
    SoapExecutor._debug("З`ясовано: SOAP-функція повертає строкове значення: ввімкнення обробки цього випадку ...");
    String return_val;
    SoapExecutor._debug("Виклик функції invokeMethod з параметрами "
            +"\n\tSOAP-object: "+this.soap.toString()
            +"\n\tfunc_name: "+Introspector.decapitalize(func_name)
            +"\n\tparamTypes: "+paramTypes.toString()
            +"\n\tparamValues: "+paramValues.toString()
            +"\n...");
    return_val = (String)this.invokeMethod((Object)this.soap, Introspector.decapitalize(func_name), paramTypes, paramValues);
    SoapExecutor._debug("Виклик функції invokeMethod завершено ");
    if (func_name.equals("Login")){
      SoapExecutor._debug("Обробка виклику функції Login ... ");
      if (!return_val.isEmpty() && return_val.matches("^[-0-9a-f]+$")){
        try {
          jo.put("guid", return_val);
          return jo;
        } catch (JSONException ex) {
          Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
      } else {
        try {
          jo.put("error", return_val);
          return jo;
        } catch (JSONException ex) {
          Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
      }
    }
    if (func_name.equals("Logout")){
      SoapExecutor._debug("Обробка виклику функції Logout ... ");
      if (return_val.isEmpty()){
        try {
          jo.put("message", "Успішний вихід");
          return jo;
        } catch (JSONException ex) {
          Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
      } else {
        return this._jsonError(return_val);
      }
    }
    try {
      jo.put("message", return_val);
      return jo;
    } catch (JSONException ex) {
      Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
  }
  
  /**
   * Повертає JSON-об'єкт наступної структури
      * у випадку успіху : <pre><code>{
      *  "body":
      *  [
      *   {
      *    "return_param_name1": "return_param_value1",
      *    "return_param_name2": "return_param_value2",
      *    ...,
      *    "return_param_nameN": "return_param_valueN"
      *   }, {...}, ...
      *  ],
      *  "head": 
      *  {
      *   "return_param_name1":
      *     {"name":"return_param_name1",
      *      "type": "return_param_type1", 
      *      "description": "return_param_description1"},
      *   "return_param_name2":
      *     {"name":"return_param_name2",
      *      "type": "return_param_type2", 
      *      "description": "return_param_description2"},
      *   ...
      *   "return_param_nameN":
      *     {"name":"return_param_nameN,
      *      "type": "return_param_typeN", 
      *      "description": "return_param_descriptionN"}
      *  }
      * }</code></pre><br/>
      * АБО<br/>
      * json-об’єкт <code>{error: "..."}</code> повідомлення у разі невдачі
      * АБО<br/>
      * json-об’єкт <code>{message: "..."}</code> повідомлення в інших випадках
   * @param func інформація SOAP-функції - результат виконання методу getJsonEdboGuidesFuncList() класу FuncList
   * @param params хеш-мапа REQUEST-параметрів
   * @param err_func інформація SOAP-функції GetLastError - результат виконання методу getJsonEdboGuidesFuncList() класу FuncList
   * @return JSONObject
   */
  public JSONObject execEdboSoapFunc(JSONObject func, HashMap<String,String> params, 
          JSONObject err_func) {
    JSONObject jo = new JSONObject();
      String edbo_type = "int";
      ArrayList <Class> paramTypes;
      ArrayList <Object> paramValues;
      paramTypes = new ArrayList<>();
      paramValues = new ArrayList<>();
      edbo_type = this.getReturnClass(func);
      SoapExecutor._debug("З`ясовано: буде повернено клас: "+edbo_type);
      paramTypes = this.getInputParamTypes(func);
      SoapExecutor._debug("З`ясовано: класи вхідних параметрів: "+paramTypes.toString());
      paramValues = this.getInputParamValues(func,params);
      SoapExecutor._debug("З`ясовано: вхідні параметри: "+paramValues.toString());
      String _package = "jEdboPerson";
      if (params.containsKey("test")){
        _package = "jEdboPersonTest";
      }
      if (edbo_type.contains("ArrayOf")){
        //
        return this.getJsonResultForArray(_package,func,edbo_type,
                paramTypes,paramValues,
                params,err_func);
        //
      } else if (edbo_type.equalsIgnoreCase("int")){
        //
        return this.getJsonResultForInt(func,
                paramTypes,paramValues,
                params,err_func);
        //
      } else if (edbo_type.equalsIgnoreCase("string")){
        //
        return this.getJsonResultForString(func,
                paramTypes,paramValues,
                params,err_func);
        //
      }
      
    return jo;
  }
  
 /**
   * Виклик SOAP-функції і виведення результатів
   * @param Guid GUID-ідентифікатор користувача
   * @param calling_func json-об’єкт для SOAP-функції 
   * @param params SOAP input params
   * @param err json-об’єкт для SOAP-функції GetLastError
   * @param callback пуста строка, якщо не тип jsonp, інакше REQUEST-параметр [callback]
   * @param out екземпляр класу PrintWriter
   * @return 
   */
  public synchronized JSONObject execSoap(String Guid, JSONObject calling_func, 
          HashMap <String,String> params,
          JSONObject err,  String callback, PrintWriter out){
    try {
      JSONObject jret; //execEdboSoapFunc result
      JSONObject jerr = new JSONObject(); //json for error
      String func_name; //SOAP-function name
      JSONArray funcJSON_arr; //body of this.soapResultJSON
      JSONArray jret_arr;// body of jret
      BufferedWriter sql_out = null;
      String sql = this.getSqlTableStruct(calling_func);
      this.soapResultJSON = new JSONObject();

      func_name = calling_func.getString("name");
      this.fileSQL = new File(FuncList.getWorkingAbsolutePath()+"/sql/"
              +func_name.replace("Get", "")+".sql");
      
      if ((Guid == null || Guid.isEmpty()) && !func_name.equals("Login")){
        jerr.put("error","Дія заборонена для НЕавторизованого користувача");
        out.println(this.jResponseString(callback, jerr));
        SoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
        SoapExecutor._debug("=========================");
        return null;
      }
      SoapExecutor._debug("Виклик методу execEdboSoapFunc для SOAP-функції '"+func_name+"' ...");
      jret = this.execEdboSoapFunc(calling_func, params, err);
      if (jret.has("error") || jret.has("message")){
        SoapExecutor._debug("Отримано сповіщення.");
        out.println(this.jResponseString(callback, jret));
        SoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
        SoapExecutor._debug("=========================");
        return jret;
      }
      if (jret.has("guid")){
        SoapExecutor._debug("Отримано GUID сесії.");
        out.println(this.jResponseString(callback, jret));
        SoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
        SoapExecutor._debug("=========================");
        return jret;
      }
      if (!jret.has("body") 
              || (jret.getJSONArray("body") == null)
              || (jret.getJSONArray("body").length() == 0)){
        jerr.put("error","Не отримано дані після виклику SOAP-функції '"
                +func_name+"' з параметрами\n  "+params.toString());
        out.println(this.jResponseString(callback, jerr));
        SoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
        SoapExecutor._debug("=========================");
        return jret;
      }
      SoapExecutor._debug("Ініціалізація атрибуту soapResultJSON ...");
      this.soapResultJSON.put("head", jret.get("head"));
      this.soapResultJSON.put("body", new JSONArray());
      jret_arr = jret.getJSONArray("body");
      SoapExecutor._debug("Отримали масив (кількість елементів: "+jret_arr.length()+")");
      funcJSON_arr = this.soapResultJSON.getJSONArray("body");
      SoapExecutor._debug("Запис у SQL-файл ... ");
      try  {
        sql_out = new BufferedWriter( new FileWriter(this.fileSQL, false));
        sql_out.write(sql);
        sql_out.close();
      }
      catch (IOException e){
          jerr.put("error",this.fileSQL.getAbsolutePath()+" не відкрився.");
          out.println(this.jResponseString(callback, jerr));
          SoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
          SoapExecutor._debug("=========================");
          return jret;
      }
      //LOOP
      for (int i = 0; i < jret_arr.length(); i++){
        JSONObject jitem = jret_arr.getJSONObject(i);
        String resultInsertSQL = "";
        resultInsertSQL += "insert into "+func_name.replace("Get", "")+" (\n";
        Iterator iter = jitem.keys();
        for (Object obj=iter.next();(obj != null);obj=iter.next()){
          String key = (String)obj;
          resultInsertSQL += key;
          if (iter.hasNext()){
            resultInsertSQL += ",\n";
          } else {
            break;
          }
        }
        resultInsertSQL += "\n)\n values \n";
        Iterator iter2 = jitem.keys();
        resultInsertSQL += "(\n";
        for (Object obj=iter2.next();(obj != null);obj=iter2.next()){
          String key = (String)obj;
          String val = String.valueOf(jitem.get(key));
          resultInsertSQL += "'" + val.replace("'", "`") + "'";
          if (iter2.hasNext()){
            resultInsertSQL += ",\n";
          } else {
            break;
          }
        }
        resultInsertSQL += "\n);\n";
        SoapExecutor._debug("Запис у SQL-файл ... ");
        try  {
          sql_out = new BufferedWriter( new FileWriter(this.fileSQL, true));
          sql_out.write(resultInsertSQL);
          sql_out.close();
        }
        catch (IOException e){
            jerr.put("error",this.fileSQL.getAbsolutePath()+" не відкрився.");
            out.println(this.jResponseString(callback, jerr));
            SoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
            SoapExecutor._debug("=========================");
            return jret;
        }
        funcJSON_arr.put(jitem);
      }
      //END LOOP
      SoapExecutor._debug("Вийшли з циклу.");
      SoapExecutor._debug("Перевизначення soapResultJSON, тепер масив body має розмір = "
              +funcJSON_arr.length()+".");
      this.soapResultJSON.put("body", funcJSON_arr);
      FileInputStream ifstream;
      try {
        ifstream = new FileInputStream(this.fileSQL);
        byte[] sql_data = new byte[(int) this.fileSQL.length()];
        ifstream.read(sql_data);
        String str = new String(sql_data, "UTF-8");
        sql = str;
        ifstream.close();
      } catch (IOException ex) {
        Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      }
      try {
        this.soapResultJSON.put("sql", sql);
      } catch (JSONException ex) {
        Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      }
      out.println(this.jResponseString(callback, 
              this.soapResultJSON));
      SoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      SoapExecutor._debug("=========================");
      JSONObject retJ = this.soapResultJSON;
      this.soapResultJSON = null;
      return retJ;
      //
    } catch (JSONException ex) {
      SoapExecutor._debug("Сталася помилка під час виклику методу `execSoap` .");
      Logger.getLogger(PersonSoapExecutor.class.getName()).log(Level.SEVERE, null, ex);
      this.soapResultJSON = null;
      return null;
    }
  }


}
