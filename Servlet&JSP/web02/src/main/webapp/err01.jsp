<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 에러가 발생시 이동할 페이지 --%>
<%@ page errorPage="err02.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 강제로 예외를 발생 --%>
<%=2/0 %>

0으로 나누는 것은 불능입니다<br>
</body>
</html>