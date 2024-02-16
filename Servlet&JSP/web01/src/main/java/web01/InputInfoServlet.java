package web01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/IIS")
public class InputInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		int userage = Integer.parseInt(request.getParameter("userage"));
							// input 태그의 타입과 관계없이 무조건 문자열로 처리
		
		// 데이터 묶음으로 전송되는 경우에는 배열로 전달받는다.
		String[] hobbys = request.getParameterValues("hobby");
		
		System.out.println("클라이언트가 보내온 이름 : "+ username);
		System.out.println("클라이언트가 보내온 나이 : "+ userage);
		for(String hobby : hobbys) {
			System.out.println("입력된 취미 : "+hobby);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// POST 전송의 경우 한글이 깨져서 전송이 된다.
		// POST 전송에서 한글 깨짐 방지 방법
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("username");
		int userage = Integer.parseInt(request.getParameter("userage"));
							// input 태그의 타입과 관계없이 무조건 문자열로 처리
		
		System.out.println("클라이언트가 보내온 이름 : "+ username);
		System.out.println("클라이언트가 보내온 나이 : "+ userage);
		
		
		response.setContentType("text/html; charset=utf-8;");
		
		PrintWriter out = response.getWriter();
		out.print("<body>");
		out.print("<p>입력한 이름 : "+username+"</p>");
		out.print("<p>입력한 나이 : "+userage+"</p>");
		String gender = request.getParameter("gender");
		if(gender.equals("male")) {
			out.print("<p>남성입니다.</p>");
		}else if(gender.equals("female")) {
			out.print("<p>여성입니다.</p>"); 
		}
		String[] hobbys = request.getParameterValues("hobby");
		out.print("<p>");
		for(String hobby:hobbys) {
			out.println("입력된 취미 : "+hobby+"<br>");
		}
		out.print("</p>");
		out.print("</body>");
		
		
		
	}

}
