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
	<h3>반복문 2번째 : c:forTokens</h3>
<%
	String names = "이정희,김대정:전소영,전현민,김가령:김주현,김관훈";
	pageContext.setAttribute("names", names);
%>
<c:forTokens var="name" items="${names}" delims=",:">
 ${name}<br>
</c:forTokens>


</body>
</html>