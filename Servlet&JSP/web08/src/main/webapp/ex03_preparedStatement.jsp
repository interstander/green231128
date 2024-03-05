<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>PreparedStatement를 사용해서 데이터 삽입</h3>
	
<%
	//  준비 작업
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uId = "GREEN";
	String uPwd = "1234";
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	Connection conn = null;
//	Statement stmt = null;
//      ↓ (상속받아서 만들어졌다.)
//  PreparedStatement란 쿼리문을 ?(바인딩 변수)를 이용해서 작성한 후
//	  나중에  바인딩 변수를 채워 넣는 방식
	PreparedStatement psmt = null;	
	
	String name = "강길동"; 
	String userid = "kang";
	String userpwd = "1234";
	String email = "kang@naver.com";
	String phone = "010-1234-5678";
	int admin = 0;
	
	String sql = 
			" INSERT INTO memberTbl "+ 
			" VALUES(?,?,?,?,?,?) ";
	try{
		// 1. 단계 : 
		Class.forName(driver);
		// 2. 단계 : 
		conn = DriverManager.getConnection(url,uId,uPwd);
		// 3. 단계 : 
//		stmt = conn.createStatement();
		psmt = conn.prepareStatement(sql); // ??로 채워진 미완성 쿼리를 전달
		
		// 4. 단계 : 미완성 쿼리를 완성
		psmt.setString(1,name);
		psmt.setString(2,userid);
		psmt.setInt(6,admin);
		psmt.setString(3,userpwd);
		psmt.setString(4,email);
		psmt.setString(5,phone);
		
		// 5. 단계 :
		int num = psmt.executeUpdate();// 쿼리문 실행시 sql를 넣지 않는다.
		System.out.println("바뀐 행의 개수 : "+num); // 0이라면 바뀐게 없다!	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(psmt!=null){psmt.close();}
			if(conn!=null)conn.close();  // 조건,반복문 내부의 실행문이 1줄일 때 {}생략가능	
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
	
</body>
</html>