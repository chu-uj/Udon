<%@page import="pack.user.model.UserDto"%>
<%@page import="org.springframework.http.HttpStatus"%>
<%@page import="org.springframework.web.client.HttpClientErrorException"%>
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
<% UserDto user = (UserDto) session.getAttribute("userDto"); //session처리  %> 
</head>
<body>
	<% String user_id = (String)session.getAttribute("user_id"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${msg != null}">
	<script type="text/javascript">
		/*
		(function msg(){
			alert("${msg}");
		})();
		*/
	</script>
</c:if>
<jsp:include page="./top.jsp"></jsp:include>
<div class="container" style="padding:50px 0; height: 750px;">
<table class="table" >
  <tr>
  	<td></td>
  	<td style="text-align: right;">
  		<%if(user != null){ %>
  		<a href="boardReply?board_no=${data.board_no}&page=${page}">
  			<img style="width: 30px; height: 30px" src="./resources/images/reple.png" />
  		</a>
  		<a href="boardUpdate?board_no=${data.board_no}&page=${page}">
  			<img style="width: 30px; height: 30px" src="./resources/images/modify.png" />
  		</a>
  		<a href="boardDelete?board_no=${data.board_no}&page=${page}">
  			<img style="width: 30px; height: 30px" src="./resources/images/delete.png" />
  		</a>
  		<%} %>
  		<a href="boardList?page=${page}">
  			<img style="width: 30px; height: 30px" src="./resources/images/list.png" />
  		</a>
  	</td>
  </tr>
</table>

<table class="table table-bordered">
  <tr>
  	<td colspan="3" style="font-size: 18px;" align="center"><b>${data.board_title}</b></td>
  </tr>
  <tr>
  	<td colspan="2" align="center">
  		<img style="width: 40px; height: 40px" src="/udon/resources/images/profile1.png" alt="사진"/>&emsp;<b>${data.user_id}</b>
  	</td>
  </tr>
  <tr>
  	<td>작성일 : ${data.board_wrt_date}</td>
  	<td>조회수 : ${data.views}</td>
  </tr>
  <tr>
  	<td colspan="3" height="400px">
  			<br>${data.board_content}
  	</td>
  </tr>
</table>
</div>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>