<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세션 데이터 삭제</h3>
<%
	session.removeAttribute("age");
%>
<a href="ex06_getSessionAll.jsp">세션 값 확인</a>
</body>
</html>