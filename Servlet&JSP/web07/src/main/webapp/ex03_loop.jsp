<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String[] gameList = {"철권","오버워치2","스타크래프트","카트라이더","팰월드","롤","페르소나3 리로드"};	
	pageContext.setAttribute("gameList", gameList);

%>
<h3>반복문 : c:forEach </h3>

<c:forEach var="gameTitle" items="${gameList}">
	${gameTitle}<br>
</c:forEach>
<hr>
<table border="1">
	<tr>
		<td>Index</td>
		<td>Count</td>
		<td>Title</td>
	</tr>
	<c:forEach var="gameTitle" items="${gameList}" varStatus="status">
		<tr>
			<td>${status.index}</td>
			<td>${status.count}</td>
			<td>${gameTitle}</td>
		</tr>
	</c:forEach>
</table>
<hr>
<c:forEach var="gameTitle" items="${gameList}" varStatus="status">
	${gameTitle} <c:if test="${not status.last}">,</c:if>
</c:forEach>
<hr>
<ul>
	<c:forEach var="gameTitle" items="${gameList}" varStatus="status">
		<c:choose>
			<c:when test="${status.first}">
				<li style="color:red; font-weight: bold;">${gameTitle}</li>
			</c:when>
			<c:when test="${status.last}">
				<li style="color:white; background-color: blue;">${gameTitle}</li>
			</c:when>
			<c:otherwise>
				<li>${gameTitle}</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</ul>
<hr>
<table border="1">
	<tr>
		<td>Index</td>
		<td>Count</td>
		<td>Number</td>
	</tr>
	<c:forEach var="cnt" begin="1" end="5"  varStatus="s">
		<tr>
			<td>${s.index}</td>
			<td>${s.count}</td>
			<td>${cnt}</td>
		</tr>
	</c:forEach>
</table>
<hr>

<table border="1">
	<tr>
		<td>Index</td>
		<td>Count</td>
		<td>Number</td>
	</tr>
	<c:forEach var="cnt" begin="6" end="10"  varStatus="s">
		<tr>
			<td>${s.index}</td>
			<td>${s.count}</td>
			<td>${cnt}</td>
		</tr>
	</c:forEach>
</table>
<hr>

<table border="1">
	<tr>
		<td>Index</td>
		<td>Count</td>
		<td>Number</td>
	</tr>
	<c:forEach var="cnt" begin="4" end="15" step="3"  varStatus="s">
		<tr>
			<td>${s.index}</td>
			<td>${s.count}</td>
			<td>${cnt}</td>
		</tr>
	</c:forEach>
</table>
<hr>






















</body>
</html>