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
  <script type="text/javascript">
  
  $(document).ready(function() {
      window.location.href = '/learner-springmvc-mybatis/init';
  });
    
   function getComboListById() {
       var params = {
          "id":1,
          "name":'Victr',
          "salary":100.00,
          "designation":'want to love for me'
       };
      $.ajax({
        type:"POST",
        url: "/learner-springmvc-mybatis/getAllEmployeeJson",
        dataType: "json",
        data:JSON.stringify(params),
        contentType: "application/json; charset=UTF-8",
        success: function(data) {
          if(data){
              console.log(data);
          }
        },
        error: function(XMLHttpRequest, textStatus) {
            alert("通信ERROR。");
        }
      });
  }
  </script>
</head>
<body>
<!--   <a href="/learner-springmvc-mybatis/showEmpDropSortList?id=1">click sotable.js</a> -->
</body>
</html>