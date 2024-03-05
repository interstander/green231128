<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Part 객체를 이용한 파일 업로드</h3>
	<form action="upload3" method="post" enctype="multipart/form-data">
		파일 설명 : <input type="text" name="description"><br>
		파일 1 : <input type="file" name="file01"> <br>
		파일 2 : <input type="file" name="file02"> <br>
		<button type="submit">전송</button>
	</form>
</body>
</html>