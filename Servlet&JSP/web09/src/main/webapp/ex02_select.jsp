<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 목록</h3>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>권한(1:관리자,0:사용자)</th>
		</tr>
		<c:forEach var="member" items="${memberLists}">
			<tr>
				<td>${member.name}</td>
				<td>${member.userid}</td>
				<td>${member.userpwd}</td>
				<td>${member.email}</td>
				<td>${member.phone}</td>
				<td>${member.admin}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>