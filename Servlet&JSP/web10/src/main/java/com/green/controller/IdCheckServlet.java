package com.green.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.MemberDao;


@WebServlet("/idCheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		
		MemberDao dao = MemberDao.getInstance();
		int result = dao.confirmId(userid);
		
		request.setAttribute("userid", userid); // 체크하고자 하는 아이디
		request.setAttribute("result", result); // 중복 결과
		
		request.getRequestDispatcher("member/idCheck.jsp")
			   .forward(request, response);
	}

}
