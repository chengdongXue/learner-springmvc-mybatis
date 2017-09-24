<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body style="width:100%;height:auto;">
<h2>Hello World!</h2>
<%= java.util.Calendar.getInstance().getTime() %>

<a href="showEmpList?id=1">click welcome</a>

<form action="login" method="post">
 <div style="position:relative;overflow:hidden;">
   <input type="text" id="userName" name="userName">
   <input type="password" id="password" name="password">
   <input  type="submit" value="login"></input >
 </div>
</form>

<a href="employeeform">Add Employee</a> 
 
<a href="viewemp/1">View Employees</a>

<a href="uploadform">Upload Image</a>  

</body>
</html>