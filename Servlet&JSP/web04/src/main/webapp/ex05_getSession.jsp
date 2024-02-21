<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세션에 저장된 값 읽기</h3>
<%
	// 세션에는 객체단위로 데이터를 저장
	//    => 데이터를 꺼낼 때로 Object객체로 꺼낸다. => 형변환
	
	String name = (String)session.getAttribute("name");
	int age = (Integer)session.getAttribute("age");

%>
	이름 : <%=name %><br>
	나이 : <%=age %><br>


<a href="ex06_getSessionAll.jsp">세션 값 한꺼번에 읽어오기</a>



</body>
</html>