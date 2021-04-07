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
	<form action="update" method="post">
		<table border="1">
			<tr>
				<td>신고번호:<input type="text" name="blame_id"
					value="${data.blame_id }" /></td>
				<td>상품번호:<input type="text" name="product_id"
					value="${data.product_id }" /></td>
				<td>사용자ID:<input type="text" name="user_id"
					value="${data.user_id }" /></td>
			</tr>
			<tr>
				<td>신고내용</td>
				<td colspan="2"><textarea rows="6" cols="50" style="width: 99%"
						name="declaration_detail"></textarea></td>
			</tr>
			<tr>
				<td>신고사유</td>
				<td colspan="2"><select name="declaration_reason">
						<option value="상품 불량">상품 불량</option>
						<option value="상품 불량">판매자 신고</option>
						<option value="상품 불량">거래 미처리</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>