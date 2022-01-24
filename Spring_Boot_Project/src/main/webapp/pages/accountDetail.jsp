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
     background: linear-gradient(120deg,#2980b9, #8e44ad);  
 /*   background: rgb(117,79,67); */
	height: 100vh;
	overflow: hidden;
}
 .center{
	/* position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%); */
	width:600px;
	background-color: white;
	/* border-radius:10px; */
} 
.boss{
position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);

}
.button {
    display: block;
    width: 100px;
    height: 30px;
    background: #4E9CAF;
    text-align: center;
    border-radius: 8px;
    color: white;
    font-weight: bold;
    line-height: 25px;
    text-decoration: none;
}
.table{
	background-color: rgb(133, 102, 90); 
	height:300px;
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
            SELECT * from Accsetup where  accNumber=? and status='Y';
             <sql:param value="${accNumber}"/>
                   
        </sql:query>
 <header>
<div class="topbar">
<form action="/homePageController">
  <span>    <input type="submit" value="Go Home"></span>    
 </form>
 </div>
</header> 

<div class="boss">
<h1>Account Details</h1>
 <div class="center"> 
    
        <form>
        <!-- <div class="tablebox"> -->
            <table border="1"  style="width:600px" class="table">              
                 <c:forEach var="row" items="${result.rows}">    
                <tr>
                <th style="text-align:left">CorpID</th>
                <td><c:out value="${row.corpId}"/></td>
                </tr>
                <tr>
                <th style="text-align:left">Account Number</th>
                <td><c:out value="${row.accNumber}"/></td>
                </tr>
                <tr>
                <th style="text-align:left">Account Name</th>
                <td><c:out value="${row.accName}"/></td>
                </tr>
                <tr>
                <th style="text-align:left">Account Branch</th>
                <td><c:out value="${row.accBranch}"/></td>
                </tr>
                <tr>
                <th style="text-align:left">Account Currency</th>
                <td><c:out value="${row.accCurrency}"/></td>
                </tr>
                <tr>
                <th style="text-align:left">Account Balance</th>
                <td><c:out value="${row.accBalance}"/></td> 
                </tr>
                             
               </c:forEach> </table></form></div>
                
                
                
                
                
                
                                   

 <div> 
    
        <form>
                                 
               <c:forEach var="row" items="${result.rows}">
                        <a href="AccountSummary?corpId=${row.corpId}" class="button">Back</a>
                                          
</c:forEach></form></div>
                 
                
  
 
</div>


</body>
</html>