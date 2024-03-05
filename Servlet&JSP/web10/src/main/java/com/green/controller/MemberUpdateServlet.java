package com.green.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.MemberDao;
import com.green.dto.MemberDto;


@WebServlet("/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 업데이트 폼으로 이동
		String userid = request.getParameter("userid");
	
		MemberDao dao = MemberDao.getInstance();
		MemberDto mto = dao.getMember(userid);
		
		request.setAttribute("member", mto);
		request.getRequestDispatcher("member/memberUpdate.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼에서 얻어온 정보로 기존 정보를 변경
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
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
		dao.updateMember(member);
		
		response.sendRedirect("login");
		
		
	}

}
