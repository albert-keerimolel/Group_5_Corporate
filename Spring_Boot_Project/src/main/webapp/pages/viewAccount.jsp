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

.anch2{
	text-decoration: none;
	color: rgb(252, 3, 11);
	font-weight: bold; 
	text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
}

.table{
	background-color: rgb(133, 102, 90); 
	width:100%;
	height:200px;
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

<div class="boss">
<h1>Account Details</h1>
 <div class="center"> 
    
        <form>
        <!-- <div class="tablebox"> -->
            <table border="1" class="table">              
                <tr>
                    <th>Corp ID</th>
                    <th>Account Number</th>
                    <th>Account Name</th>
                    <th>Branch</th>
                    <th>Currency</th>
                    <th>Available Balance</th>
                   
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${list}">
                    <tr>
                        <td><c:out value="${row.corpId}"/></td>
                        <td><c:out value="${row.accNumber}"/></td>
                        <td><c:out value="${row.accName}"/></td>
                        <td><c:out value="${row.accBranch}"/></td>
                        <td><c:out value="${row.accCurrency}"/></td>   
                        <td><c:out value="${row.accBalance}"/></td>   
                          
                        <%-- <td><a href="modifyUserController?loginId=${row.loginId}">Modify</a></td> --%>
                        <td><a href="deleteAccountController/${row.accNumber}" class="anch2">Close</a></td>  
                    </tr>
                </c:forEach></table></form></div>
                
                <div>
					<form action="accountEntryController">
 					<input type="submit" value="Back"/>
				</form></div>
            
            <!-- </div> -->
        
  
 
</div>


</body>
</html>