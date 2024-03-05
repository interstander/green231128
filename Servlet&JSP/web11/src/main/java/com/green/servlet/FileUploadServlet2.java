package com.green.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload2")
public class FileUploadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("ex02_multiFileUpload.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8;");
		PrintWriter out = response.getWriter();
		
		// 실제 파일 저장 위치
		String savePath = "upload";
		String uploadFilePath = getServletContext().getRealPath(savePath);
		System.out.println("서버상 저장 디렉토리 : "+uploadFilePath);
		
		// 최대 업로드 파일 크기 5mb => 모든 파일을 합친 크기
		int uploadFileSize = 5*1024*1024;
		
		// 인코딩 방식
		String encodeType = "UTF-8";
		
		try{
			MultipartRequest multi = 
					new MultipartRequest(
							request,
							uploadFilePath,
							uploadFileSize,
							encodeType,
							new DefaultFileRenamePolicy());
			if(multi == null){
				System.out.println("업로드 실패");
			}else {
				System.out.println("업로드 성공");
			}
			
			Enumeration<String> fileNames = multi.getFileNames(); 
			
			while(fileNames.hasMoreElements()) {
				String file = (String)fileNames.nextElement();
								//  파일의 name값 
				
				String fileName = multi.getFilesystemName(file);
					//  실제 파일명 => 저장된 파일명
				
				String originFileName = multi.getOriginalFileName(file);
					// 정책에 의해 변경되기전 원본 파일명
				
				out.print("<br> 업로드된 파일명 : "+fileName);
				out.print("<br> 원본 파일명 : "+originFileName);
				out.print("<hr>");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
