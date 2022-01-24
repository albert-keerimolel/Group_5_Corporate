<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<meta charset="ISO-8859-1">
<title>View</title>
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
			background-image: url('frontuser.jpg');
	background-repeat:no-repeat;
	background-size:cover;
     /* background: linear-gradient(120deg,#2980b9, #8e44ad); */  
 /*   background: rgb(117,79,67); */
	height: 100vh;
	overflow: hidden; 
}
 .center{
	/* position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%); */
	width:150px;
	/* background-color: white; */
	/* border-radius:10px; */
}
.bord{
	border: 5px solid black;
	margin: 20px;
	width:400px;
	padding: 120px 0px 120px 200px;
} 
.boss{
position: absolute;
	top: 50%;
	left:40%;
	transform: translate(-50%,-50%);
}
.button {
    display: block;
    width: 160px;
    height: 25px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 8px;
    color: white;
    font-weight: bold;
    line-height: 25px;
    text-decoration: none;
}

.button:hover {
	border: 3px solid black;
}

</style>
</head>
<body>

<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/SmartBank"
                           user="root"  password="#Reymystery619"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from UserSetup where  LoginID=? and status='Y';
             <sql:param value="${login.loginId}"/>
                   
        </sql:query>
    
 <header>
<div class="topbar">
<form action="loginUsers">
  <span>    <input type="submit" value="Logout"></span>    
 </form>
 </div>
</header> 


<div class="boss">
<h1>Home Page</h1>
<div class="bord">

 <div class="center"> 
    
        <form>
                                 
               <c:forEach var="row" items="${result.rows}">
                        <a href="AccountSummary?corpId=${row.corpId}" class="button">Account Summary</a>
                                          
                </c:forEach></form></div>
                
                      
 
</div>
</div>
</body>
</html>