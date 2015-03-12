/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jSoapCommon;

import jEdboGuides.GuidesServlet;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author sysadmin
 */
public class SoapExecutor {
  public Object soap;
  
  protected String getCurrentTime(){
    DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
    Date date = new Date();
    String actual_datetime = dateFormat.format(date);
    return actual_datetime;
  }
  
  public static void _debug(String info){
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
      err = "! Помилка: метод '"+methodName+"' не існує для класу '"
              +o.getClass().getSimpleName()+"'.";
      GuidesSoapExecutor._debug(err);
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    } catch (SecurityException ex) {
      err = "! Помилка: метод '"+methodName+"' не дозволено викликати для екземплярів класу '"
              +o.getClass().getSimpleName()+"'.";
      GuidesSoapExecutor._debug(err);
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    }
    try {
      result = m.invoke(o, paramValues.toArray());
    } catch (InvocationTargetException | IllegalAccessException ex) {
      err = "! Помилка: проблеми з методом '"+methodName+"' класу '"
              +o.getClass().getSimpleName()+"'.";
      GuidesSoapExecutor._debug(err);
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
      err = "! Помилка: метод '"+methodName+"' не існує для класу '"
              +o.getClass().getSimpleName()+"'.";
      GuidesSoapExecutor._debug(err);
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    } catch (SecurityException ex) {
      err = "! Помилка: метод '"+methodName+"' не дозволено викликати для екземплярів класу '"
              +o.getClass().getSimpleName()+"'.";
      GuidesSoapExecutor._debug(err);
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return err;
    }
    try {
      result = m.invoke(o);
    } catch (InvocationTargetException | IllegalAccessException ex) {
      err = "! Помилка: проблеми з методом '"+methodName+"' класу '"
              +o.getClass().getSimpleName()+"'.";
      GuidesSoapExecutor._debug(err);
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
    GuidesSoapExecutor._debug("Тип даних зворотнього звязку: "+retClassName);
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
    try {  
      classItself = Class.forName(className);
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return this._jsonError("Клас '"+className+"' не знайдено");
    }
    GuidesSoapExecutor._debug("Створено клас "+className);

    Constructor<?> classConstructor;

    try {
      classConstructor= classItself.getConstructor();
    } catch (NoSuchMethodException | SecurityException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return this._jsonError("Клас '"+className+"' не ініціалізується.");
    }
    GuidesSoapExecutor._debug("Створено конструктор класу '"+className+"'");

    Object classInstance;

    try {
      classInstance= classConstructor.newInstance();
    } catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException ex) {
      Logger.getLogger(GuidesServlet.class.getName()).log(Level.SEVERE, null, ex);
      return this._jsonError("Не вдалося створити екземпляр класу '"+className+"' .");
    }
    GuidesSoapExecutor._debug("Створено екземпляр класу "+className);
    return classInstance;
  }
  

}
