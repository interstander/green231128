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
	<h3>포맷을 이용한 한글 깨짐 방지</h3>
	<fmt:requestEncoding value="UTF-8"/>
	<p>이름 : <c:out value="${param.name}"></c:out> </p>
</body>
</html>