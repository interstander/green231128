<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세션 모든 값 읽어오기</h3>
<%
	Enumeration<String> names = session.getAttributeNames();  // 세션에 저장된 값의 모든 이름을 읽어오기

	while(names.hasMoreElements()){
		String name = names.nextElement();
		String value = session.getAttribute(name).toString();
											// 객체의 데이터를 문자열로 출력
	
		out.print(name+" : "+value+"<br>");
	}
%>

<a href="ex07_removeSession.jsp"> 세션의 데이터를 삭제</a>
<a href="ex08_removeSessionAll.jsp"> 세션의 모든 데이터를 한번에 삭제</a>


</body>
</html>


