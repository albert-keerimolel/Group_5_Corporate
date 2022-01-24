<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.topbar{
	/* background-color: brown; */
	background-color: rgb(219, 37, 77);
	padding: 8px 3px 8px 10px;
	position:absolute;
	top:0%;
	width:100%;
}
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
	width:1000px;
	
	/* border-radius:10px; */
}
</style>
</head>
<body>
<header>
<div class="topbar">
<form action="/">
  <span>    <input type="submit" value="Go Home"></span>    
 </form>
 </div>
</header>
        
<div class="center">            
        <h1>Modify Form</h1>   
      <form:form  action="modifyUserDB"  modelAttribute="modifyuser">
            <table border="1">
               
                <tr>
                   <th>Corporate ID</th>
                    <th>Login ID</th>
                      <th>Password </th>
                        <th>Department</th> 
                         <th>Addrss</th> 
                          <th>Phone</th>            
                </tr>
                
                
                 <tr>
                 
                <td><form:input path="corpId" readonly="true"/></td> 
               	<td><form:input path="loginId" readonly="true"/></td> 
                <td><form:input path="password" readonly="true"/></td>  
                <td><form:input path="department" required="true"/></td> 
                <td><form:input path="userAddress" required="true"/></td> 
                <td><form:input path="userPhone" required="true" pattern="[789][0-9]{9}"  maxlength="10" minlength="10"/></td>     
                </tr>
             
            </table>
                        
         <div class="float-child">

		<input type="submit" value="Update"/>
		

		</div>
		</form:form>
         
        </div>
        
</body>
</html>