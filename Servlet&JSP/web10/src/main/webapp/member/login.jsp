<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="login" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td> <input type="text" name="userid" value="${userid}" required> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td> <input type="password" name="userpwd" required> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">로그인</button>
					<button type="reset">취소</button>
					<button type="button" 
						onclick="location.href='join'">회원가입</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					${message}
				</td>
			</tr>
		</table>
	</form>
</body>
</html>