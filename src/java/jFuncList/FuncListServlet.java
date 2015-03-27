/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jFuncList;

import jSoapCommon.GuidesSoapExecutor;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author sinepolsky
 */
@WebServlet(name = "FuncListServlet", urlPatterns = {"/FuncListServlet"})
public class FuncListServlet extends HttpServlet {
  
  /**
   * Формування в залежності від способу взаємодії (json|jsonp)
   * відповіді дії сервлету
   * @param callback callback-рядок у випадку кросдоменної AJAX-взаємодії
   * @param jo json-масив, який буде виведено
   * @return строкове представлення json-об’єкту
   */
  public String jResponseString(String callback, JSONArray jo){
    if (callback == null || callback.isEmpty()){
      return jo.toString();
    }
    return callback 
            + "("+ jo.toString() + ")";
  }
  
  /**
   * Формування в залежності від способу взаємодії (json|jsonp)
   * відповіді дії сервлету
   * @param callback callback-рядок у випадку кросдоменної AJAX-взаємодії
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
  
  public void outEdboFuncList(JSONArray ja, PrintWriter out) throws IOException, JSONException{
    String[] styles = {" style='background-color: #ddd;'",""};
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");  
      out.println("<meta charset=\"utf-8\" />");  
      out.println("<title>Servlet FuncList</title>");      
      out.println("</head>");
      out.println("<body>");
      out.println("<script>\nvar t = "+ja.toString()+";\nconsole.log(t);\n</script>");
      //out.println("<h1>Servlet FuncListServlet at " + request.getContextPath() + "</h1>");
      out.println("<table border=1>");
      for (int i = 0; i < ja.length(); i++){
        JSONObject jo = ja.getJSONObject(i);
        if (!jo.has("name")){
          continue;
        }
        String func_name = jo.getString("name");
        out.println("<tr"+styles[i%2]+"><th colspan='3'>"+func_name+"</th></tr>");
        if (jo.has("receive")){
          out.println("<tr"+styles[i%2]+"><th colspan='3'>приймає</th></tr>");
          JSONArray receive_array = (JSONArray)jo.get("receive");
          for (int j = 0; j < receive_array.length(); j++) {
            JSONObject receive_item = receive_array.getJSONObject(j);
            if (!receive_item.has("name") 
                    || !receive_item.has("type") 
                    || !receive_item.has("description")){
              continue;
            }
            if (receive_item.getString("name").isEmpty()){
              continue;
            }
            out.println("<tr"+styles[i%2]+">");
            out.println("<td>"+receive_item.getString("name")+"</td>");
            out.println("<td>"+receive_item.getString("type")+"</td>");
            out.println("<td>"+receive_item.getString("description")+"</td>");
            out.println("</tr>");
          }
        }
        if (jo.has("return")){
          JSONArray return_array = (JSONArray)jo.get("return");
          for (int j = 0; j < return_array.length(); j++) {
            JSONObject return_item = return_array.getJSONObject(j);
            if (return_item.has("type") && j == 0 && return_item.has("name") 
                    && return_item.getString("name").isEmpty()){
              if (return_item.getString("type").equalsIgnoreCase("int")){
                out.println("<tr"+styles[i%2]+"><th colspan='3'>повертає значення типу "
                      +return_item.getString("type")+"</th></tr>");
              } else if (return_item.getString("type").equalsIgnoreCase("string")){
                out.println("<tr"+styles[i%2]+"><th colspan='3'>повертає значення типу "
                      +return_item.getString("type")+"</th></tr>");
              } else {
                out.println("<tr"+styles[i%2]+"><th colspan='3'>повертає масив структур "
                      +return_item.getString("type")+"</th></tr>");
              }
            } else if (j == 0){
              out.println("<tr"+styles[i%2]+"><th colspan='3'>повертає</th></tr>");
            }
            if (!return_item.has("name") 
                    || !return_item.has("type") 
                    || !return_item.has("description")){
              continue;
            }
            if (return_item.getString("name").isEmpty()){
              continue;
            }
            out.println("<tr"+styles[i%2]+">");
            out.println("<td>"+return_item.getString("name")+"</td>");
            out.println("<td>"+return_item.getString("type")+"</td>");
            out.println("<td>"+return_item.getString("description")+"</td>");
            out.println("</tr>");
          }
        }
        out.println("<tr style='background-color: yellow;'><th colspan='3'>============</th></tr>");
      }
      out.println("</table>");
      out.println("</body>");
      out.println("</html>");
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
          throws ServletException, IOException, JSONException {
    response.setContentType("text/html;charset=UTF-8");
    FuncList fl = new FuncList();
    BufferedWriter csv_receive_out = null;
    BufferedWriter csv_return_out = null;
    try (PrintWriter out = response.getWriter()) {
      String guides = request.getParameter("guides");
      String person = request.getParameter("person");
      String callback = request.getParameter("callback");
      String to_html = request.getParameter("html");
      
      String receive_content = request.getParameter("receive_content");
      String return_content = request.getParameter("return_content");
      String csv_dir = request.getParameter("csv_dir");
      String func_name = request.getParameter("func_name");
      
      if (guides != null){
        if (to_html == null){
          JSONArray ja = fl.getJsonEdboGuidesFuncList();
          out.println(this.jResponseString(callback,ja));
          return ;
        }
        JSONArray ja = fl.getJsonEdboGuidesFuncList();
        this.outEdboFuncList(ja,out);
      }
      if (person != null){
        if (to_html == null){
          JSONArray ja = fl.getJsonEdboPersonFuncList();
          out.println(this.jResponseString(callback,ja));
          return ;
        }
        JSONArray ja = fl.getJsonEdboPersonFuncList();
        this.outEdboFuncList(ja,out);
      }
      if (return_content != null 
              && receive_content != null 
              && csv_dir != null
              && func_name != null){
        String csv_receive = FuncList.getWorkingAbsolutePath() 
                + "/" + csv_dir + "/" + func_name + "__receive.csv";
        String csv_return = FuncList.getWorkingAbsolutePath() 
                + "/" + csv_dir + "/" + func_name + "__return.csv";
        File fcsv_receive = new File(csv_receive);
        File fcsv_return = new File(csv_return);
        //write receive signatures
        try  {
          csv_receive_out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fcsv_receive, false), "UTF-8"));
          csv_receive_out.write(receive_content);
          csv_receive_out.close();
          //write return signatures
          try  {
            csv_return_out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fcsv_return, false), "UTF-8"));
            csv_return_out.write(return_content);
            csv_return_out.close();
          }
          catch (IOException e){ //catch write return signatures exception
              JSONObject jerr = new JSONObject();
              jerr.put("error",csv_return+" не відкрився.");
              out.println(this.jResponseString(callback, jerr));
              return ;
          }
        }
        catch (IOException e){ //catch write receive signatures exception
            JSONObject jerr = new JSONObject();
            jerr.put("error",csv_receive+" не відкрився.");
            out.println(this.jResponseString(callback, jerr));
            return ;
        }
        JSONObject msg = new JSONObject();
        msg.put("message", "Файли успішно сформовані!");
        out.println(this.jResponseString(callback, msg));
      }
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
      Logger.getLogger(FuncListServlet.class.getName()).log(Level.SEVERE, null, ex);
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
      Logger.getLogger(FuncListServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
