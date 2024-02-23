<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전달받는 색상으로 글자 표기</h3>
<%
	if(request.getParameter("color").equals("1")){
%>
		<span style="color:red;">빨강</span>
<%
	}else if(request.getParameter("color").equals("2")){
%>
		<span style="color:blue;">파랑</span>
<%		
	}else if(request.getParameter("color").equals("3")){
%>
		<span style="color:green;">초록</span>
<%		
	}
%>

	
	
	
</body>
</html>