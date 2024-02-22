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
	<%
		request.setCharacterEncoding("UTF-8");  //한글 깨짐 방지
	%>
<%-- 1. 자바빈 객체를 생성 --%>	
<%
	// 1) 스크립트릿
	// Member m1 = new Member();
%>
<%-- 2) 액션 태그 --%>
<jsp:useBean class="com.green.beans.Member" id="m2" scope="request" />


<%-- ------------------------------------------------------------------------ --%>
<%-- 2. 폼에서 가져온 데이터를 입력 --%>
<%
	// 1-1) 스크립트릿
/* 	String name = request.getParameter("name");
	String nickName = request.getParameter("nickName");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	m1.setName(name);
	m1.setNickName(nickName);
	m1.setUserId(userId);
	m1.setUserPwd(userPwd);
	m1.setEmail(email);
	m1.setPhone(phone); */
//-------------------------------------------------------------------
	// 1-2) 스크립트릿( = 1-1)
/* 	m1.setName(request.getParameter("name"));
	m1.setNickName(request.getParameter("nickName"));
	m1.setUserId(request.getParameter("userId"));
	m1.setUserPwd(request.getParameter("userPwd"));
	m1.setEmail(request.getParameter("email"));
	m1.setPhone(request.getParameter("phone")); */

%>	
<%-- <jsp:setProperty name="m2" property="name" value='<%=request.getParameter("name") %>'/> --%>
<%-- setProperty 자바빈 필드에 데이터를 저장하는 액션태그 
      name=""  어떤 자바빈
      property=""  어떤 속성(자바빈의 필드변수)
	  value=""   어떤 데이터
 --%>

<%--  <jsp:setProperty name="m2" property="userId"/>  --%>
 <%--  폼에서 읽어온 name과 자바빈의 필드명이 같은 경우 value를 생략 --%>


<%-- 폼에서 읽어온 데이터의 개수와 name이 자바빈의 필드 개수와 이름과 같다면 *을 이용해서 한꺼번 저장 --%>
 <jsp:setProperty name="m2" property="*"/> 


<%-- ------------------------------------------------------------------------ --%>
<%-- 3. ex05_output.jsp 자바빈을 보내도록 합니다. --%>
<%
	//  1) 스크립트릿
/* 	request.setAttribute("m1", m1);
	
	request.getRequestDispatcher("ex05_output.jsp").forward(request, response); */
%>
<%--   2) 자바빈은 scope로 이미 request에 저장했으므로 forward로 바로 보낸다. --%>
<jsp:forward page="ex05_output.jsp" />





</body>
</html>