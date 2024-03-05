<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src="script/member.js"></script>
</head>
<body>
	<h2>회원 정보 수정 페이지</h2>
	<form action="memberUpdate" method="post" name="frm">
		<table>
			<tr>
				<td>이름</td>
				<td> <input type="text" name="name" size="20" value="${member.name}" readonly> </td>
			</tr>
			<tr>
				<td>아이디</td>
				<td> <input type="text" name="userid" size="20" value="${member.userid}" readonly> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td> <input type="password" name="userpwd" size="20" required> </td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td> <input type="password"  name="pwd_check" size="20" required> </td>
			</tr>
			<tr>
				<td>이메일</td>
				<td> <input type="email" name="email" size="20" value="${member.email}" required> </td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td> <input type="tel" name="phone" size="20" value="${member.phone}" required> </td>
			</tr>
			<tr>
				<td>권한</td>
				<td> 
					<c:choose>
						<c:when test="${member.admin==0}">
							<input type="radio" name="admin" value="0" checked>일반 회원
							<input type="radio" name="admin" value="1" >관리자
						</c:when>
						<c:when test="${member.admin==1}">
							<input type="radio" name="admin" value="0" >일반 회원
							<input type="radio" name="admin" value="1" checked>관리자
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" onclick="return joinCheck()">수정</button>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>




