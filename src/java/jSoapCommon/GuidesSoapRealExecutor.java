/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jSoapCommon;

import jFuncList.FuncList;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


/**
 *
 * @author sinepolksy
 */
public class GuidesSoapRealExecutor extends GuidesSoapExecutor {
  
  public GuidesSoapRealExecutor(){
    GuidesSoapRealExecutor._debug("Створення об’єкта класу jEdboGuides.EDBOGuides ...");
    jEdboGuides.EDBOGuides eg = new jEdboGuides.EDBOGuides();
    GuidesSoapRealExecutor._debug("Створено!");
    GuidesSoapRealExecutor._debug("Створення об’єкта класу jEdboGuides.EDBOGuidesSoap ...");
    jEdboGuides.EDBOGuidesSoap egs = eg.getEDBOGuidesSoap();
    GuidesSoapRealExecutor._debug("Створено!");
    this.edbo_guides = eg;
    this.soap = egs;
  }
  
  /**
   * Окремий випадок для збірки даних КОАТУУ усіх рівнів
   * @param Guid GUID-ідентифікатор користувача
   * @param koatuu1 json-об’єкт для SOAP-функції KOATUUGetL1
   * @param koatuu2 json-об’єкт для SOAP-функції KOATUUGetL2
   * @param koatuu3 json-об’єкт для SOAP-функції KOATUUGetL3
   * @param err json-об’єкт для SOAP-функції GetLastError
   * @param callback пуста строка, якщо не тип jsonp, інакше REQUEST-параметр [callback]
   * @param out екземпляр класу PrintWriter
   * @param level рівень КОАТУУ (1|2|3)
   * @param add_param параметр KOATUUCodeL1 або KOATUUCodeL2 або null
   */
  public synchronized void koatuuExecSoap(String Guid, JSONObject koatuu1, 
          JSONObject koatuu2, JSONObject koatuu3, 
          JSONObject err,  String callback, PrintWriter out,
          int level, String add_param){
    try {
      this.fileSQL = new File(FuncList.getWorkingAbsolutePath()+"/sql/koatuu.sql");
      JSONObject jret; //execEdboSoapFunc result
      JSONObject koatuu = null; // koatuu1|koatuu2|koatuu3
      HashMap <String,String> params = new HashMap(); //SOAP input params
      JSONObject jerr = new JSONObject(); //json for error
      String func_name; //SOAP-function name
      JSONArray koatuuJSON_arr; //body of this.soapResultJSON
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
      
      params.put("SessionGUID", Guid);
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
      if ((Guid == null || Guid.isEmpty())){
        jerr.put("error","Дія заборонена для НЕавторизованого користувача");
        out.println(this.jResponseString(callback, jerr));
        GuidesSoapExecutor._debug("Знищення об’єкта this.koatuuJSON .");
        GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
        GuidesSoapExecutor._debug("=========================");
        return ;
      }
      GuidesSoapExecutor._debug("Виклик методу koatuuExecSoap для SOAP-функції '"+func_name+"' ...");
      jret = this.execEdboSoapFunc(koatuu, params, err);
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
      if (this.soapResultJSON == null || !this.soapResultJSON.has("head")){
        if (level > 1){
          GuidesSoapExecutor._debug("Для level > 1 повинен бути встановлений атрибут `head`");
          GuidesSoapExecutor._debug(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
          GuidesSoapExecutor._debug("Вихід з рівня #"+level);
          GuidesSoapExecutor._debug("```````````````````````````````````````");
          return ;
        }
        GuidesSoapExecutor._debug("Ініціалізація атрибуту soapResultJSON ...");
        this.soapResultJSON = new JSONObject();
        this.soapResultJSON.put("head", jret.get("head"));
        this.soapResultJSON.put("body", new JSONArray());
      }
      jret_arr = jret.getJSONArray("body");
      GuidesSoapExecutor._debug("Отримали масив (кількість елементів: "+jret_arr.length()+")");
      //GuidesSoapExecutor._debug("Атрибут soapResultJSON зараз = "+this.soapResultJSON.toString());
      koatuuJSON_arr = new JSONArray();
      if (this.soapResultJSON.has("body")){
        koatuuJSON_arr = this.soapResultJSON.getJSONArray("body");
      } else {
        GuidesSoapExecutor._debug("ІНФО: json-об’єкт body атрибуту soapResultJSON має пусте значення!");
      }
      if (level == 1){
        GuidesSoapExecutor._debug("Запис у SQL-файл ... ");
        try  {
          sql_out = new BufferedWriter( new FileWriter(this.fileSQL, (level > 1)));
          sql_out.write(sql);
          sql_out.close();
        }
        catch (IOException e){
            jerr.put("error",this.fileSQL.getAbsolutePath()+" не відкрився.");
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
          sql_out = new BufferedWriter( new FileWriter(this.fileSQL, true));
          sql_out.write(koatuuInsertSQL);
          sql_out.close();
        }
        catch (IOException e){
            jerr.put("error",this.fileSQL.getAbsolutePath()+" не відкрився.");
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
          this.soapResultJSON.put("body", koatuuJSON_arr);
          //РЕКУРСИВНО
          this.koatuuExecSoap(Guid, koatuu1, 
            koatuu2, koatuu3, err, callback, out,
            level+1, add__param);
        }
      }
      //END LOOP
      GuidesSoapExecutor._debug("Вийшли з циклу.");
      GuidesSoapExecutor._debug("Перевизначення koatuuJSON, тепер масив body має розмір = "+koatuuJSON_arr.length()+".");
      this.soapResultJSON.put("body", koatuuJSON_arr);
      if (level > 1){
        GuidesSoapExecutor._debug(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
        GuidesSoapExecutor._debug("Вихід з рівня #"+level);
        GuidesSoapExecutor._debug("```````````````````````````````````````");
        return ;
      }
      FileInputStream ifstream;
      try {
        ifstream = new FileInputStream(this.fileSQL);
        byte[] sql_data = new byte[(int) this.fileSQL.length()];
        ifstream.read(sql_data);
        String str = new String(sql_data, "UTF-8");
        sql = str;
        ifstream.close();
      } catch (IOException ex) {
        Logger.getLogger(GuidesSoapRealExecutor.class.getName()).log(Level.SEVERE, null, ex);
      }
      try {
        this.soapResultJSON.put("sql", sql);
      } catch (JSONException ex) {
        Logger.getLogger(GuidesSoapRealExecutor.class.getName()).log(Level.SEVERE, null, ex);
      }
      if (this.soapResultJSON.has("head")){
        out.println(this.jResponseString(callback, 
                this.soapResultJSON));
      } else {
        jerr.put("error","Не отримано список атрибутів (head).");
        out.println(this.jResponseString(callback, jerr));
      }
      GuidesSoapExecutor._debug("Знищення об’єкта this.koatuuJSON .");
      this.soapResultJSON = new JSONObject();
      GuidesSoapExecutor._debug("Завершення обробки REQUESТ-запиту "+this.getCurrentTime()+".");
      GuidesSoapExecutor._debug("=========================");
      //
    } catch (JSONException ex) {
      GuidesSoapExecutor._debug("Сталася помилка під час виклику методу `koatuuExecSoap` .");
      Logger.getLogger(GuidesSoapRealExecutor.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  
}
