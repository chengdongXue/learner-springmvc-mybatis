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
  <script type="text/javascript" src="resources/js/jquery.min.js"></script>
</head>
<body style="text-align:center;">
    <h2 style="text-align:center;color:red;">系统从每天早上8点开始，晚上22点之前是处于工作状态的，
    请联系系统管理员，该时间段系统处于非工作状态！！！</h2>
    <a style="text-align:center;color:red;" href="${pageContext.request.contextPath}/init">login</a>
</body>
</html>