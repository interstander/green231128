package com.green.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.ProductDAO;


@WebServlet("/productDelete")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 코드값 읽어오기
		int code = Integer.parseInt(request.getParameter("code"));
		
		// 2. 읽어온 코드값으로 DBMS의 데이터 삭제
		ProductDAO dao = ProductDAO.getInstance();
		dao.deleteProduct(code);
		
		
		response.sendRedirect("productList");// 서블릿으로 보내기
	}

}
