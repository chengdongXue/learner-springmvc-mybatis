<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
   <meta name="apple-mobile-web-app-title" content="english bady" />
  <meta name="application-name" content="english bady" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="robots" content="noindex,nofollow">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <meta http-equiv="Content-Script-Type" content="text/javascript">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="Pragma" content="no-cache">
  <link rel="icon" href="resources/favicon.ico">
  <link rel="apple-touch-icon" href="resources/yarukey_favorite.png"/>
  <spring:url value="resources/js" var="publicResourceJsRoot"/>
  <spring:url value="resources/img" var="publicResourceImgRoot"/>
   <!-- Bootstrap css -->
   <link href="${publicResourceJsRoot}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="${publicResourceJsRoot}/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
 <link rel="stylesheet"  href="resources/css/login.css?20170925_01" media="all" />
  <script type="text/javascript" src="${publicResourceJsRoot}/jquery.min.js?20170925_01"></script>
  <script type="text/javascript" src="${publicResourceJsRoot}/bootstrap/js/bootstrap.min.js"></script>
  <title>Login Page</title>
</head>
<script type="text/javascript">
$(function(){
    $("#userName").val(localStorage.getItem("loginName"));
    $("#password").val(localStorage.getItem("loginPws"));
    var rememberPws = localStorage.getItem("rememberPws");
    $("input[type='checkbox']").attr("checked",rememberPws == null?false:true);
    $("#rememberPws").bind('click',function(item){
        var mark = $("input[type='checkbox']").is(':checked');
        if(mark){
            var userName = $("#userName").val();
            var password = $("#password").val();
            if(userName!="" && password!=""){
                localStorage.setItem("loginName",userName);
                localStorage.setItem("loginPws",password);
                localStorage.setItem("rememberPws",'true');
            }
        }else{
            localStorage.removeItem("loginName");
            localStorage.removeItem("loginPws");
            localStorage.removeItem("rememberPws");
        }
    });
});
</script>
<body>
  <div class="container" >
      <img class="login img-responsive " src="resources/img/login/bg1.gif">
      <img  src="resources/yarukey_favorite.png" class="liltle_bg">
      <form:form class="form-horizontal" method="post" action="/learner-springmvc-mybatis/initLogin">
         <div class="form-group">
           <label for="inputEmail3" class="col-sm-2 control-label">UserName</label>
           <div class="col-sm-10">
             <input type="text" class="form-control" id="userName" name="userName" placeholder="Please input UserName">
           </div>
         </div>
         <div class="form-group">
           <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
           <div class="col-sm-10">
             <input type="password" class="form-control"  id="password" name="password"  placeholder="Please input PassWord">
           </div>
         </div>
         <div class="form-group">
           <div class="col-sm-offset-2 col-sm-10">
             <div class="checkbox">
               <label>
                 <input type="checkbox" id="rememberPws"> Remember me
               </label>
             </div>
           </div>
         </div>
         <div class="form-group">
           <div class="col-sm-offset-2 col-sm-10">
             <button type="submit" class="btn btn-default">Sign in</button>
           </div>
         </div>
     </form:form>
     <h4 style="color:red;font-weight:bold;position: absolute;bottom: 80px;left: 420px;">${errorMessage }</h4>
  </div>
</body>
</html>