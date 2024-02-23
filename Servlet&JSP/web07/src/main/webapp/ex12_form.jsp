<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>POST 전송시 한글 깨짐</h3>
	<form action="ex12_encoding1.jsp" method="post">
		이름 : <input type="text" name="name">
		<button type="submit">전송</button>
	</form>
	<hr>
	
	<h3>POST에서 한글 깨짐 방지1 - 기존의 방법</h3>
	<form action="ex12_encoding2.jsp" method="post">
		이름 : <input type="text" name="name">
		<button type="submit">전송</button>
	</form>
	<hr>
	
	<h3>POST에서 한글 깨짐 방지2 - fmt를 활용한 방법</h3>
	<form action="ex12_encoding3.jsp" method="post">
		이름 : <input type="text" name="name">
		<button type="submit">전송</button>
	</form>
	<hr>
</body>
</html>