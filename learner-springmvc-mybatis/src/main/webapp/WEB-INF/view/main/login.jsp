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
  
  <link rel="icon" href="/view/lib/favicon.ico">
  <link rel="apple-touch-icon" href="/view/lib/yarukey_favorite.png"/>

  <spring:url value="/view/lib/js" var="publicResourceJsRoot"/>
  <spring:url value="/view/lib/img" var="publicResourceImgRoot"/>

   <!-- Bootstrap css -->
   <link href="${publicResourceJsRoot}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="${publicResourceJsRoot}/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="/view/lib/css/common.css?20170925_01" media="all" />
  
  <script type="text/javascript" src="${publicResourceJsRoot}/jquery.min.js?20170925_01"></script>
  <script type="text/javascript" src="${publicResourceJsRoot}/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${publicResourceJsRoot}/lms.common.js?20170925_01"></script>
  
<title>Login Page</title>
</head>
<body>
  <div id="wrapperAll">
  </div>
</body>
</html>