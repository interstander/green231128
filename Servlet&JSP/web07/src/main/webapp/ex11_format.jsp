<%@page import="java.util.Date"%>
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
	<h3>숫자 표기</h3>
<fmt:formatNumber value="1234567.89" /><br> <!-- 1,234,567.89 -->
<fmt:formatNumber value="1234567.89" groupingUsed="false"/><br> <!-- 1234567.89 -->
<fmt:formatNumber value=".89" type="percent"/><br> <!-- 89% -->
<fmt:formatNumber value="50000" type="currency"/><br> <!-- W 50,000 -->
<fmt:formatNumber value="50000" type="currency" currencySymbol="₤"/><br> <!-- ₤ 50,000 -->	
	
<hr>

<fmt:formatNumber value="123456789.45678" pattern="#,#00.0#"/><br> <!-- 123,456,789.46 -->
<fmt:formatNumber value="1234.5" pattern="#,#00.0#"/><br> <!-- 1,234.5  -->
<fmt:formatNumber value="1234.5" pattern="#,#00.000"/><br> <!-- 1,234.500  -->
<fmt:formatNumber value="1234.5" pattern="000,000.000"/><br> <!-- 001,234.500  -->

<hr>
<c:set var="now" value="<%= new Date() %>"/>
<fmt:formatDate value="${now}"/><br> <!-- 2024. 2. 23. -->
<fmt:formatDate value="${now}" type="time"/><br> <!-- 오후 5:29:18 -->
<fmt:formatDate value="${now}" type="both"/><br> <!-- 2024. 2. 23. 오후 5:29:18 -->
<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 a hh시 mm분 ss시"/><br>

<hr>

<fmt:timeZone value="GMT" >
	GMT : <fmt:formatDate value="${now}" type="both"/><br>
</fmt:timeZone>

<fmt:timeZone value="GMT-8" >
	GMT-8 : <fmt:formatDate value="${now}" type="both"/><br>
</fmt:timeZone>

<hr>
<p>톰캣 서버의 기본 로케일 : <%=response.getLocale() %></p>
<hr>
<fmt:setLocale value="lt_LT"/>
로케일을 리투아니아어로 설정한 로케일 : <%=response.getLocale() %><br>
통화표기 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜표기 : <fmt:formatDate value="${now}" type="both"/><br>
<hr>
<fmt:setLocale value="ja_JP"/>
로케일을 일본어로 설정한 로케일 : <%=response.getLocale() %><br>
통화표기 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜표기 : <fmt:formatDate value="${now}" type="both"/><br>
<hr>
<fmt:setLocale value="en_US"/>
로케일을 미국어로 설정한 로케일 : <%=response.getLocale() %><br>
통화표기 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜표기 : <fmt:formatDate value="${now}" type="both"/><br>
<hr>
<fmt:setLocale value="ko_KR"/>
로케일을 한국어로 설정한 로케일 : <%=response.getLocale() %><br>
통화표기 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜표기 : <fmt:formatDate value="${now}" type="both"/><br>

</body>
</html>




