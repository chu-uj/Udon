<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
  <style type="text/css">
     #pwdCheck{
      font-size: 9px;
      color: red;
      font-family: font-family: 'Do Hyeon', sans-serif;
     }
     .pageTitle{
        font-family: 'Jua', sans-serif;
        padding-left: 69px;
       padding-top: 34px;
       font-size: 2.5vw;
     }
     .was-validated{
        width: 60%;
        margin-left: 25%;
     }
     .titleImg{
      width: 50px;
      height: 50px;
      float: left;
      margin-top: 12px;
   }
   .title{
      margin-right: 60%;
   }
   #fileInput{
      position:absolute;
       width:0;
       height:0;
       overflow:hidden;
   }
   .fileLable{
      background-color:#FE9A2E;
      color: white;
      border-radius: 2px;
      padding: 3px;
      font-size: 15px;
   }
   
  </style>
<title>우동 | 마이페이지</title>
</head>
<body>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--spring tag 사용  -->
<jsp:include page="./top.jsp"></jsp:include>
<div class="container">
	<div class="title"><img class="titleImg" src="/udon/resources/images/settting2.png"><div class="pageTitle">내 정보 수정하기</div></div>
  	<hr><br>
  <form:form action="userDataUpdate" class="was-validated" method="post" enctype="multipart/form-data" modelAttribute="uploadFile">
    <div class="form-group">
      <input type="hidden" name="user_id" value="${user_id}">
       <input type="hidden" id="beforePassword" name="beforePassword" value="${password}">
      <label for="user_name">유저명:</label>
      <input type="text" class="form-control" id="user_name" placeholder="Enter username" name="user_name" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">변경할 유저명을 입력해주세요</div>
    </div>
    <div class="form-group">
      <label for="password">이전 비밀번호:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
      <div id="pwdCheck">비밀번호가 일치하지 않습니다.</div>
      <div class="invalid-feedback">변경 전 비밀번호를 입력해주세요</div>
    </div>
    <div class="form-group">
      <label for="afterPassword">변경할 비밀번호:</label>
      <input type="password" class="form-control" id="afterPassword" placeholder="Enter password" name="afterPassword" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">변경할 비밀번호를 입력해주세요</div>
    </div>
    <div class="form-group">
      <label for="user_addr">유저 주소:</label>
      <input type="text" class="form-control" id="user_addr" placeholder="Enter address" name="user_addr" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">변경할 주소지를 입력해주세요</div>
    </div>
    <div class="form-group">
      <label class="fileLable" for="fileInput">프로필 사진 업로드</label>
      <input id="fileInput" class="form-control-file border" type="file" name="file" size="200" onchange="javascript:document.getElementById('filename').value=this.value"/>
      <input id="filename" type="text" style="width: 300px;" />
      <form:errors path="file" cssStyle="color:red" />
   </div>
    <button type="submit" class="btn btn-primary">수정</button>
	</form:form>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#pwdCheck").hide();
	$("#password").keyup(function() {
		var pwd1 = $("#beforePassword").val();
		var pwd2 = $("#password").val();
		if(pwd1!=pwd2){
			$("#pwdCheck").show();
		}else{
			$("#pwdCheck").hide();
		}
	})
})
</script>
<br>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>