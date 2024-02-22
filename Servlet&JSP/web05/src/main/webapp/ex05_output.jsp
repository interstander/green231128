<%@page import="com.green.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 입력된 회원 정보 출력</h3>
<%-- 1) 스크립트릿  --%>
<%
	// Member m1 = (Member)request.getAttribute("m1");
%>
<%-- 이름 :    <%=m1.getName() %><br>
별명 :    <%=m1.getNickName() %><br>
아이디 :  <%=m1.getUserId() %><br>
비밀번호 : <%=m1.getUserPwd() %><br>
이메일 :  <%=m1.getEmail() %><br>
전화번호 : <%=m1.getPhone() %><br> --%>
<hr>
<%-- 이미 존재하는 자바빈의 경우 생성이 아닌 읽어오세요 --%>
<jsp:useBean class="com.green.beans.Member" id="m2" scope="request" />
이름 :    <jsp:getProperty name="m2" property="name" /><br>
별명 :    <jsp:getProperty name="m2" property="nickName" /><br>
아이디 :  <jsp:getProperty name="m2" property="userId" /><br>
비밀번호 : <jsp:getProperty name="m2" property="userPwd" /><br>
이메일 :  <jsp:getProperty name="m2" property="email" /><br>
전화번호 : <jsp:getProperty name="m2" property="phone" /><br>



</body>
</html>