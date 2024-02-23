<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> EL 표현식 내부에서 출력가능한 데이터타입 </h3>
정수 : ${30} <br>
실수 : ${1.23} <br>
문자열 : ${"반갑습니다"}<br>
논리타입 : ${true}<br>
null : ${null}(null값을 공백으로 출력)<br>
<hr>
	<h3> EL 표현식 내부에서 가능한 연산자 </h3>
5+2 : ${5+2}<br> 
5-2 : ${5-2}<br> 
5*2 : ${5*2}<br>
5/2 : ${5/2}<br>
5%2 : ${5%2}<br>
5 div 2 : ${5 div 2} <br>
5 mod 2 : ${5 mod 2} <br>
<hr>
5==2 : ${5==2}<br>
5!=2 : ${5!=2}<br>
5 eq 2 : ${5 eq 2}<br>
5 ne 2 : ${5 ne 2}<br>
5>=2 : ${5 >= 2}<br>
5 ge 2 : ${5 ge 2}<br>
5<=2 : ${5 <= 2}<br>
5 le 2 : ${5 le 2}<br>
<hr>
(5>2)?5:2 => ${(5>2)?5:2}<br>




</body>
</html>