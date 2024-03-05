<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	<h3>회원 상세 정보</h3>
<%
	String user = request.getParameter("userid");
	// 준비 작업
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
	String uId = "GREEN";
	String uPwd = "1234";
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	String sql = "SELECT * FROM memberTbl WHERE userid=?";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

%>
<table border="1">
	<tr>
		<td>이름</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이메일</td>
		<td>전화번호</td>
		<td>사용자(0)/관리자(1)</td>
	</tr>
<%
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,uId,uPwd);
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, user);
		
		rs = psmt.executeQuery();
		
		if(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString("name")+"</td>");
			out.print("<td>"+rs.getString("userid")+"</td>");
			out.print("<td>"+rs.getString("userpwd")+"</td>");
			out.print("<td>"+rs.getString("email")+"</td>");
			out.print("<td>"+rs.getString("phone")+"</td>");
			out.print("<td>"+rs.getInt("admin")+"</td>");
			out.print("<tr>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null)rs.close();
			if(psmt!=null)psmt.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
	<tr>
		<td colspan="6">
			<button type="button" onclick="list()">목록 보기</button>
			<button type="button" onclick="home()">홈 페이지 돌아가기</button>
		</td>
	</tr>
</table>

<script type="text/javascript">
	function list(){
		alert("회원 목록 페이지로 돌아갑니다.");
		location.href='memberList.jsp';
	}

	function home(){
		alert("메인 페이지로 돌아갑니다.");
		location.href='index.jsp';
	}
	
</script>



</body>
</html>