<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>액션 태그로 자바빈 활용하기</h3>
	<%--   
		<jsp:useBean class="com.green.beans.Member"   빈 객체를 어디서 가져왔나?  
					 id="member" 					  저장할 변수 이름
					 scope="page/[request]/session/application"> 저장할 범위의 내장 객체
		=>
		자바빈이 없는 상태
		com.green.beans.Member member = new com.green.beans.Member();
		request.setAttribute("member",member);
	
		자바빈이 있는 상태
		(com.green.beans.Member member)request.getAttribute("member");

	 useBean은 해당 내장 객체에 자바빈이 없다면 '생성'
	 useBean은 해당 내장 객체에 자바빈이 있다면 '읽어오기'
	 
	
	--%>
	
	
</body>
</html>