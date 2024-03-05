<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//  준비 작업
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uId = "GREEN";
	String uPwd = "1234";
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	Connection conn = null;
	PreparedStatement psmt = null;	
	
	String name = request.getParameter("name"); 
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	int admin = Integer.parseInt(request.getParameter("admin"));
	
	String sql = 
			" INSERT INTO memberTbl "+ 
			" VALUES(?,?,?,?,?,?) ";
	try{
		// 1. 단계 : 
		Class.forName(driver);
		// 2. 단계 : 
		conn = DriverManager.getConnection(url,uId,uPwd);
		// 3. 단계 : 
		psmt = conn.prepareStatement(sql);
		
		// 4. 단계 : 미완성 쿼리를 완성
		psmt.setString(1,name);
		psmt.setString(2,userid);
		psmt.setInt(6,admin);
		psmt.setString(3,userpwd);
		psmt.setString(4,email);
		psmt.setString(5,phone);
		
		// 5. 단계 :
		int num = psmt.executeUpdate();
		System.out.println("바뀐 행의 개수 : "+num);	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(psmt!=null){psmt.close();}
			if(conn!=null)conn.close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<script>
	alert('회원 가입이 완료 되었습니다.');
	location.href='index.jsp';
</script>


