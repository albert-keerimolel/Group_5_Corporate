<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	margin: 0;
	padding: 0;
	font-family: montserrat; 
     background: linear-gradient(120deg,#2980b9, #8e44ad);  
 /*   background: rgb(117,79,67); */
	height: 100vh;
	overflow: hidden;
}
.center{
	position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);
	/* width:400px;
	border-radius:10px; */
	
}
.bord{
	border: 5px solid black;
	margin: 20px;
	width:400px;
	padding: 50px 0px 50px 120px;
}
</style>
</head>
<body>
<div class="center"> 
       <div class="bord">
       <div>
       <h1>Change Password</h1>
<form:form  action="changePasswordDB" modelAttribute="change" >
<table>
 
<tr><td><form:label path="password1">Old Password</form:label></td>
		<td><form:password path="password1" value="${pass}"/></td> </tr>
<tr><td><form:label path="password2">New Password</form:label></td>
		<td><form:input path="password2" /></td> </tr>

</table>

<input type="submit" value="Confirm"/>
</form:form> 
</div>
</div>
</div>
</body>
</html>