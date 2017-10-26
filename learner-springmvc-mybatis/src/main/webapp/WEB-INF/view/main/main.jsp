<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
 content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-title" content="english bady" />
<meta name="application-name" content="english bady" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="robots" content="noindex,nofollow">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<link rel="icon" href="resources/favicon.ico">
<link rel="apple-touch-icon" href="resources/yarukey_favorite.png" />
<spring:url value="resources/js" var="publicResourceJsRoot" />
<spring:url value="resources/img" var="publicResourceImgRoot" />
<spring:url value="resources/dist" var="dist" />
<spring:url value="resources/bower_components" var="bower_components" />
<!-- Bootstrap css -->
<link href="${publicResourceJsRoot}/bootstrap/css/bootstrap.min.css"
 rel="stylesheet">
<link href="${publicResourceJsRoot}/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
  <!-- bootstrap-validator.css -->
<link rel="stylesheet"
 href="${bower_components }/bootstrapValidator/css/bootstrapValidator.css">
<!-- Font Awesome -->
<link rel="stylesheet"
 href="${bower_components }/font-awesome/css/font-awesome.min.css">
 <!-- bootstrap-datetimepicker -->
<link rel="stylesheet"
 href="${bower_components }/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
 href="${bower_components }/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${dist }/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${dist }/skins/_all-skins.min.css">

<title>DashBoard Controller</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
 <div class="wrapper">
 
  <!-- Header page -->
  <jsp:include page="header.jsp"></jsp:include>
  <!-- Header page -->

  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="menu.jsp"></jsp:include>
  <!-- Left side column. contains the logo and sidebar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
    <h1>
     Data Tables <small>advanced tables</small>
    </h1>
    <ol class="breadcrumb">
     <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
     <li><a href="#">Tables</a></li>
     <li class="active">Data tables</li>
    </ol>
   </section>

   <!-- Main content -->
   <section class="content">
    <div class="row">
     <div class="col-xs-12">
      <div class="box">
       <div class="box-header">
       </div>
       <!-- /.box-header -->
       <div class="box-body pad">
       
       <div class="panel panel-default">
        <div class="panel-heading">Panel heading without title</div>
        <div class="panel-body">
           <form data-toggle="validator" role="form" id="submitform" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/new/addNew">
              <div class="form-group">
              <label style="font-size:18px;">新闻标题</label><br>
                <input type="text" class="form-control" id="newTitle" name="newTitle" maxLength="200"  placeholder="请输入新闻标题" required>
              </div>
              <div class="form-group">
                <label style="font-size:18px;">新闻发布人</label>
                <select id="pushPerson" name="pushPerson" class="form-control select2" style="width: 100%;" required>
                  <option selected="selected" value="1">Admin</option>
                </select>
              </div>
              <div class="form-group">
               <label style="font-size:18px;">新闻是否置顶</label><br>
                <label>
                Yes
                  <input type="radio" class="minimal-red" id="flowUpTop" name="flowUpTop" value="1" checked>
                </label>
                <label>
                No
                  <input type="radio" id="flowUpTop" name="flowUpTop"  class="minimal-red" value="0">
                </label>
              </div>
              <div class="form-group">
                <label style="font-size:18px;">新闻发布时间</label><br>
                <input size="16" type="text" id="pushTime" name="pushTime" class="form_datetime" required>
              </div>
              <div class="form-group" style="position:relative;">
                <label style="font-size:18px;">发布缩列图</label>
                <span style="color:red;font-weight:bold;font-size:14px;">&nbsp;(* 请点击上传图片按钮进行图片上传操作)</span><br>
                   <div id="wait_loading" style="position:absolute;top:-70px;left:40%;display:none;  overflow:hidden;">
                      <div style="width: 103px;margin: 0 auto;"><img src="resources/img/loading.gif"/></div>
                      <div style="width: 103px;text-align: center;font-size: 16px;margin-right: 25px;margin-top:10px;"><span>请稍等...</span></div>
                  </div>
                  <div id="result" style="width:100px;display:none;">
                      <img id="uploadImage" style="max-width:100%;width:100%;" src="">
                  </div>
                  <input type="file" id="myBlogImage" name="myfiles" class="btn btn-default" style="margin-bottom:10px;" required/>
                  <input type="button" value="上传图片" onclick="ajaxFileUpload()" class="btn btn-default" />
                  <input type="hidden" id="thumbnails" name="thumbnails"/>
                <br>
               <!--  <input id="file-Portrait" type="file"> -->
              </div>
              <div class="form-group">
                 <label style="font-size:18px;">新闻详情</label><br>
                 <textarea id="newDetails"  name="newDetails" rows="10" cols="80">
                     This is my textarea to be replaced with CKEditor.
                 </textarea>
              </div>
              <button type="submit" id="submitBut" class="btn btn-default btn-lg btn-block" style="margin-top:20px;">提交</button>
           </form>
        </div>
      </div>
       </div>
       <!-- /.box-body -->
      </div>
      <!-- /.box -->
     </div>
     <!-- /.col -->
    </div>
    <!-- /.row -->
   </section>
   <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Footer page -->
  <jsp:include page="footer.jsp"></jsp:include>
  <!-- Footer page -->

  <!-- Control Sidebar -->
  <jsp:include page="controlSidebar.jsp"></jsp:include>
  <!-- /.control-sidebar -->

  <!-- Add the sidebar's background. This div must be placed  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
 </div>
 <!-- ./wrapper -->

 <script type="text/javascript" src="${publicResourceJsRoot}/jquery.min.js?20170925_01"></script>

 <script type="text/javascript" src="${publicResourceJsRoot}/jquery.serialize-json.js?20170925_01"></script>

 <script type="text/javascript" src="${publicResourceJsRoot}/bootstrap/js/bootstrap.min.js"></script>
  
 <script src="${bower_components}/bootbox.min.js"></script>
  
  <script type="text/javascript" src="${publicResourceJsRoot}/ajaxfileupload.js"></script>
  
  <!-- bootstrapValidator -->
 <script src="${ bower_components}/bootstrapValidator/js/bootstrapValidator.js"></script>
