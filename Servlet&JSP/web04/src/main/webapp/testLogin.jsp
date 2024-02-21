<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 저장된 데이터
	String id = "pink";
	String password = "pong";
	String name = "아기상어";

	// 폼에서 얻어온 데이터
	String userId = request.getParameter("userId");
	String userPassword = request.getParameter("userPassword");
	
	// 로그인 처리
	if(userId.equals(id) && userPassword.equals(password)){
		// 로그인 성공
		// 로그인 정보를 세션에 저장
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		
		response.sendRedirect("main.jsp"); // request 정보 유지 못하게
		
	}else{
		//로그인 실패
		response.sendRedirect("loginForm.jsp");
	}
	
%>