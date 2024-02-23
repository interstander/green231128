<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>문자열 비교하기</h3>
	<h4> 표현식에서의 비교 </h4>
	<p>
		== 연산자 사용 : <%=request.getParameter("userName")=="홍길동" %><br>
		equals메서드 사용 :  <%=request.getParameter("userName").equals("홍길동")%><br>
	</p>
	<h4> EL에서의 비교 </h4>
 	<p>
 		== 연산자 사용 : ${param.userName=="홍길동"} <br>
 	
 	</p>
	
</body>
</html>