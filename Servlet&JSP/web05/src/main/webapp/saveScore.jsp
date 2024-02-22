<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.green.beans.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Map<String,Student> students = null;//new HashMap<>();  // 없으면 만들고 있으면 그냥 사용
	if(session.getAttribute("studentList")==null){
		// 세션에 저장된 맵이 없다.  => 새로운 맵을 만들어야 한다.
		students = new HashMap<>();
	}else{
		// 세션에 저장된 맵이 있다.  => 저장된 맵을 꺼내서 사용
		students = (Map<String,Student>)session.getAttribute("studentList");
	}
	

	// 자바빈
	Student student = new Student();
	student.setStudentName(request.getParameter("studentName"));
	student.setKorScore(Integer.parseInt(request.getParameter("korScore")));
	student.setEngScore(Integer.parseInt(request.getParameter("engScore")));
	student.setMathScore(Integer.parseInt(request.getParameter("mathScore")));
	student.setSocScore(Integer.parseInt(request.getParameter("socScore")));
	student.setSciScore(Integer.parseInt(request.getParameter("sciScore")));

	//students.put(request.getParameter("studentName"),student);
	students.put(student.getStudentName(),student);
	
	session.setAttribute("studentList", students);
	
	request.setAttribute("student", student);
	
	request.getRequestDispatcher("printScore.jsp").forward(request, response);
	
%>