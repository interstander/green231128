package web01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/prt")
public class OutputServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("콘솔 출력");
		
		//response.setContentType("text/html");  // 우리가 출력할 출력물은 html문서이다.
		//                       MIME 타입 : 문서의 종류와 속성을 나타내는 키워드
	
		response.setContentType("text/html; charset=utf-8;");
		//                                   한글 출력시 깨짐을 방지
		
		// HTML문서 출력 => 인쇄기
		PrintWriter out = response.getWriter();
	
		out.print("<html>");
		out.print("<head>");
		out.print("<title> HTML 출력 </title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<p> 서블릿 동작후 출력된 HTML 인쇄물 </p>");
		out.print("</body>");
		out.print("</html>");
		
		
		
		
		
		
		
		
		
	}

}
