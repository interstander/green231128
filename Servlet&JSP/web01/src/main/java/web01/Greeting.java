package web01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/Gr", "/GT", "*.gt" })  
//@WebServlet("/gt")
public class Greeting extends HttpServlet {

//  옛날 서버프로그래밍에서는 url과 서블릿간의 매핑을 web.xml방식
//  웹모듈 3.0 이상은 url과 서블릿간의 매핑을 어노테이션(@WebServlet)을 통해서 매핑을 지원한다. 
//       => web.xml방식과 어노테이션 방식을 같이 사용하면 안된다. => 둘중 하나만 사용
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//  HttpServletRequest request  => 요청시 필요한 정보
		//  HttpServletResponse response => 응답시 필요한 정보
		
		System.out.println("새로 만든 서블릿!!");
	}


	
	// 서블릿의 동작 원리 => 생명주기(life cycle)
	//    서블릿 클래스
	//       최초 요청시 -> 인스턴스 생성    => init() : 인스턴스가 생성될 때 딱 한번 실행
	//                         -> service() 호출   => 요청이 올때마다 실행되는 메서드()
	//       2번째 이후 요청시 -> service()호출
	//   톰캣 서버 해제시 -> 서블릿 컨테이너 종료 -> 인스턴스 종료 => destroy() : 인스턴스가 소멸될 때 딱 한번 실행
	
	@Override
	public void destroy() {
		// 인스턴스가 소멸될 때 딱 한번 실행되는 메서드
		System.out.println("인스턴스 소멸 - destroy 메서드 실행");
	}

	@Override
	public void init() throws ServletException {
		// 인스턴스가 생성될 때 딱 한번 실행되는 메서드
		System.out.println("인스턴스 생성 - init 메서드 실행");
	}
	
	
	
	
	
	
	
	
	
	

}
