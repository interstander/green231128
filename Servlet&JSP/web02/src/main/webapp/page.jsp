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
		page 지시자 : JSP 페이지의 여러 정보를 나타내기 위한 JSP 문법
		<%@ page 속성=값 속성=값 속성=값 %>
		
		어떤 속성이 잇는가?
		 - language : JSP에서 사용되는 언어를 결정, Java 고정
		 - contentType : 페이지의 MIME타입을 결정
		      = 보통 HTML문서이므로 text/html; 값을 지정
		      = 페이지 인코딩방식 : charset=UTF-8; 값으로 지정
		 - pageEncoding : 페이지를 Java 코드로 번역할 때 사용할 인코딩 방식
		 
		 - info : 페이지에 대한 간략한 설명을 기록하는 용도
		 
		 - buffer : 대용량 데이터를 전송하기 위해 출력버퍼에 데이터가 쌓일 때까지 기다렸다가 한꺼번에 클라이언트에게 제공하는 기능
		 	기본값 : 8KB , 버퍼 크기를 늘리면 버퍼가 찰때 까지 전송을 안하므로 오히려 속도가 느려질수 있다
		 	버퍼를 사용하지 않는 경우 none
		 
		 - autoflash : 버퍼를 비우기 위한 속성
		         true : 버퍼가 차면 자동으로 비워서 클라이언트에게 내보냄
		         false : 버퍼가 차면 에러 발생
		         
		   buffer=none, autoflash=flase 를 같이 설정하면 반드시 에러가 발생
		
		 - isThreadSafe : 멀티스레드 상황에서 여러 사용자가 동시에 페이지를 요청하는 경우
		 				문제가 생길수 있는 상황을 막기 위해 사용하는 속성
		 				true로 두면 페이지가 스레드에 안전하게 작동
		 				                 => 여러사용자가 동시에 페이지를 이용할수 없게 제한
		 
		 - errorpage : 현재 페이지에서 에러가 발생했을 경우 보여줄 페이지
		 - isErrorpage : 현재 페이지가 에러페이지인지 알려주는 속성
		                 - exception의 원인을 보여주는 페이지로서 사용
		   
		   에러 예제 :  err01.jsp -> err02.jsp
		
		
	 --%>
	 
	 
</body>
</html>