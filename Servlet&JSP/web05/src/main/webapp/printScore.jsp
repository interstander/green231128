<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>학생 성적 정보</h3>
	<jsp:useBean id="student" class="com.green.beans.Student" scope="request" />
	이름 : <jsp:getProperty property="studentName" name="student"/> <br>
	국어점수 : <jsp:getProperty property="korScore" name="student"/> <br>
	영어점수 : <jsp:getProperty property="engScore" name="student"/> <br> 
	<%-- getproperty 이름 : engScore =>[자바] getEngScore()    --%>
	수학점수 : <jsp:getProperty property="mathScore" name="student"/> <br>
	사회점수 : <jsp:getProperty property="socScore" name="student"/> <br>
	과학점수 : <jsp:getProperty property="sciScore" name="student"/> <br>
	총점 : <jsp:getProperty property="sumScore" name="student"/> <br>
	평균 : <jsp:getProperty property="avgScore" name="student"/> <br>
	
	<a href="studentScoreManagement.jsp">돌아가기</a>
</body>
</html>