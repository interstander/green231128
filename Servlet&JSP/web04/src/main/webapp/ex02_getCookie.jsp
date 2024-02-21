<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>저장된 쿠키 읽어오기</h3>
	
<%
	// 저장된 쿠키가 몇개일까??
	// 쿠키를 읽어올 때는 배열형태
	Cookie[] cookies = request.getCookies();

	for(Cookie c : cookies){
		out.print(c.getName()+" : "+c.getValue()+"<br>");
	}
%>

	<a href="ex03_removeCookie.jsp">쿠키 삭제</a>

	
</body>
</html>