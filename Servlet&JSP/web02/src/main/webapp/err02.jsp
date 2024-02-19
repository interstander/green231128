<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 다른 페이지에서 에러가 발생해서 보여줄 페이지 --%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
다음과 같은 에러가 발생
<%=exception.getMessage() %>


</body>
</html>