<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="pack.user.model.UserDto"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 채팅</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- bootstrap -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- SocketJS CDN -->
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
	
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Nanum+Gothic:wght@400;700;800&display=swap');
		.chatList>a>ul>li {
			display: inline-block;
		}
	</style>
	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
	var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
	s1.async=true;
	s1.src='https://embed.tawk.to/6013efd4c31c9117cb73c961/1et6u1mau';
	s1.charset='UTF-8';
	s1.setAttribute('crossorigin','*');
	s0.parentNode.insertBefore(s1,s0);
	})();
	</script>
	<!--End of Tawk.to Script-->
</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<div class="container" style="padding:50px 0; height: 750px;">
		<h2 class="ft_title center" style="margin-bottom: 50px;"><br>채팅방</h2>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<hr>
				<h4> + 판매 중인 채팅방</h4>
			</div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<c:forEach var="s" items="${sell}">
					<div class="chatList">
						<a href="chatRoomEnter?chat_id=${s.chat_id }" >
						<ul>
							<li><img src="/udon/resources/upload/${s.product_image}" style="width: 50px; height: 70px;"></li>
							<li>${s.buyer_id }</li>
							<li>${s.product_title }</li>
						</ul>
						</a>
						<hr>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-3"></div>
			
		</div>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<hr>
				<h4> + 구매 중인 채팅방</h4>
			</div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<c:forEach var="b" items="${buy}">
					<div class="chatList">
						<a href="chatRoomEnter?chat_id=${b.chat_id }" >
							<ul>
								<li style="width: 70px; height: 70px; margin: auto; text-align: center;"><img src="/udon/resources/upload/${b.product_image}" style="width: auto; height: 70px;"></li>
								<li style="width: 70px; height: 50px; margin: auto; text-align: center;">${b.seller_id }</li>
								<li style="font-size: 20px;">${b.product_title }</li>
							</ul>
						</a>
						<hr>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-3"></div>
		</div>	
	</div>
</body>
<jsp:include page="../bottom.jsp"></jsp:include>
</html>
