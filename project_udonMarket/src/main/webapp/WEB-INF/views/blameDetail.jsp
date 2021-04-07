<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 신고하기</title>
</head>
<body>
<jsp:include page="./top.jsp"></jsp:include>
**신고 세부 내용
<a href="blameUpdate?blame_id=${data.blame_id }&page=${page}">수정</a><a href="blameDelete?blame_id=${data.blame_id }&page=${page}">삭제</a><a href="blameReply">답글달기</a>
<table border="1">
	<tr>
		<td >신고번호:${data.blame_id }</td><td>상품번호:${data.product_id }</td><td>사용자ID:${data.user_id }</td>
	</tr>
	<tr>
		<td>신고내용</td><td colspan="2">${data.declaration_detail }</td>
	</tr>
	<tr>
		<td>신고사유</td><td colspan="2">${data.declaration_reason }</td>
	</tr>
</table>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>