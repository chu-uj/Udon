<%@page import="pack.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>우동 | 동네생활</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	window.onload=function(){
		document.getElementById("btnReply").onclick = chk;
	}
	function chk(){
		if(reFrm.board_title.value === ""){
			alert("제목을 입력하세요");
			reFrm.board_title.focus();
		}
		// 입력자료 오류 검사
		reFrm.submit();
	}
	</script>
<% UserDto user = (UserDto) session.getAttribute("userDto"); //session처리  %> 
</head>
<body>
<% String user_id = (String)session.getAttribute("user_id"); %>
<jsp:include page="./top.jsp"></jsp:include>
<div class="container" style="padding:50px 0; height: 830px;">
<h2  class="ft_title center" style="margin-bottom : 50px;">댓글 작성</h2>
<form action="boardReply" method="post" name="reFrm">
	<input type="hidden" name="board_no" value="${data.board_no}">
	<input type="hidden" name="user_id" value="${data.user_id}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="group_number" value="${data.group_number}">
	<input type="hidden" name="order_number" value="${data.order_number}">
	<input type="hidden" name="indent" value="${data.indent}">
	<%-- <input type="hidden" name="bip" value="<%=request.getRemoteAddr()%>"> --%>
	
	<table class="table table-bordered">
	  <tr>
	  	<td>작성자</td>
	  	<td><%= user_id%></td>
	  </tr>
	  <tr>
	  	<td>제목</td>
	  	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	  	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	  	<c:set var="board_title" value="${data.board_title}"/>
	  	<td><input class="form-control" type="text" name="board_title" value="[Re]:${fn:substring(board_title,0,8)}"></td>
	  </tr>
	  <tr>
	  	<td>내용</td>
	  	<td>
	  		<textarea class="form-control" rows="15" style="width:99%" name="board_content"></textarea>
	  	</td>
	  </tr>
	  <tr>
	  	<td colspan="2" style="text-align: center;">
	  		<input type="button" value="작성" id="btnReply" class="btn btn-info">
	  		<input type="button" value="목록" onclick="location.href='boardList?page=${page}'" class="btn btn-info">
	  	</td>
	  </tr>
	</table>
</form>
</div>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>