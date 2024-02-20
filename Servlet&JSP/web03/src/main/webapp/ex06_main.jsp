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
	<h1>메인 페이지입니다.</h1>
	<%  String name = "홍길동"; %>
	<a href="./ex06_sub.jsp">서브페이지 이동</a>
	<jsp:include page="./ex06_footer.jsp"></jsp:include>
	
<hr />
</body>
</html>