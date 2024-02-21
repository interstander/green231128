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
	if(session.getAttribute("name") == null){
		// 로그인 안된 상태
		response.sendRedirect("loginForm.jsp");
	}

%>

<p><%=session.getAttribute("name") %>(<%=session.getAttribute("id") %>)님 환영합니다</p>
<%-- 이름(id)님 환영합니다 --%>

<form action="logout.jsp" method="post">
	<button type="submit">로그아웃</button>
</form>

</body>
</html>