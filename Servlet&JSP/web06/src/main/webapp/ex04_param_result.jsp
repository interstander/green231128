<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전달된 값 출력</h3>
	<h4> 1. request 객체를 직접 이용하는 방법</h4>
	<p>
		아이디 : <%=request.getParameter("userId") %><br>
		비밀번호 : <%=request.getParameter("userPassword") %><br>
	</p>
	<hr>
	<h4> 2. EL 표기법을 이용한 출력</h4>
	<p>	
		아이디 : ${param.userId}<br>
		비밀번호 : ${param["userPassword"]}<br>
	</p>
	
	
	
</body>
</html>