<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세션에 값 설정하기</h3>
	
<%
	//  세션은 내장 객체이기 때문에 그냥 사용할 수 있다.
	//   - 세션은 객체 데이터를 저장
	session.setAttribute("name", "홍길동");	
	session.setAttribute("age", 25);
	
	// => 서블릿에서 세션객체를 사용하는 방법
	//    HttpSession session = request.getSession();
	
%>
<a href="ex05_getSession.jsp"> 세션 값 확인</a>

</body>
</html>