<script src="${ bower_components}/bootstrapValidator/js/zh_CN.js"></script>
  
  <!-- bootstrap-datetimepicker -->
 <script src="${ bower_components}/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
 
<!-- bootbox -->
 <script src="${ bower_components}/bootbox.min.js"></script>

<!-- FastClick -->
<script src="${ bower_components}/fastclick/lib/fastclick.js"></script>

<!-- CK Editor -->
<script src="${ bower_components}/ckeditor/ckeditor.js"></script>

 <!-- AdminLTE App -->
 <script src="${ dist}/adminlte.min.js"></script>

 <!-- AdminLTE for demo purposes -->
 <script src="${ dist}/demo.js"></script>

 <script type="text/javascript">
   $(function() {
       CKEDITOR.replace('newDetails');
       $(".form_datetime").datetimepicker({
           format: 'yyyy-mm-dd hh:ii',
           autoclose: true,
           todayBtn: true,
           minuteStep: 10,
           pickerPosition: "bottom-left"
       });
       $('#submitform').bootstrapValidator();
   });
   
   function ajaxFileUpload(){
       if ($("#myBlogImage").val().length > 0) {
           $("#wait_loading").show();
           $.ajaxFileUpload({
               //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
               url:'${pageContext.request.contextPath}/upload/fileUpload',
               type: 'post',
               secureuri:false,                       //是否启用安全提交,默认为false 
               fileElementId:'myBlogImage',           //文件选择框的id属性
               dataType:'text',                       //服务器返回的格式,可以是json或xml等
               success:function(data, status){        //服务器响应成功时的处理函数
                 var splitStr = '';
                 if(data.indexOf("&amp;")!=-1){
                     splitStr = data.substring(data.indexOf("&amp;")+5,data.length-11);
                 }
                 if(splitStr){
                     $("#thumbnails").val(splitStr);
                    $("#myBlogImage").css("margin-top","10px;");
                    $("#result").show();
                    $("#wait_loading").hide();
                    $("img[id='uploadImage']").attr("src", splitStr);
                 }else{
                 }
               },
               error:function(data, status, e){
               }
             });
       }
       else {
          return commonBootboxDailog("请选择图片");
       }
   }
   
   function commonBootboxDailog(message){
       bootbox.alert({
           size : "small",
           title : "warning",
           message : message,
           callback : function() {
           }
       })
   }
</script>
</body>
</html>