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
	<h3>회원 목록</h3>
<%
	// 준비 작업
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
	String uId = "GREEN";
	String uPwd = "1234";
	
	String sql = "SELECT * FROM memberTbl ORDER BY name ASC";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
%>	
<table border="1">
	<tr>
		<td>이름</td>
		<td>아이디</td>
		<td>권한(1:관리자, 0:일반회원)</td>
	</tr>
<%
	try{
		// 1.단계 : 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2.단계 : 데이터베이스 연결(연결 객체 준비);
		conn = DriverManager.getConnection(url,uId,uPwd);
		// 3.단계 : 쿼리문을 전달할 객체 생성
		stmt = conn.createStatement();
		// 4.단계 : 쿼리문을 실제 전달하는 단계
		rs = stmt.executeQuery(sql);
		// 5.단계 :  데이터를 꺼내서 출력
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString("name")+"</td>");
			out.print("<td><a href='memberDetail.jsp?userid="+rs.getString("userid")+"'>"+rs.getString("userid")+"</a></td>");
			out.print("<td>"+rs.getInt("admin")+"</td>");
			out.print("</tr>");
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
	<tr>
		<td colspan="3"> 
			<button type="button" onclick="home()">홈으로</button>
		</td>
	</tr>	
</table>

<script type="text/javascript">

	function home(){
		alert("메인 페이지로 돌아갑니다.");
		location.href='index.jsp';
	}
	
</script>



</body>
</html>