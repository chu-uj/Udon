<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 마이페이지</title>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
  <link href='/udon/resources/css/basic.css' rel='stylesheet'>
  <style type="text/css">
    .pageTitle{
  		font-family: 'Jua', sans-serif;
  		
  	}
  	table.table.table-hover{
  		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: bold;
  	}
  	.userRow{
  		height: 30px;
  		width: 30px;
  	}
  	.myPageIcon{
  		width: 50px;
  		height: 50px;
  	}
  	#content{
  		margin-right: 20%;
  		width: 60%;
  	}
  	img.mr-3.mt-3.rounded-circle{
  		width: 70px;
  		height: 70px;
  	}
  </style>
</head>
<body>
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="container"  style="padding:50px 0; height: 750px;">
		<h2 class="ft_title center" style="margin-bottom: 20px;"><br>${user_id}님의 마이페이지</h2>
		<br><br>
		<ul class="nav nav-tabs" id="myTab" role="tablist" style="display: block; text-align: center;">
		  <li role="presentation" style="display: inline-block;">
		    <a class="nav-link" id="myData" data-bs-toggle="tab" data-toggle="tooltip" title="내 정보" href="myInfo?user_id=${user_id}" role="tab" aria-controls="myData" ><img class="myPageIcon" src="/udon/resources/images/myData.png" /></a>
		  </li>
		  <li role="presentation" style="display: inline-block;">
		    <a class="nav-link" id="productList" data-bs-toggle="tab" data-toggle="tooltip" title="내 판매 목록" href="userProductInfo?user_id=${user_id}" role="tab" aria-controls="home"><img class="myPageIcon" src="/udon/resources/images/productList.png"></a>
		  </li>
		  <li role="presentation" style="display: inline-block;">
		    <a class="nav-link" id="boardList" data-bs-toggle="tab" data-toggle="tooltip" title="내 게시물 목록" href="userBoardInfo?user_id=${user_id}" role="tab" aria-controls="profile"><img class="myPageIcon" src="/udon/resources/images/boardList.png"></a>
		  </li>
		</ul>
		<br>
		<div id="Content"></div>
	</div>
<script type="text/javascript" src="/udon/resources/js/myPage.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
<br>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>