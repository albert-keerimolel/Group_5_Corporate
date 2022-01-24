<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
 .popup{
position:absolute;
top:10%;
color: rgb(23,77,28);
} 
</style>
</head>
<body>
<div class="popup">
   <c:if test="${not empty errMsg}">
		<h2>${errMsg}</h2>
	</c:if>
</div>
 <jsp:include page="/login"></jsp:include> 
</body>
</html>