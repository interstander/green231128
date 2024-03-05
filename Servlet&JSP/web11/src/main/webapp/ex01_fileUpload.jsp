<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드</h2>
	<form action="upload1" method="post" enctype="multipart/form-data">
		글쓴일 : <input type="text" name="writer"><br>
		제 목 : <input type="text" name="title"><br>
		파일지정 : <input type="file" name="file1"> <br>
		<button type="submit">전송</button>
	</form>
	
	
</body>
</html>