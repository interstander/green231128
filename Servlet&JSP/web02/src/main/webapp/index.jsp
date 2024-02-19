<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--  
		JSP에 자바 코드를 끼워 넣는 방법 
		
		1. <%   %>   : 스크립트릿 : 브라우저에 HTML출력시 아무것도 안나옴
						-> 자바 데이터를 화면에 출력하는 방법 : out.print
		
		2. <%!  %>   : 선언문    : 변수나 메서드를 선언할 때 사용하는 공간
		
		3. <%-- --%><%-- : JSP 주석 : 설명이나 메모를 남기는 기능
<%--		
		4. <%=  %>   : 표현식 : 출력문 대체
			=> 	자바 데이터를 출력하기 위해 사용하는 out : 내장객체의 print 메서드가 필요
	
			print 메서드를 대체 : 표현식 내부에는 ;를 사용하면 안됨
	<%--   <%=변수 %>
		   <%=수식 %>
		   <%=메서드() %>
	--%>
<%--	
		5. <%@  %>  : 지시자 : 페이지 전체에 적용될 설정정보
		              - include : 다른 파일을 현재 JSP에 끼워넣을 때
		              	firstPage.jsp, secondPage.jsp, footer.jsp
		          	          
		              - page    : 페이지의 전반적인 설정
		                page.jsp 
		              - taglib  : 사용자 정의 태그를 사용할 수 있게 해주는 지시자
						  -> ' JSTL ' 
	
		include : 지시자의 주의점
	      동작원리 : JSP -> Java -> class -> HTML
	    include에 의해서 JSP가 하나로 합쳐지는 시점
	               JSP -(*)-> Java  
	         => 합쳐지는 각 JSP 파일에 변수나 메서드가 공유가 되므로 변수 중복이 발생할수 있다.
	      
	
	
	 --%>
	 <%!
	// _jspService 메서드 외부에 작성되는 공간
	 	int jumsu = 100; // 전역변수(인스턴스멤버변수)
	 	public String str1(){
	 		return "반가워요!";
	 	}
	 	
	 %>
	 <%
	 // _jspService 메서드 내부에 작성되는 공간
	 	int num1 = 10;   // 로컬변수
	 	int num2 = 20;
	 	
	 	int result = num1 + num2;
	 	
	 	out.print("합계 : "+result+"<br>");
	 	
/* 	 	public String str2(){   // 메서드 내부에는 메서드를 못 만든다.
	 		return "반가워요!";
	 	} */

	 %>
	 
	 <!-- HTML 주석 : JSP-> java -> HTML로 번역되는 과정에서 아무도 해석X =>브라우저가 해석 -->
	 <!--           ->  클라이언트까지 보내진다. -->
	 
	 <%-- JSP 주석 : JSP -> java : WAS가 자바주석으로 해석 --%>
	 <%--          -> 클라이언트까지 안 보내진다. --%>
	 
	 <%
	 	// 자바 주석
	 	/*
	 		자바 범위 주석
	 	*/
	 
	 %>
	 
	 <%
	 	out.print(num1); 
	 	out.print(" + ");
	 	out.print(num2);
	 	out.print(" = ");
	 	out.print(result);
	 	
	 	//   10
	 	//    +
	 	//   20
	 	//    = 
	 	//   30
	 	//  =>실제 출력  '10 + 20 = 30'
	 %>
	 <br>
	 <%=num1 %> + <%=num2 %> = <%=result %><br>
	 
	 
	 <a href="inputData.jsp">입력 데이터</a>
	 
	 
	 
</body>
</html>