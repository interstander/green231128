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
	<h3>데이터 삽입</h3>
	
<%
	//  준비 작업
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uId = "GREEN";
	String uPwd = "1234";
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	Connection conn = null;
	Statement stmt = null;
	// 데이터를 DBMS에 보내는 쿼리의 경우 ResultSet은 필요없다.
	
//	String sql = 
//	"INSERT INTO memberTbl VALUES('최길동','choi','1234','choi@naver.com','010-1234-5678',0)";
	
	String name = "최길동"; // request.getParameter("name");  / request.getAttribute("name");
	String userid = "choi";
	String userpwd = "1234";
	String email = "choi@naver.com";
	String phone = "010-1234-5678";
	int admin = 0;

	String sql = 
			" INSERT INTO memberTbl "+ 
			" VALUES('"+name+"','"+userid+"','"+userpwd+"','"+email+"','"+phone+"',"+admin+") ";
	
	try{
		// 1. 단계 : 
		Class.forName(driver);
		// 2. 단계 : 
		conn = DriverManager.getConnection(url,uId,uPwd);
		// 3. 단계 : 
		stmt = conn.createStatement();
		// 4. 단계 :
		int num = stmt.executeUpdate(sql);
		System.out.println("바뀐 행의 개수 : "+num); // 0이라면 바뀐게 없다!	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(stmt!=null){stmt.close();}
			if(conn!=null)conn.close();  // 조건,반복문 내부의 실행문이 1줄일 때 {}생략가능	
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	

%>
</body>
</html>