<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");  // POST로 보내온 경우 한글 깨짐 방지
	
		String username = request.getParameter("username");
		System.out.println("이름 : "+username);
		int userage = Integer.parseInt(request.getParameter("userage"));
		System.out.println("나이 : "+userage);
		
		if(userage > 20){
			out.print(username+"씨는 성인입니다");
		}else{
			out.print(username+"씨는 성인이 아닙니다.");
		}
		
	%>
</body>
</html>