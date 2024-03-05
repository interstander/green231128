package com.green.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.green.dao.MemberDao;
import com.green.dto.MemberDto;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login.jsp";
		
		// 이미 로그인 한 사용자가 있다면  => main.jsp
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null) {
			url = "main.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login.jsp";
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		
		// 로그인 인증 처리
		MemberDao dao = MemberDao.getInstance();
		int result = dao.userCheck(userid, userpwd);
		
		if(result == 1) { // 로그인 성공 => 세션 처리
			MemberDto mto = dao.getMember(userid);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mto);
			
			url = "main.jsp";
		}else if(result == 0) { // 비밀번호가 틀린경우
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		}else if(result == -1) {// 아이디가 없는 경우
			request.setAttribute("message", "존재하지 않는 회원 입니다.");
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
		
		
		
	}

}
