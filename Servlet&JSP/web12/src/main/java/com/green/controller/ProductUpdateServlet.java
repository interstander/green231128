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

@WebServlet("/productUpdate")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 코드값을 통해서 상품정보를 가지고 수정 폼페이지로 이동
		// 1. 코드값 읽어오기
		int code = Integer.parseInt(request.getParameter("code"));
		
		// 2. 읽어온 코드값으로 DBMS 상품 조회
		ProductDAO dao = ProductDAO.getInstance();
		ProductVO product = dao.selectProductByCode(code);
		
		request.setAttribute("product", product);
		
		// 3. 조회된 상품 정보를 가지고 폼페이지로 이동
		request.getRequestDispatcher("product/productUpdate.jsp")
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
//			pVo.setPictureurl(mReq.getFilesystemName("pictureurl"));
			String pictureurl = mReq.getFilesystemName("pictureurl");
			if(pictureurl == null) {
				pictureurl = mReq.getParameter("originPic");
			}
			pVo.setPictureurl(pictureurl);
			pVo.setDescription(mReq.getParameter("description"));
			
			pVo.setCode(Integer.parseInt(mReq.getParameter("code")));
			
			// 2. 가져온 데이터를 DB에 넘겨주기
			ProductDAO dao = ProductDAO.getInstance();
			//dao.insertProduct(pVo);
			dao.updateProduct(pVo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("productList");// 서블릿으로 보내기
	}

}
