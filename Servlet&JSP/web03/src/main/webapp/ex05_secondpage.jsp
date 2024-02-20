<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>ex05_secondPage.jsp</h3>
	<p>하나의 페이지 속성 : <%=pageContext.getAttribute("name") %></p>
	<p>하나의 리퀘스트 속성 : <%=request.getAttribute("name") %></p>
	<p>하나의 세션 속성 : <%=session.getAttribute("name") %></p>
	<p>하나의 애플리케이션 속성 : <%=application.getAttribute("name") %></p>
<br>
	<a href="ex05_thirdpage.jsp">다른 페이지로 새로운 요청</a>

</body>
</html>