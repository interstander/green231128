<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>포워드 이동</h3>
	<%
		request.getRequestDispatcher("ex01_request.jsp").forward(request, response);
	%>
</body>
</html>