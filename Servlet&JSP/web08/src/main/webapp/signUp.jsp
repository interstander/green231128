<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 가입 폼</h3>
	<form action="insertMember.jsp" method="post">
		이름 : <input type="text" name="name"> <br>
		아이디 : <input type="text" name="userid"> <br>
		비밀번호 : <input type="password" name="userpwd"> <br>
		이메일 : <input type="email" name="email"> <br>
		전화번호 : <input type="tel" name="phone"> <br>
		사용자여부 : 
		<input type="radio" name="admin" value="0" >사용자 
		<input type="radio" name="admin" value="1" >관리자
		<br>
		<button type="submit">회원 가입</button>
		
	</form>
</body>
</html>