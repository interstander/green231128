<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>request 객체에 담긴 정보들</h3>
	<p>JSP와 서블릿의 request 객체는 같은 정보를 가진 객체</p>
	<p>요청 URL : <%=request.getRequestURL() %></p>
	<p>요청 프로토콜 : <%=request.getProtocol() %></p>
	<p>요청 서버이름 : <%=request.getServerName() %></p>
	<p>요청 포트번호 : <%=request.getServerPort() %></p>
	<p>요청 URL : <%=request.getRequestURL() %></p>
	<p>요청 컨텍스트 패스 : <%=request.getContextPath() %></p>
	<p>요청 메서드(get/post) 종류 : <%=request.getMethod() %></p>
	<p>요청 쿼리스트링 : <%=request.getQueryString() %></p>
	
	
</body>
</html>