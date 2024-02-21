<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그아웃 => 세션 데이터 삭제
	session.invalidate();

	response.sendRedirect("loginForm.jsp");
%>