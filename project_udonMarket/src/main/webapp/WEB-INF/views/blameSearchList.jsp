<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 신고하기</title>
</head>
<body>
<jsp:include page="./top.jsp"></jsp:include>
**검색 리스트<p/>
<table border="1">
	<tr>
		<th>신고번호</th><th>상품번호</th><th>사용자아이디</th><th>신고내용</th><th>신고이유</th><th>등록날짜</th>
		<c:forEach var="i" items="${list }">
			<tr>
				<td>${i.blame_id }</td>
				<td>${i.product_id }</td>
				<td>${i.user_id }</td>
				<td><a href="blameDetail?blame_id=${i.blame_id }&page=${page}">${i.declaration_detail }</a></td>
				<td>${i.declaration_reason }</td>
				<td>${i.blame_date }</td>
			</tr>
		</c:forEach>
	</tr>
</table>
<form action="blameSearch" method="post">
	<input type="hidden" name="page" value="${page}">
	<select name="searchName">
		<option value="declaration_detail">신고 내용</option>
		<option value="product_id">상품 번호</option>
		<option value="user_id">사용자 ID</option>
	</select>
	<input type="text" name="searchValue" placeholder="검색내용을 입력하세요."/><br>
	<input type="submit" value="검색" />
</form>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>