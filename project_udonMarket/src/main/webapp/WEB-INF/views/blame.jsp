<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 신고하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
  <link href='/udon/resources/css/basic.css' rel='stylesheet'>
	<style type="text/css">
    .was-validated{
		width: 50%;
		margin-left: 25%;
		font-weight: bold;
	}
	.pageTitle{
		font-family: 'Jua', sans-serif;
		font-size: 30px;
		text-align: left;
		
	}
	.inputText{
		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
		
	}
	.optionText{
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: bold;
	}
	.custom-select{
		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: bold;
	}
	.btn-primary{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15px;
		font-weight: bold;
	}
	.titleImg{
		width: 50px;
		height: 50px;
		float: left;
		margin-top: 12px;
	}
	.title{
		margin-right: 80%;
		text-align: center;
	}
	.warning{
	    padding-left: 69px;
	    padding-top: 34px;
	    font-family: 'Jua', sans-serif;
		font-size: 30px;
	} 
</style>

</head>
<body>
<jsp:include page="./top.jsp" />
<div class="container" style="padding:50px 0; height: 750px;">
	<div style="text-align: center;">
		<span style="display:inline-block;">
		<img style="display: inline-block;margin-top:0; vertical-align:top;" class="titleImg" src="/udon/resources/images/warning.png"></span>
		<h2 class="ft_title center" style="text-align:center; padding-top:12px; display: inline-block; vertical-align: bottom;">신고하기</h2>
	</div>
	<!-- <h2 class="ft_title center"><img class="titleImg" src="/udon/resources/images/warning.png">신고하기</h2> -->
	<hr>
	<br><br>
	<form action="blame" method="post" class="was-validated">
		<div class="inputText">상품번호:</div><input type="text" name="product_id" class="form-control" required><br>
		<div class="inputText">사용자이름:</div><input type="text" name="user_id" class="form-control" required><br>
		<div class="inputText">신고 내용:</div><textarea rows="3" cols="" name="declaration_detail" class="form-control" required></textarea><br>
		<div class="inputText">신고이유를 선택해주세요.</div>
	<select name="declaration_reason" class="custom-select" required>
		<option class="optionText" value="상품 불량">상품 불량</option>
		<option class="optionText" value="판매자 신고">판매자 신고</option>
		<option class="optionText" value="거래 미처리">거래 미처리</option>
	</select>
	<br>
	<br>
	<br>
	<input class="btn btn-primary" type="submit" value="등록">
	</form>
</div>
	<br>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>