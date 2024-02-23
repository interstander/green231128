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
	<h3>전달받는 색상으로 글자 표기</h3>
	<h4>조건문 c:if </h4>
	<c:if test='${param.color=="1" }'>
		<span style="color:red;">빨강</span>
	</c:if>
	<c:if test='${param.color=="2" }'>
		<span style="color:blue;">파랑</span>
	</c:if>
	<c:if test='${param.color=="3" }'>
		<span style="color:green;">초록</span>
	</c:if>
	<hr>
	<h4>조건문 c:choose </h4>
	<c:choose>
		<c:when test='${param.color=="1" }'>
			<span style="color:red;">빨강</span>
		</c:when>
		<c:when test='${param.color=="2" }'>
			<span style="color:blue;">파랑</span>
		</c:when>
		<c:when test='${param.color=="3" }'>
			<span style="color:green;">초록</span>
		</c:when>
		<c:otherwise>
			<span style="color:yellow;">노랑</span>
		</c:otherwise>
	</c:choose>
	
	
	
	
	
	
	
	
</body>
</html>