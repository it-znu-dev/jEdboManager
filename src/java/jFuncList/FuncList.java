/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jFuncList;

import com.opencsv.CSVReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author sinepolsky
 */
public class FuncList {
  /**
   * Статичний метод - повертає абсолютний шлях директорії проекту
   * @return String
   */
  public static String getWorkingAbsolutePath(){
    String path_to =  new File(
          new File(
            new File(
              new File(
                new File(
                  new File(FuncListServlet.class.getProtectionDomain().getCodeSource().getLocation().getPath())
                  .getAbsoluteFile().getParent())
                .getAbsoluteFile().getParent())
              .getAbsoluteFile().getParent())
            .getAbsoluteFile().getParent())
          .getAbsoluteFile().getParent())
        .getAbsoluteFile().getParent();
    return path_to;
  }
  
  /**
   * Повертає назви SOAP-функцій
   * @param folder - csv placed directory
   * @return масив строк - назви SOAP-функцій
   * @throws IOException 
   */
  public ArrayList<String> getEdboFuncNames(String folder) throws IOException{
    HashSet <String> funcNames = new HashSet<>();
    ArrayList <String> afuncNames = new ArrayList<>();
    String dir_path = FuncList.getWorkingAbsolutePath() + "/"+folder;
    File dir = new File(dir_path);
    File[] files = dir.listFiles();
    for (File f : files) {
      String f_str = f.getName();
      Pattern pattern__receive = Pattern.compile("(.+)__receive\\.csv");
      Pattern pattern__return = Pattern.compile("(.+)__return\\.csv");
      Matcher matcher__receive = pattern__receive.matcher(f_str);
      Matcher matcher__return = pattern__return.matcher(f_str);
      //System.out.println(f_str);
      if (matcher__receive.matches()){
        funcNames.add(matcher__receive.group(1));
        //System.out.println(f_str);
      }
      if (matcher__return.matches()){
        funcNames.add(matcher__return.group(1));
        //System.out.println(f_str);
      }
    }
    Object [] func_names = funcNames.toArray();
    for (Object func_name : func_names) {
      afuncNames.add((String) func_name);
    }
    Collections.sort(afuncNames.subList(0, afuncNames.size()));
    return afuncNames;
  }
  
  /**
   * Формується двомірний масив рядків на основі даних csv-файлу в директорії 
   * <code>{FuncList.getWorkingAbsolutePath()}</code> / guides_csv
   * @param folder csv placed directory
   * @param csv_file_name назва файлу CSV
   * @param separator символ розділювач
   * @return ArrayList<ArrayList<>>
   */
  public ArrayList<ArrayList<String>> getEdboCsvContent(String folder, String csv_file_name, char separator){
    ArrayList<ArrayList<String>> csvData = new ArrayList<>();
    String absolute_path_to_csv = FuncList.getWorkingAbsolutePath()+"/"+folder+"/"+csv_file_name;
    //System.out.println(org.apache.commons.lang.StringEscapeUtils.unescapeHtml("&gt;&nbsp;&lt;"));
    CSVReader reader = null;
    try{
      //Get the CSVReader instance with specifying the delimiter to be used
      reader = new CSVReader( 
        new InputStreamReader(
          new FileInputStream(absolute_path_to_csv), 
          "UTF-8"
        ), 
        separator
      );
      String [] nextLine;
      //Read one line at a time
      while ((nextLine = reader.readNext()) != null){
        ArrayList<String> csvLine = new ArrayList<>();
        csvLine.addAll(Arrays.asList(nextLine));
        csvData.add(csvLine);
      }
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    finally {
      try {
        reader.close();
      } catch (IOException e) {
        System.out.println(e.getMessage());
      }
    }
    return csvData;
  }
  
  /**
   * Повертає Json-масив даних наступної структури
   * <pre><code>
   * [
   *  {
   *   "name": "назва_функції",
   *   "receive": [{"name": "назва_параметра", "type":"тип", "description": "опис"}, {...}, ...],
   *   "return": [{"name": "назва_параметра", "type":"тип", "description": "опис"}, {...}, ...]
   *  }
   * ]
   * </code></pre>
   * @param folder csv placed directory
   * @return JSONArray
   * @throws IOException
   * @throws JSONException 
   */
  public JSONArray getJsonEdboFuncList(String folder) throws IOException, JSONException{
    JSONArray ja = new JSONArray();
    String[] keys = {"name","type","description"};
    for (int i = 0; i < this.getEdboFuncNames(folder).size(); i++){
      JSONObject j_o = new JSONObject();
      String csv_receive_path = FuncList.getWorkingAbsolutePath()+"/"+folder+"/"+this.getEdboFuncNames(folder).get(i)+"__receive.csv";
      String csv_return_path = FuncList.getWorkingAbsolutePath()+"/"+folder+"/"+this.getEdboFuncNames(folder).get(i)+"__return.csv";
      File f_receive = new File(csv_receive_path);
      File f_return = new File(csv_return_path);
      if (f_receive.exists()){
        JSONArray j_receive = new JSONArray();
        String csv_file = this.getEdboFuncNames(folder).get(i)+"__receive.csv";
        ArrayList <ArrayList<String> > csvArr = this.getEdboCsvContent(folder,csv_file, ';');
        for (ArrayList<String> csvArr_line : csvArr) {
          int k = 0;
          JSONObject j__o = new JSONObject();
          for (String csvArr_item : csvArr_line) {
            j__o.put(keys[k],csvArr_item);
            k++;
          }
          j_receive.put(j__o);
        }
        j_o.put("receive", j_receive);
      }        
      if (f_return.exists()){
        JSONArray j_return = new JSONArray();
        String csv_file_ret = this.getEdboFuncNames(folder).get(i)+"__return.csv";
        ArrayList <ArrayList<String> > csvRetArr = this.getEdboCsvContent(folder,csv_file_ret, ';');
        for (ArrayList<String> csvArr_line : csvRetArr) {
          int k = 0;
          JSONObject j__o = new JSONObject();
          for (String csvArr_item : csvArr_line) {
            j__o.put(keys[k],csvArr_item);
            k++;
          }
          j_return.put(j__o);
        }
        j_o.put("return", j_return);
      }
      j_o.put("name",this.getEdboFuncNames(folder).get(i));
      ja.put(j_o);
    }
    return ja;
  }
  

  /**
   * Повертає Json-масив даних наступної структури
   * <pre><code>
   * [
   *  {
   *   "name": "назва_функції",
   *   "receive": [{"name": "назва_параметра", "type":"тип", "description": "опис"}, {...}, ...],
   *   "return": [{"name": "назва_параметра", "type":"тип", "description": "опис"}, {...}, ...]
   *  }
   * ]
   * </code></pre>
   * @return
   * @throws IOException
   * @throws JSONException 
   */
  public JSONArray getJsonEdboGuidesFuncList() throws IOException, JSONException{
    return this.getJsonEdboFuncList("guides_csv");
  }
  
  /**
   * Повертає Json-масив даних наступної структури
   * <pre><code>
   * [
   *  {
   *   "name": "назва_функції",
   *   "receive": [{"name": "назва_параметра", "type":"тип", "description": "опис"}, {...}, ...],
   *   "return": [{"name": "назва_параметра", "type":"тип", "description": "опис"}, {...}, ...]
   *  }
   * ]
   * </code></pre>
   * @return
   * @throws IOException
   * @throws JSONException 
   */
  public JSONArray getJsonEdboPersonFuncList() throws IOException, JSONException{
    return this.getJsonEdboFuncList("person_csv");
  }

}
