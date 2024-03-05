<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지 - 관리자 페이지</title>
<link type="text/css" rel="stylesheet" href="style/product.css">
</head>
<body>
<div id="wrap" align="center">
	<h1>상품 수정 페이지 - 관리자 페이지</h1>
	<form action="productUpdate" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td rowspan="4">
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
					<input type="hidden" name="code" value="${product.code}">
				</td>
				<th>상품명</th>
				<td>
					<input type="text" name="name" value="${product.name}">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="number" name="price" value="${product.price}">원
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="pictureurl"><br>
					(주의사항 : 이미지를 변경하고자 할때만 선택하세요.)
					<input type="hidden" name="originPic" value="${product.pictureurl}">
				</td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td>
					<textarea rows="10" cols="90" name="description">${product.description}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="submit">변경</button>
					<button type="reset">다시 작성</button>
					<button type="button" onclick="location.href='productList'">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>