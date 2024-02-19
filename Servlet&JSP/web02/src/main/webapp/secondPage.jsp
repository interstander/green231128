<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String name = "홍길동";
%>
	<h2>두번째 페이지 입니다.</h2>
	<a href="./firstPage.jsp">첫번째 페이지 이동</a><br>
	
<%@ include file="./footer/footer.jsp" %>
</body>
</html>