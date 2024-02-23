<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>El 표기법 내부에 사용가능한 연산자의 장점</h3>
<%
	pageContext.setAttribute("num1", 10);
	pageContext.setAttribute("num2", 20);
%>
<h4>1. 스크립트릿에서의 합계</h4>
<%
	int num1 = (Integer)pageContext.getAttribute("num1");
	int num2 = (Integer)pageContext.getAttribute("num2");
%>
<%=num1 %>+<%=num2 %> = <%=num1+num2 %>
<h4> 2. 표현언어에서의 합계</h4>
${pageScope.num1}+${pageScope.num2}=${pageScope.num1+pageScope.num2}<br>
${num1}+${num2}=${num1+num2}




</body>
</html>