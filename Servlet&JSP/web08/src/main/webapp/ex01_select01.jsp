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
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; // 서버주소 + 포트번호 + SID
	String uId = "GREEN";
	String uPwd = "1234";

	String sql = "SELECT * FROM memberTbl";
	//  1) 디벨로퍼에서 테스트 후 실행 권장
	//  2) 끝에 ;은 빼고 작성
	
	// 0.단계 : 연결을 위한 변수를 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try{
		// 1.단계 : 드라이버 로드
		//    -- 일반적인 객체를 생성하는 방법 : new 생성자();
		//    -- 클래스의 모든 정보를 읽어와서 객체를 생성하는 방법 : Class.forName("패키지.클래스명");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2.단계 : 데이터베이스 연결(연결 객체 준비);
		//Connection conn = DriverManager.getConnection(url,uId,uPwd);
		conn = DriverManager.getConnection(url,uId,uPwd);
		
		// 3.단계 : 쿼리문을 전달할 객체 생성
		//Statement stmt = conn.createStatement();
		stmt = conn.createStatement();
		
		// 4.단계 : 쿼리문을 실제 전달하는 단계
		//   - stmt.executeQuery(sql);
		//      --  데이터를 읽어오기 위한 쿼리(select)를 보내는 메서드  
		//   - stmt.executeUpdate(sql);
		//      --  데이터를 보내기 위한 쿼리(Inert, Update, Delete)를 보내는 메서드
		//ResultSet rs = stmt.executeQuery(sql);
		rs = stmt.executeQuery(sql);
		
		// 5.단계 :  데이터를 꺼내서 출력
		//   레코드가 1개 또는 0개 경우 : if(rs.next()){~~} 
		//   레코드가 다수인 경우 : while(rs.next()){~~}
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
		// 각 객체를 닫아주는 코드
		try{
			if(rs!=null){
				rs.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(conn!=null){
				conn.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
%>
	
<hr>
</body>
</html>