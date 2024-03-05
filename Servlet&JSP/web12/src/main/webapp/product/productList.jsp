<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 - 관리자 페이지</title>
<link type="text/css" rel="stylesheet" href="style/product.css">
</head>
<body>
<div id="wrap" align="center">
	<h1>상품 리스트 - 관리자 페이지</h1>
	<table class="list">
		<tr>
			<th>번호</th>
			<th>코드</th>
			<th>이름</th>
			<th>가격</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="product" items="${productLists}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${product.code}</td>
				<td><a href="productDetail?code=${product.code}">${product.name}</a></td>
				<td>${product.price}</td>
				<td><a href="productUpdate?code=${product.code}">상품 수정</a></td>
				<td><a href="productDelete?code=${product.code}">상품 삭제</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" style="border: white; text-align: right;">
				<a href="productWrite">상품 등록</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>