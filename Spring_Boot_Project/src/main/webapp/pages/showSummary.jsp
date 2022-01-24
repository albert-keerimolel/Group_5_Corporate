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
	width:1000px;
	background-color: white;
	/* border-radius:10px; */
} 
.boss{
position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);

}
.table{
	background-color: rgb(133, 102, 90); 
	height:100px;
}
.anch1{
	text-decoration: none;
	 color:rgb(37, 222, 31); 
    font-weight: bold;
	text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
}
</style>
</head>
<body>

<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/SmartBank"
                           user="root"  password="#Reymystery619"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from Accsetup where  corpId=? and status='Y';
             <sql:param value="${corpId}"/>
                   
        </sql:query>
 <header>
<div class="topbar">
<form action="homePageController">
  <span>    <input type="submit" value="Go Home"></span>    
 </form>
 </div>
</header> 

<div class="boss">
<h1>Account Summary</h1>
 <div class="center"> 
    
        <form>
        <!-- <div class="tablebox"> -->
            <table border="1" style="width:1000px" class="table">   
                
                <tr>
                    <th>Corp ID</th>
                    <th>Account number</th>
                    
                   
                    <th colspan="2">Action</th>
                </tr>
                    <c:forEach var="row" items="${result.rows}">    
                    <tr>
                        <td><c:out value="${row.corpId}"/></td>
                        <td><c:out value="${row.accNumber}"/></td>
                       
                          
                        <td><a href="AccountDetails?accNumber=${row.accNumber}" class="anch1">Account Details</a></td>
                      
                    </tr>
                </c:forEach></table></form></div>
                
                <div>
					<form action="homePageController">
 					<input type="submit" value="Back"/>
				</form></div>
            
            <!-- </div> -->
        
  
 
</div>


</body>
</html>