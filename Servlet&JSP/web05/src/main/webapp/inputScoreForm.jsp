<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>성적 입력</h3>
	<form action="saveScore.jsp" method="post">
		이름 : <input type="text" name="studentName"> <br>
		국어점수 : <input type="number" name="korScore"> <br>
		영어점수 : <input type="number" name="engScore"> <br>
		수학점수 : <input type="number" name="mathScore"> <br>
		사회점수 : <input type="number" name="socScore"> <br>
		과학점수 : <input type="number" name="sciScore"> <br>
		<button type="submit">성적 입력</button>
	</form>
</body>
</html>