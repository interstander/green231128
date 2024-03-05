package com.green.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig(
		location = "Z:\\upload",
		maxFileSize = -1,
		maxRequestSize = -1,
		fileSizeThreshold = 1024)
@WebServlet("/upload3")
public class FileUploadServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("ex03_partFileUpload.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8;");
		
		PrintWriter out = response.getWriter();
		
		// 실제 저장 위치
//		String savePath = "upload";
//		String uploadFilePath = getServletContext().getRealPath(savePath);
		String uploadFilePath = "Z:\\upload";
		
		Collection<Part> parts = request.getParts();
		
		for(Part part:parts) {
			System.out.println("Name : "+part.getName());
			System.out.println("ContentType : "+part.getContentType());
			System.out.println("Size : "+part.getSize());
			System.out.println("FileName : "+part.getSubmittedFileName());
			System.out.println("Header : "+part.getHeader("Content-Disposition"));
			
			System.out.println("------------------------------------");
			// part로 가져온 정보가 파일이냐 아니냐
			//  - 파일이라면 현재 임시공간에 있으므로 저장소에 저장 처리
			//  - 파일 아니라면 문자열 읽기
			if(part.getHeader("Content-Disposition").contains("filename")) {
				// 이 part는 파일이다.
				//  -> 디스크에 저장
				String filename = part.getSubmittedFileName();
				
				if(part.getSize() > 0) {
					part.write(uploadFilePath+File.separator+filename);
					// ~~~upload+"\"+파일명 
					part.delete(); // 임시저장소에 있던 파일을 제거
					// 메서드가 완료되면 자동으로 삭제됨
					out.print("<br> 파일 데이터 : "+filename);
				}
				
				
			}else {
				// 이 part는 파일이 아니다.
				String data = request.getParameter(part.getName());
				out.print("<br> 텍스트 데이터 : "+data);
			}
			out.print("<hr>");
			
			
			
			
			
		}
		
		
		
		
	}

}
