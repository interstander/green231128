<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> Parameter로 값 전달 </h3>
	<form action="ex04_param_result.jsp" method="post">
		아이디 : <input type="text" name="userId"><br>
		비밀번호 : <input type="password" name="userPassword"> <br>
		<button type="submit">로그인</button>
	</form>
</body>
</html>