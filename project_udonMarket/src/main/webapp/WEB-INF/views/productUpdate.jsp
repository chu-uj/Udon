<%@page import="pack.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 우리동네 상품</title>
<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.onload=function(){
	document.getElementById("btnUp").onclick = chkUpData;
	}
	function chkUpData(){
		if(confirm("저장하시겠습니까?")){
			upFrm.submit();
		}
	}
</script>

<% UserDto user = (UserDto) session.getAttribute("userDto"); //session처리  %> 
</head>
<body>
	<% String user_id = (String)session.getAttribute("user_id"); %>
%>
<jsp:include page="./top.jsp"></jsp:include>
<c:if test="${msg != null}">
	<script type="text/javascript">
		(function msg(){
			alert("${msg}");
		})();
		location.href="productList?page=${page}";
	</script>
</c:if>
<div class="container" style="padding:50px 0; height: 830px;">
<h2 class="ft_title center" style="margin-bottom : 50px;"><br>글 수정</h2>
<form action="productUpdate" method="post" name="upFrm">
	<input type="hidden" name="product_id" value="${data.product_id}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="user_id" value="${data.user_id}">
	<table class="table table-bordered">
	  <tr>
		<td>판매상태</td>
			<td>
			<select name="product_status" class="form-control">
				<option value="0">판매상태를 선택하세요</option>
				<option value="0">판매중</option>
				<option value="1">예약중</option>
				<option value="2">거래완료</option>
			</select>
		</td>
	  </tr>
	  <tr>
	  	<td>제목</td>
	  	<td><input type="text" name="product_title" value="${data.product_title}" class="form-control"></td>
	  </tr>
	  <tr>
		 <td>가격</td>
		 <td><input type="number" name="product_price" value="${data.product_price}" class="form-control"></td>
	  </tr>
	  
	  <tr>
	  	<td>내용</td>
	  	<td>
	  		<textarea rows="20" cols="157" name="product_content" class="form-control">${data.product_content}</textarea>
	  	</td>
	  </tr>
	  <tr>
	  	<td colspan="2" style="text-align: center;">
	  		<input type="button"  class="btn btn-primary" value="수정" id="btnUp">
	  		<input type="button"  class="btn btn-info" value="목록" onclick="location.href='productList?page=${page}'">
	  	</td>
	  </tr>
	</table>
</form>
</div>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>