<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키를 생성</h3>
	
<%
	// 쿠키는 문자열 데이터 저장
	// 1. 쿠키 객체를 생성 => new Cookie(이름, 값);
	
	Cookie c1 = new Cookie("name", "홍길동");
	
	// 시간 설정(초)
	c1.setMaxAge(60*60*24*30);  // 30일 
	
	// 2. 클라이언트에게 쿠키 객체를 전달
	response.addCookie(c1);
	
	// 쿠키 여러개 저장
	response.addCookie(new Cookie("age","25"));
	response.addCookie(new Cookie("job","Student"));
	response.addCookie(new Cookie("major","Math"));

%>
</body>
</html>