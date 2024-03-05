package com.green.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.MemberDao;
import com.green.dto.MemberDto;


@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("member/join.jsp")
			   .forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int admin = Integer.parseInt(request.getParameter("admin"));
		
		MemberDto member = new MemberDto();
		member.setName(name);
		member.setUserid(userid);
		member.setUserpwd(userpwd);
		member.setEmail(email);
		member.setPhone(phone);
		member.setAdmin(admin);
		
		MemberDao dao = MemberDao.getInstance();
		int result = dao.insertMember(member);
		
		if(result==1) { //가입이 잘됨
			request.setAttribute("userid", userid);
			request.setAttribute("message", "회원 가입이 성공했습니다.");
		}else {// 가입 실패
			request.setAttribute("message", "회원 가입이 실패했습니다.");
		}
		
		request.getRequestDispatcher("member/login.jsp")
		   .forward(request, response);

	}

}
