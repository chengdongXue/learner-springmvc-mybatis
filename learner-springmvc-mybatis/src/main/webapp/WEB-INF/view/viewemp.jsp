<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<table border="2" width="70%" cellpadding="2">  
<tr><th>Id</th><th>Name</th><th>Salary</th><th>Designation</th><th>Operator Delete</th><th>Operator edit</th></tr>  
   <c:forEach var="emp" items="${list}">   
   <tr>  
   <td>${emp.id}</td>  
   <td>${emp.name}</td>  
   <td>${emp.salary}</td>  
   <td>${emp.designation}</td>  
   <td><a href="/study-server-spring-mvc/deleteemp/${emp.id}">Delete</a></td>  
   <td><a href="/study-server-spring-mvc/editemp/${emp.id}">Update</a></td>  
   </tr>  
   </c:forEach>  
</table>
<br/>
<a href="/study-server-spring-mvc/viewemp/1">1</a>   
<a href="/study-server-spring-mvc/viewemp/2">2</a>   
 <a href="/study-server-spring-mvc/viewemp/3">3</a> 
</body>
</html>