<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지 - 관리자 페이지</title>
<link type="text/css" rel="stylesheet" href="style/product.css">
</head>
<body>
<div id="wrap" align="center">
	<h1>상품 상세 페이지 - 관리자 페이지</h1>
		<table>
			<tr>
				<td rowspan="3">
				<%-- - CORS [과제] --%>
					<c:choose>
						<c:when test="${empty product.pictureurl}">
							<img src="/img/noimage.jpg">
						<%-- server.xml : Context docBase="Z:\upload" path="/img"  --%>
						</c:when>
						<c:otherwise>
							<img src="/img/${product.pictureurl}">
						</c:otherwise>
					</c:choose>	
				</td>
				<th>상품명</th>
				<td>${product.name}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${product.price}</td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td>
					<textarea rows="10" cols="90" name="description" readonly>${product.description}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="button" 
						onclick="location.href='productUpdate?code=${product.code}'">수정하기</button>
					<button type="button" 
						onclick="location.href='productDelete?code=${product.code}'">삭제하기</button>
					<button type="button" onclick="location.href='productList'">목록 보기</button>
				</td>
			</tr>
		</table>
</div>
</body>
</html>