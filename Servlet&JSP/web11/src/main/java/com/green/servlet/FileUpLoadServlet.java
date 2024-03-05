package com.green.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload1")
public class FileUpLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("ex01_fileUpload.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8;");
		PrintWriter out = response.getWriter();
		
		// cos 라이브러리를 사용할 것
		//  - MultipartRequest 객체를 활용
		//       => request객체를 포함하는 객체
		//  MultipartRequest객체를 생성하기 위해서 필요한 데이터
		//    1. 폼으로 부터 받아온 Request 객체
		//    2. 실제 파일 저장 위치
		//    3. 최대 업로드 파일 크기(Byte)
		//    4. 파일 인코딩 방식 (UTF-8)
		//    5. 동일이름 정책
		
		// 실제 파일 저장 위치
		String savePath = "upload";
		String uploadFilePath = getServletContext().getRealPath(savePath);
		System.out.println("서버상 저장 디렉토리 : "+uploadFilePath);
		
		// 최대 업로드 파일 크기 5mB
		int uploadFileSize = 5*1024*1024;
		
		// 인코딩 방식
		String encodeType = "UTF-8";
		try {
			MultipartRequest multi =  // MultipartRequest 객체 생성시 파일 업로드 완료
					new MultipartRequest(
							request,
							uploadFilePath,
							uploadFileSize,
							encodeType,
							new DefaultFileRenamePolicy()
							// 중복이름 발생시 번호를 붙여서 추가하는 방식
							);
			String fileName =  multi.getFilesystemName("file1");
							//    getParameter(""); => 문자열 읽을 때
							//    getFilesystemName(""); => 파일 이름 읽어올 때	
			if(fileName == null) {// 파일 업로드 실패
				System.out.println("파일 업로드 실패");
			}else { //파일 업로드 성공
				out.print("<br> 글쓴이 : "+multi.getParameter("writer"));
				out.print("<br> 글제목 : "+multi.getParameter("title"));
				out.print("<br> 파일명 : "+fileName);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
