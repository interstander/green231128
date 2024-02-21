<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 삭제</h3>
	
<%
	// 쿠키를 직접 삭제하는 기능 X
	// 쿠키를 간접적으로 삭제하는 기능O
	Cookie c1 = new Cookie("name","~~~");
	c1.setMaxAge(0);  //  유효시간을 0초
	response.addCookie(c1);

%>
	<a href="ex02_getCookie.jsp">쿠키 확인</a>


</body>
</html>