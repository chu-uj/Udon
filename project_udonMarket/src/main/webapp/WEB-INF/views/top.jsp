<%@page import="pack.user.controller.UserBean"%>
<%@page import="pack.admin.model.AdminDto"%>
<%@page import="pack.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 우리동네</title>
	<!-- font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!-- bootstrap -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- resource -->
	<script src='/udon/resources/js/main.js'></script>
   <script type="text/javascript">
   $(document).ready(function(){
       var topBar = $("#topBar").offset();
       $(window).scroll(function(){
           var docScrollY = $(document).scrollTop();
           var barThis = $("#topBar");
           if( docScrollY > topBar.top ) {
               barThis.addClass("top_bar_fix");
           }else{
               barThis.removeClass("top_bar_fix");
           }
       });
   })
   </script>
   <style type="text/css">
   .top_bar_fix{position:fixed; top:0; left:0; width:100%;}
   </style>
	<link href='/udon/resources/css/basic.css' rel='stylesheet'>
	<% UserDto user = (UserDto) session.getAttribute("userDto"); //udon에서 session가져오기 (로그인) 
	if(session.getAttribute("userDto") != null)%> 
	
	<% UserBean bean = (UserBean)session.getAttribute("userBean"); //카카오로그인에서 session 가져오기(로그인)
	if(session.getAttribute("userBean")!=null) %>
	

	<% AdminDto admin =(AdminDto)session.getAttribute("adminDto");
	if(session.getAttribute("adminDto") != null)
		out.print("<a href='logout'>로그아웃</a>");
	%>
	<script type="text/javascript">
	 	function showGongji() { 
	 		window.open("popup.jsp", "gongji", "width=400, height=300, left=100, top=50"); 
	 	}
	 	function qna(){
	 		window.open("popQna.jsp", "qna", "width=400, height=300, left=100, top=50"); 
	 	}
	</script>
</head>
<body>
	<% String user_id = (String)session.getAttribute("user_id");//얘는 udon 로그인 %>
	<% String userid = (String)session.getAttribute("userid"); //얘는 카카오 로그인 %>
	<% String admin_id = (String)session.getAttribute("admin_id"); %>
	<div class="headerWrap w100" id="topBar" style="z-index: 9999">
		<header class="header w1280">
			<h1 class="headerLogo ft_title">
				<a href="home">우<span class="sm_title">리</span>동<span class="sm_title">네</span></a>
			</h1>
			<div class="headerMenu">
				<ul>
					<li><a style="cursor: pointer;" onclick="showGongji()">공지사항</a></li>
					<li><a href="boardList?page=1">동네생활</a></li>
					<li><a href="productList?page=1">우리동네 상품</a></li>
					<li><a href="location">내 근처</a></li>
				</ul>
			</div>
			<div class="headerRightWrap">
				<ul class="headerRightUl">

					<li><a style="cursor: pointer;" onclick="qna()">자주하는 질문</a></li>
					<li><a href="blame">신고하기</a></li>
					<%if(user_id == null && bean == null && admin == null){ %> <!-- 유저가 없으면 로그인과 회원가입 창이, 있으면 로그아웃 창이 뜸 -->
					<li><a href="login">로그인</a></li>
					<li><a href="userInsert">회원가입</a></li>
					<%}else if(admin != null){ %>
					<li>관리자님 반갑습니다.</li>
					<li><a href="logout">LOG-OUT</a>
					<%} else if(user !=null){ %>
					<li><%=  user.getUser_id()%>님 반갑습니다.</li>
					<li><a href="logout">로그아웃</a>
					<%} else if(bean!=null){ %>
					<li><%=bean.getUser_name()%>님 반갑습니다.</li>
					<li><a href="logout">LOG-OUT</a>
					<%}%>
					<%if(admin != null){ %>
					<li><a href="admin"><i class="fas fa-user"></i></a></li>
					<%}else{ %>
					<li><a href="userInfo?page=1&user_id=${sessionScope.userDto.user_id }"><i class="fas fa-user"></i></a></li>
					<li><a href="chatRoom?user_id=${sessionScope.userDto.user_id}"><i class="fas fa-comments"></i></a></li>
					<li><a href="wishList?page=1&user_id=${sessionScope.userDto.user_id }"><i class="fas fa-heart"></i></a></li>
					<%} %>
				</ul>
			</div>
		</header>
	</div>
</body>
</html>