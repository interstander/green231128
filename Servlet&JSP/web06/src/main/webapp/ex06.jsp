<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 내장객체를 활용한 EL 표기법</h3>
<%
	pageContext.setAttribute("Data1", "페이지");
	request.setAttribute("Data2", "리퀘스트");
	session.setAttribute("Data3", "세션");
	application.setAttribute("Data4", "어플리케이션");
	
	pageContext.setAttribute("Data1", "페이지");
	request.setAttribute("Data2", "리퀘스트");
	session.setAttribute("Data3", "세션");
	application.setAttribute("Data4", "어플리케이션");
%>	
	<p>
	page속성 : ${pageScope.Data1}<br>
	request속성 : ${requestScope.Data2}<br>
	session속성 : ${sessionScope.Data3}<br>
	application속성 : ${applicationScope.Data4}<br>
	</p>
	<h4> 내장 객체 이름을 생략하고 출력가능</h4>
	<p>
	내장 객체 속성값 : ${Data4}<br>
	<br>
	내장 객체의 속성이름이 같은 경우 : ${Data}<br>
	검색 순서 : page -> request -> session -> application -> null(공백)
	</p>
	
	
	
</body>
</html>

