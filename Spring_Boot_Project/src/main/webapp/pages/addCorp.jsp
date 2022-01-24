<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Form</title>
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


.error{color:rgb(171,34,34) ;  font-weight: bold;} 
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
<form:form  action="addCorpForm" modelAttribute="corp" method="post">
<h1>Add New Corporate</h1>

  
<table>
 
<tr><td><form:label path="corpName">Corp Name</form:label></td>
		<td><form:input path="corpName"/></td>
		<td> <form:errors path="corpName" cssClass="error"/></td></tr>
<tr><td><form:label path="corpAddress">Corp Address</form:label></td>
		<td><form:input path="corpAddress" /></td> 
		<td> <form:errors path="corpAddress" cssClass="error"/></td></tr>
<tr><td><form:label path="corpPhone">Corp Phone</form:label></td>
		<td><form:input path="corpPhone" maxlength="10" minlength="10" /></td> 
		<td> <form:errors path="corpPhone" cssClass="error"/></td></tr>

</table>
<div class="float-child">

<input type="submit" value="Save"/>
<!-- <input type="hidden" name="action" value="add"/> -->

</div>
</form:form>
</div>

<div class="float-container">
<div class="float-child">
<form action="corpEntryController">
<input type="submit" value="Back"/>
</form>
</div>


</div>

</div>

</body>
</html>