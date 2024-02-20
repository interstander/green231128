<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); // POST 전송시 한글 깨짐 방지
	
	//  저장된 계정 정보
	String id = "green";
	String pwd = "1234";
	String name = "김그린";
	
	// 폼에서 읽어온 계정 정보
	String userId = request.getParameter("userId");
	String userPassword = request.getParameter("userPassword");
	
	
	//  로그인 기능 처리
	if(userId.equals(id) && userPassword.equals(pwd)){
		// 로그인 성공 => 포워드 
		request.setAttribute("name", name);
		request.getRequestDispatcher("ex07_main.jsp").forward(request, response);
	}else{
		// 로그인 실패 => 리다이렉트로 이동
		response.sendRedirect("ex07_loginFail.jsp");
	}
	
	
	

%>