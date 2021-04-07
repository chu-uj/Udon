<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 로그인</title>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
	<!-- bootstrap -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Nanum+Gothic:wght@400;700;800&display=swap');
	h2, .loginWrqp{
		font-family: 'Quicksand', sans-serif;
	}
	.loginBox{
		padding-top:30px;
		width:400px;
		height:600px;
		margin:auto;
		background:#ffffff;
		border-radius:15px;
		border: 3px solid #95c4de;
	}
	
	.loginBox h2{
		display:block;
		text-align:center;
		padding:20px;
		color: #000000;
	}
	
	.loginBox input, .loginBox button{
		position:relative;
		display:inline-block;
		margin:auto;
		text-align:center;
	}
	
	.loginId, .loginPw{
	width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    text-align : center;
    margin-bottom: 50px;
    margin-left: 46px;
    margin-bottom: 30px;
    font-family: 'Ubuntu', sans-serif;
    box-shadow: 0px 0px 5px #c0c0c0;
	}
	
	.loginBox input::before{
		position:absolute;
		content:'';
		height:10px;
		width:1px;
		background:#000;
		left:0;bottom:0;
	}
	
	.loginBox input::after{
		position:absolute;
		content:'';
		height:10px;
		width:1px;
		background:#000;
		right:0;bottom:0;
	}
	.btnLogin{
		background-color: #95c4de;
		border-radius: 20px;
		width: 200px;
		height: 40px;
		color: #000000;
		outline: none;
		border: none;
		
	}
	.btnLogin:hover{
		color: white;
	}
	.imgLogin, .imgLock{
		width:30px;
		height: 30px;
		align-content: center;
		display: inline-block;
	}
	input::placeholder {
 	 	color:#787878;
  		font-style: sans-serif;
  		text-align: center;
	}
	.idWrap, .passWrap, .checkWrqp, .loginWrqp, .insertWrap{
		display: block;
		margin: auto;
		text-align: center;
	}
	.text{
		color: #787878;
	}
	.userInsert{
		color:#787878;
	}
	#msg{
		color: red;
	}
</style>
<script type="text/javascript">
	window.onload = function() {
		let btnIns = document.getElementById("btnLogin");
		btnIns.addEventListener("click", loginData);
	}

		// 쿠키는 클라이언트가 요청하면 서버에서 쿠키값을 생성해서 header에 넣어서 전달한다. 그래서 보안에는 취약, 그래서 request에서 문제가 발생할 수도
		//쿠키에는 setCookie, getCookie, deleteCookie(시간지나면 삭제) 이 세가지가 필요. 우리는 그냥 기본 7일 저장으로 해놓음. 
	window.onload = function() {

		if (getCookie("user_id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
			document.login_frm.user_id.value = getCookie("user_id"); //input 이름이 user_id인곳에 getCookie("id")값을 넣어줌
			document.login_frm.id_save.checked = true; // 체크는 체크됨으로
		}

	}

	function setCookie(name, value, expiredays) //쿠키 저장함수()
	{
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";"
	}

	function getCookie(Name) { // 쿠키 불러오는 함수
		var search = Name + "=";
		if (document.cookie.length > 0) {
			offset = document.cookie.indexOf(search);
			if (offset != -1) {//쿠키가있으면
				offset += search.length; 
				end = document.cookie.indexOf(";", offset); 
				if (end == -1)
					end = document.cookie.length;
				return unescape(document.cookie.substring(offset, end));
			}
		}
	}

	//아이디 비밀번호 관련 alert창
	function sendit() {
		var frm = document.login_frm;
		if (!frm.user_id.value) { //아이디를 입력하지 않으면.
			alert("아이디를 입력 해주세요!");
			frm.user_id.focus();
			return;
		}
		if (!frm.password.value) { //패스워드를 입력하지 않으면.
			alert("패스워드를 입력 해주세요!");
			frm.password.focus();
			return;
		}
		
		

		if (document.login_frm.id_save.checked == true) { // 아이디 저장을 체크 하였을때
			setCookie("user_id", document.login_frm.user_id.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
		} else { // 아이디 저장을 체크 하지 않았을때
			setCookie("user_id", document.login_frm.user_id.value, 0); //날짜를 0으로 저장하여 쿠키삭제
		}

		document.login_frm.submit(); //유효성 검사가 통과되면 서버로 전송.

		}
	/* 마이페이지 클릭 시 로그인 안 되어있으면 알림창 띄우기  */
	$(document).ready(function() {
		var value = $("#loginCheck").text();
		if(value=="1"){
			alert("로그인 먼저 부탁드립니다.");
		}
	})


</script>
</head>
<body>
	<!-- 아이디와 비밀번호가 일치하지 않으면 -->
	<% String msg = (String)session.getAttribute("msg"); 
		if(msg != null){%>
			<script type="text/javascript">
				alert("<%=msg%>");
			</script>
			<%session.setAttribute("msg",null);
		}%>
	<!-- page -->
	<jsp:include page="./top.jsp"></jsp:include>
	<br><br><br><br><br>
	<!-- 마이페이지 클릭 시 로그인되어 있는지 체크 -->
	<div id="loginCheck" style="display: none;"><%=request.getAttribute("user_id") %></div>
	<div class="container">
		<div class="loginBox">
			<h2 class="ft_title center">로그인</h2>
			<form name="login_frm" action="login" method="post">
				<div class="idWrap">
					<input type="text" name="user_id" placeholder="아이디" class="loginId"></input>
				</div>
				<br>
				<p></p>
				<div class="passWrap">
					<input type="password" name="password" placeholder="비밀번호" class="loginPw"></input>
				</div>
				<br>
				<div class="checkWrqp">
					<input type="checkbox" name="id_save" id="id_save" value="T" />&nbsp;<span
						class="text">아이디저장</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
						class="userInsert" href="userInsert">회원가입</a>
				</div>
				<br>
				<br>
				<br>
				<div class="loginWrqp" >
					<input height="60" type="submit"  class="btnLogin" value="로그인" id="btnLogin" onclick="sendit()">
				<p>
				<br>
				<br>
				카카오 아이디로 로그인
				<br>
				<div id="kakao-login-btn" style="text-align: center">
				 <a href="https://kauth.kakao.com/oauth/authorize?client_id=48774eb3f2a00392a94dd9d1f6bb3068&redirect_uri=http://localhost:8088/udon/kakaologin&response_type=code"> 
				<img style="border-radius:30px" src="/udon/resources/images/kakao.png" /></a> 
				</div>
				</p>
			</div>
			</form>
			<div class="insertWrap"></div>
		</div>
	</div>
	<br><br><br><br><br>
	<br><br><br><br><br>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>