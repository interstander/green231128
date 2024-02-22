<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 가입 폼</h2>
	<form action="ex04_result.jsp" method="post">
	
		<label for="name">이름</label>
		<input type="text" name="name" id="name"/><br>
		
		<label for="userId">아이디</label>
		<input type="text" name="userId" id="userId"/><br>
		
		<label for="nickName">별명</label>
		<input type="text" name="nickName" id="nickName"/><br>
		
		<label for="userPwd">비밀번호</label>
		<input type="password" name="userPwd" id="userPwd"/><br>
		
		<label for="email">이메일</label>
		<input type="email" name="email" id="email"/><br>
		
		<label for="phone">전화번호</label>
		<input type="tel" name="phone" id="phone"/><br>
	
		<button type="submit">회원 가입</button>
	
	</form>
</body>
</html>