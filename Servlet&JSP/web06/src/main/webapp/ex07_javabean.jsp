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
<%
	// 자바빈 생성
	Member member = new Member();
	
	//  자바빈에 프로퍼티 저장
	member.setUserId("hong");
	member.setUserName("홍길동");
	
	// 자바빈을 리퀘스트 객체에 담아서 포워드로 전달
	request.setAttribute("member", member);
	
	request.getRequestDispatcher("ex07_result.jsp").forward(request, response);
	
	

%>
</body>
</html>