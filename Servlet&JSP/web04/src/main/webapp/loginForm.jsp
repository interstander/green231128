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
	if(session.getAttribute("name") != null){
		// 로그인이 된 상태
		response.sendRedirect("main.jsp");
	}

%>


	<h3>로그인 폼 페이지</h3>
	<form action="testLogin.jsp" method="post">
		아이디 : <input type="text" name="userId"> <br>
		비밀번호 : <input type="password" name="userPassword"> <br>
		<button type="submit">로그인</button>
	</form>
	<p>web03의 로그인 기능과 비교해 봅시다.</p>
	<p> - 로그인 후 다른 페이지를 옮긴 후 다시 main.jsp에서 로그인 상태를 확인</p> 
</body>
</html>