package com.green.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.ProductDAO;
import com.green.vo.ProductVO;


@WebServlet("/productDetail")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 코드값 읽어오기
		int code = Integer.parseInt(request.getParameter("code"));
		
		// 2. 상품 정보 조회 하기
		ProductDAO dao = ProductDAO.getInstance();
		ProductVO pVo = dao.selectProductByCode(code);
		
		request.setAttribute("product", pVo);
		
		// 3. 뷰 페이지로 이동
		request.getRequestDispatcher("product/productDetail.jsp")
				.forward(request, response);
		
	}

}
