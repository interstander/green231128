
<%@page import="com.green.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>자바빈</h3>
<%
	com.green.beans.Member m1 = new com.green.beans.Member();

	m1.setName("홍길동");
	m1.setUserId("hong");

	Member m2 = new Member();
	
	request.setAttribute("member1", m1);
	// 내장 객체에 데이터묶음인 자바빈을 저장할 수 있다.
	
	Member m3 = (Member)request.getAttribute("member1");
	// 내장 객체에서 자바빈을 꺼낼 떄는 형변환이 필요

%>
	
	
</body>
</html>