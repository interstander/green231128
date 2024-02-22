<%@page import="com.green.beans.Student"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	if(session.getAttribute("studentList") == null){
		// 저장된 학생이 아무도 없는 경우
%>
	<script>
		alert('학생 데이터가 없습니다.');
		location.href="./studentScoreManagement.jsp";
	</script>
<%	
	}else{
		Map<String,Student> students = (Map<String,Student>)session.getAttribute("studentList");
		String studentName = request.getParameter("studentName");
		
		if(students.containsKey(studentName)){
			// 학생 이름이 있는 경우
			Student student = students.get(studentName);
			request.setAttribute("student", student);
			request.getRequestDispatcher("printScore.jsp").forward(request, response);
			
		}else{
			// 검색하고자 하는 학생 이름이 없는 경우
	%>
		<script>
			alert('해당 학생을 찾을 수 없습니다.');
			location.href="./studentScoreManagement.jsp";
		</script>
	<%
		}
		
	}


%>