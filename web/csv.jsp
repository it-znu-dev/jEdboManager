<%-- 
    Document   : index
    Author     : Синєпольський Ігор
--%>
<%@page import="java.text.DateFormat"%>

 <% 
  DateFormat df = new java.text.SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
  DateFormat dfr = new java.text.SimpleDateFormat("dd.MM.yyyy"); 
  //GET params
  request.setCharacterEncoding("UTF-8");
  
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jEDEBO - CSV Preparator</title>
        
        <link rel="stylesheet" href="own/css/main.css" type="text/css" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css" />
        <style>
          textarea {
            width: 100%;
          }
        </style>
        
        <script type="text/javascript">
          if(typeof jQuery === "undefined"){
            document.write('<script type="text/javascript" '
             +'src="own/js/jquery-1.11.1.min.js"><\/script>');
          }
          
        </script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="own/js/jquery.blockUI.js"></script>
        
        <script type="text/javascript">
          $(function(){
            $("#receive_transform").click(function(){
              var pre_text = $("#receive_pre").val();
              var text = "";
              var step1_result = pre_text.replace(/;/g," ");
              var step2_result = step1_result.replace(/[\r\n]Тип: ([a-zA-Z]+)[\r\n]/g,";$1;");
              var step3_result = step2_result.replace(/[\r\n][0-9]+[\r\n]Web\s+сервис\s+EDBOPerson\s+v\s+0\.52[\r\n]2014[\r\n]/g,"");
              var step4_result = step3_result;
              for (var i = 0; i < 100; i++){
                var step4_result = step4_result.replace(/[\r\n]([^;\r\n]+[\r\n])/g," $1");
              }
              text = step4_result;
              $("#receive").val(text);
              return false;
            });
            
            $("#return_transform").click(function(){
              var pre_text = $("#return_pre").val();
              var text = "";
              var step1_result = pre_text.replace(/;/g," ");
              
              var step2_result = step1_result.replace(/Web\s+сервис\s+EDBOPerson\s+v\s+0\.52[\r\n][0-9]+[\r\n]2014[\r\n]/g,"");
              var step3_result = step2_result.replace(/([a-zA-Z_0-9]+)\s+([a-zA-Z_0-9]+)\s+([^\r\n]+)[\r\n]/g,"$1;$2;$3\r\n");
              var step4_result = step3_result;
              for (var i = 0; i < 100; i++){
                var step4_result = step4_result.replace(/[\r\n]([^;\r\n]+[\r\n])/g," $1");
              }
              text = step4_result;
              $("#return").val(text);
              return false;
            });
            
          });
        </script>
    </head>
    
    
<body >
  <div class="mycontainer">
    <div class="row">
      
      <div class="col-xs-12 well well-sm">
        <div class="col-xs-12">
          CSV для вхідних параметрів
        </div>
        <div class="col-xs-5 well well-sm">
          <textarea id="receive_pre" rows="15"></textarea>
        </div>
        <div class="col-xs-2 centered">
          <button class="btn btn-sm btn-success" id="receive_transform">
            <span class="glyphicon glyphicon-arrow-right"></span>
          </button>
        </div>
        <div class="col-xs-5 well well-sm">
          <textarea id="receive" rows="15"></textarea>
        </div>
      </div>
      
    </div>
    <div class="row">
      
      <div class="col-xs-12 well well-sm">
        <div class="col-xs-12">
          CSV для вихідних параметрів
        </div>
        <div class="col-xs-5 well well-sm">
          <textarea id="return_pre" rows="15"></textarea>
        </div>
        <div class="col-xs-2 centered">
          <button class="btn btn-sm btn-success" id="return_transform">
            <span class="glyphicon glyphicon-arrow-right"></span>
          </button>
        </div>
        <div class="col-xs-5 well well-sm">
          <textarea id="return" rows="15"></textarea>
        </div>
      </div>
      
    </div>
  </div>
  
  <footer>
    <p class="footer">
      Сторінку сформовано  
    <%= df.format((new java.util.Date()))
    %>
    </p>
  </footer>
</body>


</html>