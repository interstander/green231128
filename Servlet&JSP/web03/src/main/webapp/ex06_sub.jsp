<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="./ex06_header.jsp" %>
	<h1>서브 페이지입니다.</h1>
	<% int age = 20; %>
	<a href="./ex06_main.jsp">메인페이지 이동</a>
	<jsp:include page="./ex06_footer.jsp" />
	
<hr>
</body>
</html>