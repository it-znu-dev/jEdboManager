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
        <title>jEDEBO - Simple UI</title>
        
        <link rel="stylesheet" href="own/css/main.css" type="text/css" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css" />
        
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
            var service_url = "GuidesServlet";
            
            var selectText = function (containerid) {
                if (document.selection) {
                    var range = document.body.createTextRange();
                    range.moveToElementText(document.getElementById(containerid));
                    range.select();
                } else if (window.getSelection) {
                    var range = document.createRange();
                    range.selectNode(document.getElementById(containerid));
                    window.getSelection().addRange(range);
                }
            }
            
            var err_func = function (xhr, ajaxOptions, thrownError){
                $.unblockUI();
                console.log(xhr);
                if(xhr.status == 404) {
                    alert('404 (not found): '+thrownError);
                } else {
                  alert(thrownError);
                }
            };
            
            var loading_func = function(){
              $("p.success, p.error").remove();
              var gif_files = [
                "tom-gif.gif",
                "simpsons-gif.gif",
                "Mkhk.gif"];
              var gif_index = Math.round(Math.random()*10000, 0) % gif_files.length;
              var gif_file = gif_files[gif_index];
              $.blockUI({ 
                message: '<h1 style="font-size: 14pt;">'
                        +'<img src="own/'+gif_file+'" style="width: 100%;" />'
                        +'<br/> Зачекайте...</h1>' 
              }); 
            };
            
            var common_success = function(){
              $.unblockUI();
              return true;
            };
            
            var isAttrToShow = function(elem,param_name){
                var attrsToShow;
                if (typeof(param_name) === "undefined"){
                  return false;
                }
                switch (elem){
                  case '#outputLanguagesGet':
                    attrsToShow  = RegExp([
                    'LanguageName\\b'
                    ,'|Id_Language\\b'
                    ,'|Code\\b'
                    ].join(''));
                    break;
                  case '#outputKOATUUGetL1':
                    attrsToShow  = RegExp([
                    'KOATUUFullName\\b'
                    ,'|KOATUUCodeL1\\b'
                    ].join(''));
                    break;
                  case '#outputKOATUUGetL2':
                    attrsToShow  = RegExp([
                    'KOATUUFullName\\b'
                    ,'|KOATUUCodeL2\\b'
                    ].join(''));
                    break;
                  case '#outputKOATUUGetL3':
                    attrsToShow  = RegExp([
                    'KOATUUFullName\\b'
                    ,'|KOATUUCodeL3\\b'
                    ].join(''));
                    break;
                  case '#outputEducationTypesGet':
                    attrsToShow  = RegExp([
                    'Id_EducationType\\b'
                    ,'|EducationOrganizationFullTypeName\\b'
                    ].join(''));
                    break;
                  case '#outputStreetTypesGet':
                    attrsToShow  = RegExp([
                    'Id_StreetType\\b'
                    ,'|StreetTypeFullName\\b'
                    ,'|StreetTypeShortName\\b'
                    ].join(''));
                    break;
                  case '#outputSpecRedactionsGet':
                    attrsToShow  = RegExp([
                    'SpecRedactionCode\\b'
                    ,'|SpecRedactionName\\b'
                    ].join(''));
                    break;
                  case '#outputSpecGet':
                    attrsToShow  = RegExp([
                    '\\bSpecCode\\b'
                    ,'|\\bSpecSpecialityName\\b'
                    ,'|\\bSpecDirectionName\\b'
                    ,'|\\bSpecIndastryName\\b'
                    ,'|\\bSpecSpecializationName\\b'
                    ].join(''));
                    break;
                  case '#outputSubjectsGet':
                    attrsToShow  = RegExp([
                    '\\bId_Subject\\b'
                    ,'|\\bSubjectKey\\b'
                    ,'|\\bIdZnoSubject\\b'
                    ,'|\\bSubjectName\\b'
                    ].join(''));
                    break;
                  case '#outputUniversitiesGet':
                    attrsToShow  = RegExp([
                    'UniversityFullName\\b'
                    ,'|UniversityKode\\b'
                    ].join(''));
                    break;
                  case '#outputUniversityFacultetsTypesGet':
                    attrsToShow  = RegExp([
                    'UniversityFacultetTypeName\\b'
                    ,'|Id_UniversityFacultetType\\b'
                    ].join(''));
                    break;
                  case '#outputUniversityFacultetsGet':
                    attrsToShow  = RegExp([
                    'UniversityFacultetFullName\\b'
                    ,'|UniversityFacultetKode\\b'
                    ,'|UniversityFacultetTypeName\\b'
                    ].join(''));
                    break;
                  case '#outputUniversityFacultetSpecialitiesGet':
                    attrsToShow  = RegExp([
                    '\\bSpecCode\\b'
                    ,'|\\bSpecSpecialityName\\b'
                    ,'|\\bSpecDirectionName\\b'
                    ,'|\\bSpecIndastryName\\b'
                    ,'|\\bSpecSpecializationName\\b'
                    ].join(''));
                    break;
                  case '#outputQualificationsExGet':
                    attrsToShow  = RegExp([
                    'QualificationName\\b'
                    ,'|Id_Qualification\\b'
                    ].join(''));
                    break;
                  case '#outputUniversityCoursesGet':
                    attrsToShow  = RegExp([
                    'Id_UniversityCourse\\b'
                    ,'|UniversityCourseName\\b'
                    ].join(''));
                    break;
                  case '#outputQuotasGet':
                    attrsToShow  = RegExp([
                    'Id_Quota\\b'
                    ,'|QuotaName\\b'
                    ].join(''));
                    break;
                  case '#outputUniversityFacultetSpecialitiesQuotasGet':
                    attrsToShow  = RegExp([
                    'Id_UniversitySpecialitiesQuota\\b'
                    ,'|QuotaName\\b'
                    ,'|SpecSpecialityName\\b'
                    ,'|SpecDirectionName\\b'
                    ].join(''));
                    break;
                  default:
                    attrsToShow  = /^.+$/;
                    break;
                }
                return attrsToShow.test(param_name);
            };
            
            var drawOutputData = function(elem,data){
              var body_len = data.body.length;
              var len = (body_len > 500)? 500: body_len;
              var others_count = body_len - 500;
              for (var i = 0; i < len; i++){
                var id_ = elem.replace("#","")+"-record-"+(i+1);
                $(elem).append("<div class='col-xs-12 col-sm-6 col-md-4 top10' id='"+id_+"'>"
                  +"<legend class='main-legend'>ЗАПИС #"+(i+1)+"</legend>"
                  +"</div>"
                //+"<div class='col-xs-12' style='background-color: yellow; height: 110px;'></div>"
                );
                $("#"+id_).append("<table style='width:100%;table-layout: fixed;'></table>");
                $("#"+id_+" table").append(
                  "<tr><td colspan='2' style='cursor:pointer; color: blue;' onclick='$(\".tr-hidden-"+id_+"\").slideToggle();'>"
                  +"ПОКАЗАТИ/сховати ІНШІ АТРИБУТИ"
                  +"</td></tr>"
                );
                var j = 1;
                
                for (var param_name in data.body[i]){
                  if (data.body[i].hasOwnProperty(param_name)) {
                    var node_body_classes = 'node-body';
                    if (data.body[i][param_name].length > 70){
                      node_body_classes += ' very-small';
                    }
                    $("#"+id_+" table").append(
                      "<tr"
              +((isAttrToShow(elem,param_name))? 
              "":" class='tr-hidden-"+id_+"' style='display:none;'")
                      +">"
                      +"<td id='"+id_+"-head'"
                      +" title='"+data.head[param_name].description+"'>"
                      +"<div class='node-head'>"+data.head[param_name].name+"</div>"
                      +"</td>"
                      +"<td id='"+id_+"-body'"
                      +" title='"+data.head[param_name].type+"'>"
                      +"<div class='"+node_body_classes+"'>"+data.body[i][param_name]+"</div>"
                      +"</td></tr>"
                    );
                  }
                }
              }
              if (others_count > 0){
                $("#"+id_).append("<center>та інші записи ("+others_count+"). "
                        +"Усі дані знаходяться в SQL-запиті.</center>");
                
              }
              return true;
            };
            
            var drawSuccessFuncElements = function(func_name,response){
              if (typeof(response.head) === "object" && typeof(response.body) === "object"){
                if ($("#output-shower-"+func_name).length){
                  $("#output-shower-"+func_name).remove();
                }
                if ($("#output-status-"+func_name).length){
                  $("#output-status-"+func_name).remove();
                }
                $('#output'+func_name).before(
                    "<div class='success' id='output-status-"+func_name+"'>Усіпішно завантажено записів: "+response.body.length+"</div>"
                    +"<a href='#' id='output-shower-"+func_name+"' onclick='$(\"#output"+func_name+"\").slideToggle();return false;'>"
                    +"[Показати записи]"
                    +"</a>");
                $('#output'+func_name).html("");
                $('#output'+func_name).css("display","none");
              }
            };
              
            var drawSQLCode = function(func_name,response){
              var sql_str = "";
              if (func_name[0] !== 'j' && typeof(response.sql) !== "undefined"){
                sql_str = response.sql;
                $("#block-sql"+func_name).html(
                  "<a href='#' onclick='$(\"#sql"+func_name+"\").slideToggle();return false;'>"
                  +"[SQL code]"
                  +"</a>"
                  +"<pre id='"+"sql"+func_name+"' style='display: none;' >"
                  +"<code>"
                  +sql_str
                  +"</code>"
                  +"</pre>"
                  +"</div>");
                $("#sql"+func_name).click(function(){
                  selectText($(this).attr('id'));
                });
              }
            };
            
            var drawInputElements = function(_func_name, func_info){
              var func_name = _func_name;
              $("#myScrollSpy ul").append("<li><a href='#"
                      +func_name+"' class='min-paddings'>"
                      +func_name+"</li>");
              $("#func_block").append(
                '<div class="row margin-top5"  id="'+func_name+'">'
                +'  <div class="col-xs-12 well well-sm">'
                +'    <h2>'+((func_name[0] !== "j")? "SOAP-функція ":"Функція ")+func_name+'</h2>' 
                +'      <form class="form well well-sm" id="form'+func_name+'" '
                +'           action="'+service_url+'">'
                +'        <div class="row" id="input'+func_name+'"></div>'
                +'        <div class="form-group centered top10">'
                +'          <input type="hidden" name="_$action" value="'+func_name+'" />'
                +'          <button type="submit" class="btn btn-default">'+func_name+'</button>'
                +'        </div>'
                +'      </form>'
                +'    '
                +'    <div class="row node" id="output'+func_name+'">'
                +'    </div>'
                +'    <div class="col-xs-12" id="block-sql'+func_name+'"></div>'
                +'  </div>'
                +'</div>'
              );
              for (var j = 0; j < func_info.receive.length; j++){
                $("#input"+func_name).append(
                  '<div class="col-xs-6 col-sm-6 col-md-3">'
                  +'<div class="col-xs-12 hint" style="display:none;" id="'+func_name+"_hint_"+func_info.receive[j].name+'">'
                  +func_info.receive[j].description
                  +'</div>'
                  +'<span class="glyphicon glyphicon-info-sign cursor-pointer" onclick="$(\'#'+func_name+"_hint_"+func_info.receive[j].name+'\').slideToggle();"></span>'
                  +'<label for="'
                  +func_name+'_'+func_info.receive[j].name
                  +'">'+func_info.receive[j].name
                  +'</label>'
                  +'<input type="text" '
                  +' class = "form-control '
                  +((func_info.receive[j].name === "SessionGUID")? "sess_GUID":"")
                  +'" '
                  +' title="'+func_info.receive[j].description+'" '
                  +' id="'+func_name+"_"+func_info.receive[j].name+'" '
                  +' placeholder="'+func_info.receive[j].type+'" '
                  +'/>'
                  +'</div>'
                );
                if (func_info.receive[j].name === "Id_Language"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val("1");
                }
                if (func_info.receive[j].name === "ActualDate"){
                  var d = new Date();
                  $("#"+func_name+"_"+func_info.receive[j].name).val(
                    ((d.getDate() < 10)? "0"+d.getDate():d.getDate())+"."
                    +(((d.getMonth()+1) < 10)? "0"+(d.getMonth()+1):(d.getMonth()+1))+"."
                    +d.getFullYear()+" "
                    +((d.getHours() < 10)? "0"+d.getHours():d.getHours())+":"
                    +((d.getMinutes() < 10)? "0"+d.getMinutes():d.getMinutes())+":"
                    +((d.getSeconds() < 10)? "0"+d.getSeconds():d.getSeconds())
                  );
                }
                if (func_info.receive[j].name === "UniversityKode"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val("ab1bc732-51f3-475c-bcfe-368363369020");
                }
                if (func_info.receive[j].name === "User"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val("shevchenko.ruslana@edbo.gov.ua");
                }
                if (func_info.receive[j].name === "FacultetGetMode"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val("1");
                }
                if (func_info.receive[j].name === "Id_UniversityFacultetTypes"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val("20");
                }
                if (func_info.receive[j].name === "IsAvailableForReceiptOfRequest"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val("-1");
                }
                if (func_info.receive[j].name === "IsAvailableForBindStudentPersons"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val("-1");
                }
                if (func_info.receive[j].name === "IsAvailableForBindStaffPersons"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val("-1");
                }
                if (func_info.receive[j].name === "ApplicationKey"){
                  $("#"+func_name+"_"+func_info.receive[j].name).val(
"Y0NzMXVGYnplb2lYZzhxVlA3ZUZ4eFJualhlNnowbkh2dmpTQ0FSNkc5U09iOW9yWExQUnVLZ1FWZVNIQmY5b2JMQ1ZaSHRvcmg5eFFka2pKWGlabUZvVnBFN3hTakZCYUROQkhEQ3FzQUFtTFQ5UzRKOE82a2NGeFJGdUs1rMC="
                  );
                }
              }
              $('#form'+func_name).submit(function(e){
                var form_data = {};
                for (var j = 0; j < func_info.receive.length; j++){
                  form_data[func_info.receive[j].name] = $("#"+func_name+"_"+func_info.receive[j].name).val();
                }
                form_data["_$action"] = func_name;
                if (func_name[0] !== 'j'){
                  form_data["_$action"] = 'j'+func_name;
                }
                console.log({receive: form_data});
                e.preventDefault();
                $.ajax({
                  url: service_url,
                  dataType: "json",
                  data: form_data,
                  success: function(response){
                    $.unblockUI();
                    console.log({"return": response});
                    if (typeof(response.head) === "object" 
                            && typeof(response.body) === "object"){
                      if (typeof(response.head.LastErrorCode) === "object"
                           || typeof(response.head.LastErrorDescription) === "object"){
                        //у випадку повернення помилки (інформація про останню помилку через SOAP)
                        $('#output'+func_name).html("<div class='error'>"
                          +response.body[0].LastErrorDescription
                          +"</div>");
                        $('#output'+func_name).css("display","block");
                        $('#block-sql'+func_name).html("");
                        return false;
                      }
                      drawSuccessFuncElements(func_name,response);
                      drawOutputData('#output'+func_name,response);
                      drawSQLCode(func_name,response);
                    }
                    if (typeof(response.message) != "undefined" ){
                      $('#output'+func_name).html('<p class="success">'+response.message+'</p>');
                    }
                    if (typeof(response.guid) != "undefined"  ){
                      $('#output'+func_name).html('<p class="success">'+response.guid+'</p>');
                      var guid = response.guid;
                      $("input.sess_GUID").each(function(index,elem){
                        $(elem).val(guid);
                      });
                    }
                    if (typeof(response.GUID) != "undefined"  ){
                      $('#output'+func_name).html('<p class="success">'+response.GUID+'</p>');
                    }
                    if (typeof(response.error) != "undefined"  ){
                      $('#output'+func_name).html('<p class="error">'+response.error+'</p>');
                    }
                  },
                  beforeSend: loading_func,
                  error : err_func,
                  fail : err_func
                });
                return false;
              });
            };
            
            var funcList = function(){
              $.ajax({
                url: service_url,
                dataType: "json",
                success: function(data){
                  //console.log(data);
                  $.unblockUI();
                  if (typeof(data) === "object"){
                    for (var i = 0; i < data.length; i++){
                      var func_name = data[i].name;
                      if (func_name === "Login"){
                        drawInputElements("Login", data[i]);
                        break;
                      }
                    }
                    for (var i = 0; i < data.length; i++){
                      var func_name = data[i].name;
                      if (func_name.match(/Login\b|Logout\b|GetLastError\b/)){
                        continue;
                      }
                      drawInputElements(func_name, data[i]);
                    }
                    for (var i = 0; i < data.length; i++){
                      var func_name = data[i].name;
                      if (func_name === "Logout"){
                        drawInputElements("Logout", data[i]);
                        break;
                      }
                    }
                    return false;
                  }
                },
                beforeSend: loading_func,
                error : err_func,
                fail : err_func
              });
            };
            
            
            funcList();
            
          });
          
        </script>
    </head>
    
    
<body data-spy="scroll" data-target="#myScrollSpy">
  <div class="mycontainer">
    <div class="row">
      
      <div class="col-xs-2" id="myScrollSpy">
        <ul class="nav nav-tabs nav-stacked very-small" data-spy="affix" data-offset-top="5">
        </ul>
      </div>
      
      <div class="col-xs-10">
        <div class="col-xs-12" id="__title">
          <center>Довідники ЄДЕБО</center>
          <!--center><a href="index-test.jsp">Довідники ЄДЕБО (ТЕСТОВА БАЗА)</a></center-->
          <center><a href="FuncListServlet?guides=&html=">список доступних SOAP-функцій</a></center>
        </div>
        <div class="col-xs-12" id="func_block">
          
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