<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 각 저장 영역에 데이터 저장
	pageContext.setAttribute("name", "page Data");
	request.setAttribute("name", "request Data");
	session.setAttribute("name", "session Data");
	application.setAttribute("name", "application Data");
	
	// 각 저장 영역에 데이터 출력
	System.out.println("ex05_firstpage.jsp");
	System.out.println("하나의 페이지 속성 : "+pageContext.getAttribute("name"));
	System.out.println("하나의 리퀘스트 속성 : "+request.getAttribute("name"));
	System.out.println("하나의 세션 속성 : "+session.getAttribute("name"));
	System.out.println("하나의 애플리케이션 속성 : "+application.getAttribute("name"));
	
	// 포워드로 이동
	request.getRequestDispatcher("ex05_secondpage.jsp")
		   .forward(request, response);


%>
</body>
</html>