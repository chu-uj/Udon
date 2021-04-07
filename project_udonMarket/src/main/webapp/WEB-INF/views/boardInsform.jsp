<%@page import="pack.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 동네생활</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	<link rel="stylesheet" type="text/css" href="./resources/css/basic.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			let btnIns = document.getElementById("btnIns");
			btnIns.addEventListener("click",checkData, false);
		}
		function checkData(){
			if(frm.board_title.value === ""){
				alert("제목을 입력하세요");
				frm.board_title.focus();
				return;
			}else if(frm.board_content.value === ""){
				alert("본문내용을 입력하세요");
				frm.board_content.focus();
				return;
			}
			frm.submit();
		}
	</script>
	<style type="text/css">
	.pressDownButton {
	    background-color:#e5edff;padding:12px 24px;color:#5851ec;border-radius:6px;border-bottom:4px solid #b7ccfb;border-top:0 solid #f9fafb;transition:all .1s ease-in-out;
	    outline: 0;
	}
	.pressDownButton:hover{border-bottom-width:0;border-top-width:4px}
	</style>
<% UserDto user = (UserDto) session.getAttribute("userDto"); //session처리  %> 
</head>
<body>
<% String user_id = (String)session.getAttribute("user_id"); %>
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="container" style="padding:50px 0; height: 830px;">
		<h2 class="ft_title center" style="margin-bottom : 50px;"><br>게시물 등록</h2>
		<form action="boardInsert" method="post" name="frm">
		<table class="table table-bordered">
		  <tr>
			 <td>작성자</td>
			 <td><%= user_id%></td>
		  </tr>
		  <tr>
		  	<td>제목</td>
		  	<td><input type="text" name="board_title" class="form-control"></td>
		  </tr>
		  <tr>
		  	<td>내용</td>
		  	<td>
		  		<textarea rows="25" cols="150" name="board_content" style="width: 98%" class="form-control"></textarea>
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan="2" style="text-align: center;">
		  		<input type="button" class="btn btn-primary" value="등록" id="btnIns">
		  		<input type="hidden" name="user_id" value="<%=user_id %>">
		  		<!-- <input type="button" value="등록" onclick="checkData()"> -->
		  		<input type="button" class="btn btn-info" value="목록" onclick="location.href='boardList?page=1'">
		  	</td>
		  </tr>
		</table>
		</form>
	</div>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>