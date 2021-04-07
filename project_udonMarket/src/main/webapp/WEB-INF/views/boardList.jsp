<%@page import="pack.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 동네생활</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style type="text/css">
	th {background:#f2f8fb;font-size: 15px;}
	th{
		color: #308fb4;
		text-align: right;
		background:#f2f8fb;font-size: 15px;
	}
	</style>
<% UserDto user = (UserDto) session.getAttribute("userDto"); //session처리  %> 
</head>
<body>
	<% String user_id = (String)session.getAttribute("user_id"); %>
<jsp:include page="./top.jsp"></jsp:include>
<div class="container" style="padding:50px 0; height: 750px;">
	<h2 class="ft_title center"><br>동네생활&emsp;<img style="width: 28px; height: 38px" src="./resources/images/locationlogo.png" alt="사진" /> 사당동</h2><br><br>
	<table  class="table">
	  <tr>
	  	<th>
	  		<%if(user != null){ //로그인되어있으면 글쓰기 버튼 show %>
	  		<a href="boardInsert">글쓰기<img style="width: 30px; height: 30px" src="./resources/images/write.png" /></a>
	  		<%} %>
	  		<a href="#" style="color: #f2f8fb">.</a>
	  	</th>
	  </tr>
	</table>
	<table class="table table-hover" style="text-align: center;">
	  <thead>
	  <tr>
	  	<td style="text-align: center; width: 10%;">번호</td>
	  	<td style="text-align: center;">제  목</td>
	  	<td style="text-align: center;">작성자</td>
	  	<td style="text-align: center; width: 20%;">작성일</td>
	  	<td style="text-align: center; width: 10%;">조회수</td>
	  </tr>
	  </thead>
	  <c:forEach var="b" items="${data}">
	  	<!-- 덧글 들여쓰기 준비-->
	  	<c:set var="tab" value=""/>
	  	<c:forEach var="n" begin="1" end="${b.indent}">
	  		<c:set var="tab" value="${tab}&nbsp;&nbsp;&nbsp;&nbsp;"/> <!-- tab누적 -->
	  	</c:forEach>
	  <tr>
	  	<td>${b.board_no}</td>
	  	<td style="text-align: left;">
	  		${tab}<a href="boardDetail?board_no=${b.board_no}&page=${page}">${b.board_title}</a>
	  	</td>
	  	<td>${b.user_id}</td>
	  	<td>${b.board_wrt_date}</td>
	  	<td>${b.views}</td>
	  </tr>	
	  </c:forEach>
	  <!-- paging -->
	  <tr style="text-align: center;">
	  	<td colspan="5">
	  	<c:forEach var="psu" begin="1" end="${pageCount}">
	  		<c:if test="${psu==page}">
	  			<b>${psu}</b>
	  		</c:if>
	  		<c:if test="${psu!=page}">
	  			<a href="boardList?page=${psu}">${psu}</a>
	  		</c:if>
	  	</c:forEach>
	  	</td>
	  	
	  </tr>
	</table>
	<!-- search -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="input-group" style="margin: auto; display: inline-block;">
				<form action="boardSearch" method="post">
					<!-- <div style="display: inline-block;"> -->
					<select class="form-control" id="sel1" name="searchName" style="width: 100px;">
						<option value="board_title" selected="selected">글제목</option>
						<option value="user_id">작성자</option> 
					</select>
					
					<input type="text" class="form-control" placeholder="Search" name="searchValue" style="width: 400px;">
					  	
					<button class="btn btn-default" type="submit" style="float: left;"><i class="glyphicon glyphicon-search"></i></button>
				</form>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
</div>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>






