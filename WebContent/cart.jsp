<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unsw.comp9321.*"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Welcome!</title>
	<link href="frontpage.css" rel="stylesheet" type="text/css">
</head>

<body>

<%@ include file="header.jsp"%>  

<div class="middleSection">    
	<div class= "middleSect">
		<c:if test="${not empty message}">
			${message};
		</c:if>
		<c:choose>
			<c:when test="${empty listings}">
				<h3>Your shopping cart is empty!</h3>
			</c:when>
			<c:otherwise>
				<h2 align="center">Search Results</h2>
				<form action="ControllerServlet?operation=cart" class="registerForm">
			   		<table style="width:100%" cellpadding="10">
			   		<tr>
			   			<th align="left">
			   				Title
			   			</th>
			   			<th align="left">
			   				Author(s)
			   			</th>
			   			<th>
			   				Remove
			   			</th>
			   		</tr>
			   		<c:forEach var="i" items="${listings}">
			   		<tr>
			   			<td>
			   				${i.title}
			   			</td>
			   			<td>
			   				<c:forEach var="j" items="${i.author}" varStatus="loop">
			   					${j}
			   					${!loop.last ? ',' : ''}
			   				</c:forEach>
			   			</td>
			   			<td>
			   				<input type="checkbox" name="toRemove" value="${i.id }"/>
			   			</td>
			   		</tr>			
			   		</c:forEach>
			   		<tr>
			   			<td colspan="3" align="right">
			   				<button type="submit" name="operation" value="removeFromCart">Remove from Cart</button>
			   			</td>
			   		</tr>
			   		<tr>
			   			<td colspan="3" align="right">
			   				<button type="submit" name="operation" value="checkout">Checkout</button>
			   			</td>
			   		</tr>
			   		</table>
			   	</form>
			</c:otherwise>
	</c:choose>
	</div>
</div>
</body>
<%@ include file="footer.jsp"%>
</html>