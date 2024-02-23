<%@page import="com.green.beans.Member"%>
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
	<h3> c:set 값을 저장 </h3>

<c:set var="msg" value="Hello" scope="request"/>
<%--   var="변수명(내장객체에 저장하기 위한 속성명)"
	   value="데이터"
	   scope="내장객체 범위" --%>
<%
	// request.setAttribute("msg", "Hello");
%>   
<hr>   
<h4>표현식</h4>
<%=request.getAttribute("msg").toString() %>
<h4>El 표기법</h4>
${msg}<br>  
<h4>JSTL 출력법</h4>	   
<c:out value="${msg}" />
<%-- c:out를 쓰는 이유?<<직접>>   --%>
<br>
<c:set var="add" value="${10+20}" />
합계 : ${add}<br>

<hr>
<h4>자바빈 객체</h4>
<c:set var="member" value="<%= new Member()%>"/>
<c:set target="${member}" property="userName" value="여행자"/>
<c:set target="${member}" property="userId" >
	Traveler
</c:set>
<br>
이름 : ${member.userName}<br>
아이디 : ${member["userId"] }<br>   
	   
<hr>
<h4> 변수에 값 삭제</h4>
<c:set var="test" >
	테스트
</c:set>
삭제전 : ${test}<br>
<c:remove var="test"/>
삭제후 : ${test}<br>
	   
	
	   
	   
	   
	   
	   
	   
</body>
</html>