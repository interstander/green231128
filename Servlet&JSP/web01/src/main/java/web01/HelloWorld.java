package web01;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorld extends HttpServlet{// 클라이언트의 요청에 대응하기 위한 클래스 : 서블릿
						//        HttpServlet이라는 하는 클래스를 상속받아야 진짜 서블릿으로의 역할을 할수 있다.
//	public void taxt() {
//		System.out.println("서블릿 동작 완료!");
//	}
	
	
//	타입(HttpServlet) aaa = new web01.HelloWorld();==>  톰캣이 지정한 클래스,인터페이스든 상속,구현을 받아서 만들어야한다.
//	aaa.메서드();  -> aaa.service();
//	     -> 타입을 보고 aaa라는 참조 변수에 메서드가 있구나를 알수가 있다.
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
					throws ServletException, IOException {
		System.out.println("서블릿 동작 완료!");
	}

	
}
