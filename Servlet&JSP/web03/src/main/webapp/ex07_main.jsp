<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> <%=request.getAttribute("name") %> (<%=request.getParameter("userId") %>)님 환영합니다.</h3>
	<%-- 김그인(green) 님 환영합니다.--%>
	<hr>
	<p>저희 홈페이지에 오신것을 환영합니다.</p>
</body>
</html>