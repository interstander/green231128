<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>한번에 여러파일 업로드</h2>
	<form action="upload2" method="post" enctype="multipart/form-data">
		1. 파일 지정하기 : <input type="file" name="file01"> <br>
		2. 파일 지정하기 : <input type="file" name="file02"> <br>
		3. 파일 지정하기 : <input type="file" name="file03"> <br>
		<button type="submit">전송</button>
	</form>
</body>
</html>