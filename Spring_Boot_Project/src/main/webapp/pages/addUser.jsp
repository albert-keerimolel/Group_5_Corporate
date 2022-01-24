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
	width:500px;	
	border-radius:10px;
}
.float-container {
    
}
.float-child {
    width: 40%;
    float: left;
    padding: 20px;
   
} 

.topbar{
	/* background-color: brown; */
	background-color: rgb(219, 37, 77);
	padding: 8px 3px 8px 10px;
	position:absolute;
	top:0%;
	width:100%;
}

 .home{
    padding: 8px 3px 0px 10px;
    display:flex;
} 

.error{color:rgb(171,34,34)} 
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
<div>
           <form:form  action="addUserForm" modelAttribute="user" method="post">
              <h1>Add New User</h1>
                  <form:select path="corpId">
                 
                    <%
                    try
                    {   
                    	
                    	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SmartBank","root","#Reymystery619");
                    	Statement stmt=conn.createStatement();
                    	ResultSet rs=stmt.executeQuery("select * from corpsetup where status='Y'");
                    	
                    	while(rs.next())
                    	{
                    		%>
                    		<%--  <form:option value="India" label="India"/>   --%>
                    		<form:option  value='<%=rs.getInt("corpId")%>'><%=rs.getString("corpName") %></form:option>
                    		<%                    		
                    	}
                    }
                    catch(Exception ex)
                    {
                    	ex.printStackTrace();
                    	out.println("Error" + ex.getMessage());
                    }
                    
                    %>       
                 </form:select>
                 
                 <table>
 
<tr><td><form:label path="loginId">Login ID:</form:label></td>
		<td><form:input path="loginId" /></td> 
		<td> <form:errors path="loginId" cssClass="error"/></td></tr>
<tr><td><form:label path="password">Password:</form:label></td>
		<td><form:input path="password" /></td> 
		<td> <form:errors path="password" cssClass="error"/></td></tr>
<tr><td><form:label path="department">Department:</form:label></td>
		<td><form:input path="department" /></td> 
		<td> <form:errors path="department" cssClass="error"/></td></tr>
		<tr><td><form:label path="userAddress">User Address:</form:label></td>
		<td><form:input path="userAddress" /></td> 
		<td> <form:errors path="userAddress" cssClass="error"/></td></tr>
<tr><td><form:label path="userPhone">User Phone</form:label></td>
		<td><form:input path="userPhone" maxlength="10" minlength="10"/></td>
		<td> <form:errors path="userPhone" cssClass="error"/></td> </tr>

</table>
<div class="float-child">                                
                 <input type="submit" value="Submit"/> </div>
                  </form:form>
</div>

<div class="float-container">
<div class="float-child">
<form action="userEntryController">
<input type="submit" value="Back"/>
</form>
</div>
</div>  

 </div>    
</body>
</html>



