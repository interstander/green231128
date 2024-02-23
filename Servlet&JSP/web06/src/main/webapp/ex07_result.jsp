<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 리퀘스트 객체에 저장된 자바빈과 그 프로퍼티를 출력하기</h3>
	<p>
		이름 : ${requestScope.member.userName}<br>
		아이디 : ${member["userId"]}<br>
	</p>
	
	<p>
		member 자바빈이 있는 지 없는 지 체크 : ${empty member}<br>
		student 자바빈이 있는 지 없는 지 체크 : ${empty student}<br>
	</p>
</body>
</html>