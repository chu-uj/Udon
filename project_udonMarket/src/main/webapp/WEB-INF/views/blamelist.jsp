<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 신고하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com"> <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gaegu:wght@300&family=Jua&family=Noto+Sans+KR&family=Sunflower:wght@500&display=swap" rel="stylesheet">
  <style type="text/css">
  	.pageTitle{
  		font-family: 'Jua', sans-serif;
  	}
  </style>
</head>
<body>
<jsp:include page="./top.jsp"></jsp:include>
<div class="container">
<h2 class="pageTitle">신고 리스트</h2>
<hr>
<br><br>
<table class="table">
	<tr class="thead-light">
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
<c:forEach var="p" begin="1" end="${totalPage }">
	 <a href="blamelist?page=${p}">${p }</a>
</c:forEach>
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
</div>
</body>
</html>