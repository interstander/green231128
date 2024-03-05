<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>데이터베이스 조회</h3>
<%
	// 준비 작업
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
	String uId = "GREEN";
	String uPwd = "1234";

	String sql = "SELECT * FROM memberTbl";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try{
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		
/* 		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,uId,uPwd); */
		// 3.단계 : 쿼리문을 전달할 객체 생성
		stmt = conn.createStatement();	
		// 4.단계 : 쿼리문을 실제 전달하는 단계
		rs = stmt.executeQuery(sql);	
		// 5.단계 :  데이터를 꺼내서 출력
		while(rs.next()){
			out.print("이름 : "+rs.getString("name")+"<br>");
			out.print("아이디 : "+rs.getString("userid")+"<br>");
			out.print("비밀번호 : "+rs.getString("userpwd")+"<br>");
			out.print("이메일 : "+rs.getString("email")+"<br>");
			out.print("전화번호 : "+rs.getString("phone")+"<br>");
			out.print("사용자/관리자 : "+rs.getInt("admin")+"<br>");
			out.print("<hr>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

%>
	
<hr>
</body>
</html>