package com.green.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 첫 페이지가 열리는 데 필요한 데이터를 수집하기 위한 서블릿
		
		request.setAttribute("name", "그린 아카데미");
		request.getRequestDispatcher("test.jsp").forward(request, response);
	}

}
