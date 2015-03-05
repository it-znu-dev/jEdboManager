package jEdboGuides;


import java.beans.Introspector;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
  public EDBOGuides edbo_guides;
  public EDBOGuidesSoap soap;
  
  protected String getCurrentTime(){
    DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
    Date date = new Date();
    String actual_datetime = dateFormat.format(date);
    return actual_datetime;
  }
  
  protected void _debug(String info){
    System.out.println(info);
  }
  
  // <editor-fold defaultstate="collapsed" desc="Допоміжні функції для взаємодії з базою ЄДЕБО через SOAP. Click on the + sign on the left to edit the code.">
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
   * Виконання методу з вхідними параметрами (рефлексивно)
   * @param o Об'єкт - екземпляр класу, метод якого буде виконуватись 
   * @param methodName назва методу
   * @param paramTypes ArrayList |Class| - масив типів параметрів (класів)
   * @param paramValues ArrayList |Object|  - масив вхідних параметрів
   * @return результат виконання методу
   */
  public Object invokeMethod(Object o, String methodName, 
          ArrayList<Class> paramTypes, ArrayList<Object> paramValues) {
    Method m = null;
    Object result = null;
    Class[] cls = new Class[paramTypes.size()];
    String err = "";
    int k = 0;
    for (Class cl: paramTypes){
      cls[k++] = cl;
    }
    try {
      m = o.getClass().getDeclaredMethod(methodName, cls);
    } catch (NoSuchMethodException ex) {
      err = "! Помилка: "+methodName+" не існує.";
      System.out.println(err);
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    } catch (SecurityException ex) {
      err = "! Помилка: "+methodName+" недозволено викликати для екземплярів класу.";
      System.out.println(err);
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    }
    try {
      result = m.invoke(o, paramValues.toArray());
    } catch (InvocationTargetException | IllegalAccessException ex) {
      err = "! Помилка: виклик методу "+methodName+" не дозволено.";
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    }
    return result;
  }
  
  /**
   * Виконання методу без вхідних параметрів (рефлексивно)
   * @param o Об'єкт - екземпляр класу, метод якого буде виконуватись
   * @param methodName назва методу
   * @return результат виконання методу
   */
  public Object invokeMethod(Object o, String methodName) {
    Method m = null;
    Object result = null;
    String err = "";
    try {
      m = o.getClass().getDeclaredMethod(methodName);
    } catch (NoSuchMethodException ex) {
      err = "! Помилка: "+methodName+" не існує.";
      System.out.println(err);
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    } catch (SecurityException ex) {
      err = "! Помилка: "+methodName+" недозволено викликати для екземплярів класу.";
      System.out.println(err);
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    }
    try {
      result = m.invoke(o);
    } catch (InvocationTargetException | IllegalAccessException ex) {
      err = "! Помилка: виклик методу "+methodName+" не дозволено.";
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    }
    return result;
  }
  
  /**
   * Повертає Тип (назву класу) даних зворотнього звязку
   * @param func JSON-об'єкт даних SOAP-методу
   * @return назва класу
   */
  public String getReturnClass(JSONObject func){
    String retClassName = "int";
    if (func.has("return")){
      JSONArray ret_params = new JSONArray();
      try {
        ret_params = func.getJSONArray("return");
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return "";
      }
      for (int i = 0; i < ret_params.length(); i++){
        try {
          JSONObject ret ;
          String name, type, descr;
          ret = ret_params.getJSONObject(i);
          name = ret.getString("name");
          type = ret.getString("type");
          descr = ret.getString("description");
          if (name.isEmpty() && descr.isEmpty()){
            if (type.equalsIgnoreCase("int") || type.equalsIgnoreCase("string")){
              retClassName = type;
            } else {
              retClassName = "ArrayOf"+type;
            }
            break;
          }
        } catch (JSONException ex) {
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return "";
        }
      }
    }
    this._debug("Тип даних зворотнього звязку: "+retClassName);
    return retClassName;
  }
  
  /**
   * Повертає список класів вхідних параметрів SOAP-функції
   * @param func JSON-об'єкт даних SOAP-методу
   * @return масив-список класів вхідних параметрів SOAP-функції
   */
  public ArrayList<Class> getInputParamTypes(JSONObject func){
    ArrayList<Class> paramTypes = new ArrayList<>();
    if (func.has("receive")){
      try {
        JSONArray receive_params = new JSONArray();
        receive_params = func.getJSONArray("receive");
        for (int i = 0; i < receive_params.length(); i++){
          JSONObject rec = new JSONObject();
          String name, type;
          rec = receive_params.getJSONObject(i);
          type = rec.getString("type");
          name = rec.getString("name");
          if (name == null || name.isEmpty()){
            continue;
          }
          if (type.equalsIgnoreCase("string")){
            paramTypes.add(String.class);
          }
          if (type.equalsIgnoreCase("int") || type.equalsIgnoreCase("integer")){
            paramTypes.add(int.class);
          }
        }
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return paramTypes;
      }
    }
    return paramTypes;
  }
  
  /**
   * Повертає список значень вхідних параметрів SOAP-функції
   * @param func JSON-об'єкт даних SOAP-методу
   * @param params хеш-мапа вхідних параметрів сервлету
   * @return масив-список значень вхідних параметрів SOAP-функції
   */
  public ArrayList<Object> getInputParamValues(JSONObject func, HashMap<String,String> params){
    ArrayList<Object> paramValues = new ArrayList<>();
    if (func.has("receive")){
      try {
        JSONArray receive_params = new JSONArray();
        receive_params = func.getJSONArray("receive");
        for (int i = 0; i < receive_params.length(); i++){
          JSONObject rec = new JSONObject();
          String name, type;
          rec = receive_params.getJSONObject(i);
          type = rec.getString("type");
          name = rec.getString("name");
          if (name == null || name.isEmpty()){
            continue;
          }
          if (type.equalsIgnoreCase("string")){
            paramValues.add((Object)params.get(name));
          }
          if (type.equalsIgnoreCase("int") || type.equalsIgnoreCase("integer")){
            if (params.get(name).isEmpty()){
              paramValues.add(0);
            } else {
              paramValues.add((Object)Integer.parseInt(params.get(name)));
            }
          }
        }
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return paramValues;
      }
    }
    return paramValues;
  }
  
  /**
   * Створення екземляру класу
   * @param className назва класу, з якого створюється екземпляр
   * @return екземпляр класу
   */
  public Object createClassInstanceByName(String className){
    Class<?> classItself = null;
    JSONObject jo = new JSONObject();
    this._debug("Створення класу "+className+" ...");
    try {  
      classItself = Class.forName(className);
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      try {
        jo.put("error", "Клас "+className+" не знайдено");
        return jo;
      } catch (JSONException ex1) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex1);
        return null;
      }
    }
    this._debug("Створено клас "+className);

    Constructor<?> classConstructor;

    this._debug("Створення конструктора класу "+className+" ...");
    try {
      classConstructor= classItself.getConstructor();
    } catch (NoSuchMethodException | SecurityException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      try {
        jo.put("error", "Клас "+className+" не ініціалізується.");
        return jo;
      } catch (JSONException ex1) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex1);
        return null;
      }
    }
    this._debug("Створено конструктор класу "+className);

    Object classInstance;

    this._debug("Створення екземпляру класу "+className+" ...");
    try {
      classInstance= classConstructor.newInstance();
    } catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      try {
        jo.put("error", "Клас "+className+" не створює екземпляр.");
        return jo;
      } catch (JSONException ex1) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex1);
        return null;
      }
    }
    this._debug("Створено екземпляр класу "+className);
    return classInstance;
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
      try {
        jo.put("error", "Сталася помилка: проблеми з методом "+"get"+edbo_type.replace("ArrayOf", ""));
        return jo;
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
    }
    JSONArray ja = new JSONArray();
    JSONObject jStruct = new JSONObject();
    for (Object item : items) {
      JSONObject jItems = new JSONObject();
      JSONArray ret_params = new JSONArray();
      try {
        ret_params = func.getJSONArray("return");
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
        return null;
      }
      for (int i = 0; i < ret_params.length(); i++){
        JSONObject jret;
        String name="", type="", descr="";
        try {
          jret = ret_params.getJSONObject(i);
          name = jret.getString("name");
          type = jret.getString("type");
          descr = jret.getString("description");
          jStruct.put(name, jret);
        } catch (JSONException ex) {
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
        if (name.isEmpty()){
          continue;
        }
        String $pref = "get";
        String $method_name = name.replace("_","");

        if ($method_name.equals("IsAvailableForReceiptOfRequest") 
            || $method_name.equals("IsAvailableForBindStudentPersons") 
            || $method_name.equals("IsAvailableForBindStaffPersons")){
          $pref = "is";
        }
        if ($method_name.equals("LanguageName")){
          $method_name = "NameLanguage";
        }
        $method_name = $pref + $method_name;
        Object item_value = this.invokeMethod(item,$method_name);
        if (item_value == null){
          try {
            jo.put("error", "Сталася помилка: проблеми з методом "+$method_name);
            return jo;
          } catch (JSONException ex) {
            Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
            return null;
          }
        }
        try {
          jItems.put(name, item_value);
        } catch (JSONException ex) {
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
      }
      ja.put(jItems);
    }
    try {
      jo.put("body", ja);
      jo.put("head", jStruct);
    } catch (JSONException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return null;
    }
    return jo;
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
   * @param func_name назва SOAP-функції
   * @param params хеш-мапа REQUEST-параметрів
   * @param func інформація SOAP-функції - результат виконання методу getJsonEdboGuidesFuncList() класу FuncList
   * @param err_func інформація SOAP-функції GetLastError - результат виконання методу getJsonEdboGuidesFuncList() класу FuncList
   * @return JSONObject
   */
  public JSONObject execEdboSoapFunc(String func_name, HashMap<String,String> params, 
          JSONObject func, JSONObject err_func) {
    JSONObject jo = new JSONObject();
    if (this.jGuid != null && !this.jGuid.isEmpty() && func_name.equals("Login")){
      try {
        jo.put("error", "Дія заборонена для авторизованого користувача");
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
      return jo;
    }
    if ((this.jGuid == null || this.jGuid.isEmpty()) && !func_name.equals("Login")){
      try {
        jo.put("error", "Дія заборонена для неавторизованого користувача");
      } catch (JSONException ex) {
        Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
      return jo;
    }
      String edbo_type = "int";
      ArrayList <Class> paramTypes;
      ArrayList <Object> paramValues;
      paramTypes = new ArrayList<>();
      paramValues = new ArrayList<>();
      this._debug("З`ясування, який клас буде повернений ...");
      edbo_type = this.getReturnClass(func);
      this._debug("З`ясовано: буде повернено клас: "+edbo_type);
      this._debug("З`ясування, які потрібні класи для вхідних параметрів ...");
      paramTypes = this.getInputParamTypes(func);
      this._debug("З`ясовано: класи вхідних параметрів: "+paramTypes.toString());
      this._debug("З`ясування, які потрібні вхідні параметри ...");
      paramValues = this.getInputParamValues(func,params);
      this._debug("З`ясовано: вхідні параметри: "+paramValues.toString());
      
      if (edbo_type.contains("ArrayOf")){
        this._debug("З`ясовано: SOAP-функція повертає масив: ввімкнення обробки цього випадку ...");
        Object edboClass_arr_instance = this.createClassInstanceByName("jEdboGuides."+edbo_type);
        Object edboClass_instance = this.createClassInstanceByName("jEdboGuides."+edbo_type.replace("ArrayOf", ""));
        if (edboClass_arr_instance == null || edboClass_instance == null){
          return null;
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
        this._debug("Заміна  "+func_name+" --> "+method_soap_name);
        this._debug("Виклик функції invokeMethod з параметрами "
                +"\n\tSOAP-object: "+this.soap.toString()
                +"\n\tfunc_name: "+method_soap_name
                +"\n\tparamTypes: "+paramTypes.toString()
                +"\n\tparamValues: "+paramValues.toString()
                +"\n...");
        
        edboClass_arr_instance = this.invokeMethod((Object)this.soap, method_soap_name, paramTypes, paramValues);
        if (edboClass_arr_instance.getClass().getSimpleName().equals("String")){
          try {
            jo.put("error",(String)edboClass_arr_instance);
            return jo;
          } catch (JSONException ex) {
            Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
            return null;
          }
        }
        
        this._debug("Виклик функції invokeMethod завершено ");
        if (edboClass_arr_instance == null && !func_name.equals("GetLastError")){
          this._debug("Виклик функції invokeMethod завершено з пустим результатом: виклик GetLastError ...");
          return this.execEdboSoapFunc("GetLastError", params, err_func, err_func);
        }
        if (edboClass_arr_instance == null && func_name.equals("GetLastError")){
          try {
            jo.put("error", "Сталася дивна помилка: помилка при запиті на отримання інформації про помилку.");
            return jo;
          } catch (JSONException ex) {
            Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
            return null;
          }
        }
        this._debug("Обробка результатів виклику функції invokeMethod ... ");
        List<Object> items = (List<Object>)this.invokeMethod(edboClass_arr_instance,"get"+edbo_type.replace("ArrayOf", ""));
        jo = this.packResultsToJson(func,edbo_type,items);
        return jo;
      } else if (edbo_type.equalsIgnoreCase("int")){
        this._debug("З`ясовано: SOAP-функція повертає ціле значення: ввімкнення обробки цього випадку ...");
        int return_val = 0;
        this._debug("Виклик функції invokeMethod з параметрами "
                +"\n\tSOAP-object: "+this.soap.toString()
                +"\n\tfunc_name: "+Introspector.decapitalize(func_name)
                +"\n\tparamTypes: "+paramTypes.toString()
                +"\n\tparamValues: "+paramValues.toString()
                +"\n...");
        String str = String.valueOf(this.invokeMethod((Object)this.soap, 
                  Introspector.decapitalize(func_name), paramTypes, paramValues));
        try {
          return_val = Integer.parseInt(str);
        } catch (NumberFormatException ex){
            try {
              jo.put("error", "Очікувалось ціле число, але не роспізнано : "+str);
            } catch (JSONException exept) {
              Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, exept);
              return null;
            }
        }
        this._debug("Виклик функції invokeMethod завершено ");
        if (func_name.equals("ChangePassword")){
          if (return_val == 1){
            try {
              jo.put("message", "Пароль змінено.");
              return jo;
            } catch (JSONException ex) {
              Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
              return null;
            }
          } else if (return_val == 0) {
            if (!func_name.equals("GetLastError")){
              return this.execEdboSoapFunc("GetLastError", params, err_func, err_func);
            }
            try {
              jo.put("error", "Сталася дивна помилка: помилка при запиті на отримання інформації про помилку.");
              return jo;
            } catch (JSONException ex) {
              Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
              return null;
            }
          }
        }
        if (return_val > 0){
          try {
            jo.put("message", "Виконання функції завершилось успішно. Повернулось значення: "
                    +String.valueOf(return_val));
          } catch (JSONException ex) {
            Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
            return null;
          }
        } else {
          if (!func_name.equals("GetLastError")){
            return this.execEdboSoapFunc("GetLastError", params, err_func, err_func);
          }
          try {
            jo.put("error", "Сталася дивна помилка: помилка при запиті на отримання інформації про помилку.");
          } catch (JSONException ex) {
            Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
            return null;
          }
        }
        return jo;
      } else if (edbo_type.equalsIgnoreCase("string")){
        this._debug("З`ясовано: SOAP-функція повертає строкове значення: ввімкнення обробки цього випадку ...");
        String return_val;
        this._debug("Виклик функції invokeMethod з параметрами "
                +"\n\tSOAP-object: "+this.soap.toString()
                +"\n\tfunc_name: "+Introspector.decapitalize(func_name)
                +"\n\tparamTypes: "+paramTypes.toString()
                +"\n\tparamValues: "+paramValues.toString()
                +"\n...");
        return_val = (String)this.invokeMethod((Object)this.soap, Introspector.decapitalize(func_name), paramTypes, paramValues);
        this._debug("Виклик функції invokeMethod завершено ");
        if (func_name.equals("Login")){
          if (!return_val.isEmpty() && return_val.matches("^[-0-9a-f]+$")){
            try {
              jo.put("guid", return_val);
              this.jGuid = return_val;
              return jo;
            } catch (JSONException ex) {
              Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
              return null;
            }
          } else {
            try {
              jo.put("error", return_val);
              return jo;
            } catch (JSONException ex) {
              Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
              return null;
            }
          }
        }
        if (func_name.equals("Logout")){
          if (return_val.isEmpty()){
            try {
              jo.put("message", "Успішний вихід");
              this.jGuid = null;
              return jo;
            } catch (JSONException ex) {
              Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
              return null;
            }
          } else {
            try {
              jo.put("error", return_val);
            } catch (JSONException ex) {
              Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
              return null;
            }
          }
          return jo;
        }
        try {
          jo.put("message", return_val);
          return jo;
        } catch (JSONException ex) {
          Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
          return null;
        }
      }
      
    return jo;
  }// </editor-fold>

  
  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   * @throws org.json.JSONException
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException, JSONException {
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
    if (this.edbo_guides == null){
      this._debug("Створення об'єкта класу EDBOGuides ...");
      this.edbo_guides = new EDBOGuides();
      this._debug("Створено об'єкт класу EDBOGuides ...");
      this._debug("Створення об'єкта класу EDBOGuidesSoap ...");
      this.soap = this.edbo_guides.getEDBOGuidesSoap();
      this._debug("Створено об'єкт класу EDBOGuidesSoap ...");
    }
    String callback = request.getParameter("callback");
    String action = 
      ((request.getParameter(this.actionName)==null)? 
            "__undefined__" : request.getParameter(this.actionName));
    
    if (callback == null || callback.isEmpty()){
      response.setContentType("text/json;charset=UTF-8");
    } else {
      //якщо надійшов callback, то очікується тип даних jsonp
      response.setContentType("text/javascript;charset=UTF-8");
    }
    if (action == null || action.isEmpty()){
      action = "";
    }
    jFuncList.FuncList fl = new jFuncList.FuncList();
    JSONArray f_arr = fl.getJsonEdboGuidesFuncList();
    try (PrintWriter out = response.getWriter()) {
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
      JSONObject err = new JSONObject();
      for (int i = 0; i < f_arr.length(); i++){
        JSONObject jo = f_arr.getJSONObject(i);
        String func_name = jo.getString("name");
        if (func_name.equals("GetLastError")){
          this._debug("Знайшли JSON-інфо для GetLastError (#"+String.valueOf(i)+")");
          err = jo;
          break;
        }
      }
      for(String parameter : parameters.keySet()) {
        String pval = params.get(parameter);
        String param = (String)parameter;
        if (pval == null || !pval.isEmpty()){
          for (int i = 0; i < f_arr.length(); i++){
            JSONObject jo = f_arr.getJSONObject(i);
            String func_name = jo.getString("name");
            if (param.equalsIgnoreCase("_$action") 
                    && pval.equals("j"+func_name)){
              this._debug("Знайшли _$action = "+"j"+func_name+" : виклик функції execEdboSoapFunc...");
              
              JSONObject jret = this.execEdboSoapFunc(func_name, params, jo, err);
              
              this._debug("Заверешено виклик функції execEdboSoapFunc.");
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
                }
              }
              if (func_name.equals("Logout")){
                String guid = GuidesServlet.jGuids.get(session.getId());
                if (guid != null){
                  this._debug("Знищення SessionGUID="+guid+" в пам'яті Http-сесії: X("+session.getId()+")X");
                  GuidesServlet.jGuids.remove(session.getId());
                }
              }
              out.println(this.jResponseString(callback, 
                      jret));
              this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
              this._debug("=========================");
              return ;
            }
          }
        }
      }
      switch (action){
        case "__undefined__":
          out.print(f_arr.toString());
          break;
        default:
          out.print(f_arr.toString());
          break;
      }
      this._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      this._debug("=========================");
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
    try {
      processRequest(request, response);
    } catch (JSONException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
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
    try {
      processRequest(request, response);
    } catch (JSONException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
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
