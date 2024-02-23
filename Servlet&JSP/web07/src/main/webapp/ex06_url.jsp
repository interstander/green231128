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
	<h4> c:url 경로를 저장해두고 꺼내서 사용</h4>
	<c:url var="pic" value="images/woman.jpg" scope="request"/>
	<div>${pic}</div>
	<hr>
	<img alt="봄" src="${pic}" width="150px" height="150px">
</body>
</html>