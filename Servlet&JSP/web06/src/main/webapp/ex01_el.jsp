<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>표현 언어 (EL=> Expression Language)</h3>
<%
	pageContext.setAttribute("Data", "안녕하세요");
%>	
	
<h4> 1. 스크립트릿으로 데이터 출력하기</h4>
<%
	out.print(pageContext.getAttribute("Data").toString());
%>
<h4> 2. 표현식으로 데이터 출력하기</h4>
<%=pageContext.getAttribute("Data").toString() %>

<h4> 3. El표기법으로 데이터 출력하기</h4>
${pageScope.Data}
	
	
	
	
	
</body>
</html>