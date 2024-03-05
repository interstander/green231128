package com.green.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.ProductDAO;
import com.green.vo.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/productWrite")
public class ProductWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼페이지를 연결시켜주는 역할
		request.getRequestDispatcher("product/productWrite.jsp")
				.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼으로부터 입력된 글을 DB에 등록시켜주는 역할
		request.setCharacterEncoding("UTF-8");
		
		String savepath = "Z:\\upload";
		int filesize = 100*1024*1024;
		String encType = "UTF-8";
		try {
			// 1. 폼에서 데이터 가져오기
			MultipartRequest mReq =
					new MultipartRequest(
							request,
							savepath,
							filesize,
							encType,
							new DefaultFileRenamePolicy()
							);
			
			ProductVO pVo = new ProductVO();
			
			pVo.setName(mReq.getParameter("name"));
			pVo.setPrice(Integer.parseInt(mReq.getParameter("price")));
			pVo.setPictureurl(mReq.getFilesystemName("pictureurl"));
			pVo.setDescription(mReq.getParameter("description"));
			
			// 2. 가져온 데이터를 DB에 넘겨주기
			ProductDAO dao = ProductDAO.getInstance();
			dao.insertProduct(pVo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("productList");// 서블릿으로 보내기
	}

}
