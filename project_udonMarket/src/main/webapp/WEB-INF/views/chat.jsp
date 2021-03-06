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
	.chatList>ul>li {
		font-family: 'Noto Sans KR', sans-serif;
	}
	div{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 18px;
	}
	
	</style>
</head>
<body>
	<jsp:include page="./top.jsp"></jsp:include>
	
	<c:set var="profile" value='<%=(UserDto)session.getAttribute("userDto")%>' />

	<div class="container" style="padding:50px 0; height: 800px;">
		<h2 class="ft_title center" style="margin-bottom: 50px;"><br>채팅방</h2>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="col-2" style="float: left">
					<span><a href="chatRoom?user_id=${sessionScope.userDto.user_id}"><img style="width: 30px; height: 30px;" src="./resources/images/list.png" /></a></span>
				</div>
				<div class="col-8" style="text-align: center;">
					<c:choose>
						<c:when test="${data.seller_id eq profile.user_id}">
							${data.buyer_id}
						</c:when>
						<c:otherwise>
							${data.seller_id}
						</c:otherwise>
					
					</c:choose>님과 대화
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
		
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="col-10"	style="margin: 20px auto; text-align: center; color: white; background-color: #7099e0; border: 1px solid #7099e0; padding: 10px 10px; border-radius: 8px;">
					채팅창 <br>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
		
		<!-- 채팅 내용 -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="col-11"	style="margin: 0 auto; border: 1px solid #7099e0; height: 400px; border-radius: 10px; overflow: scroll"	id="chatArea">
					<div id="chatMessageArea" style="margin-top: 10px; margin-left: 10px;"></div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
		
		<!-- 채팅 입력창 -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<textarea class="form-control" style="border: 1px solid #7099e0; height: 65px; float: left; width: 80%"	placeholder="Enter ..." id="message"></textarea>
				<a style="margin-top: 30px; text-align: center; color: white; font-weight: bold;" id="sendBtn">
					<span style="float: right; width: 18%; height: 65px; text-align: center; background-color: #7099e0; border-radius: 5px;">
						<br>전송
					</span>
				</a>
			</div>
			<div class="col-sm-3"></div>
		</div>
	
		<img id="profileImg" class="img-fluid"
			src="/displayFile?fileName=${userImage}&directory=profile"
			style="display: none">
		<input type="text" id="nickname" value="${user_id}"
			style="display: none">
		<input type="button" id="enterBtn" value="입장" style="display: none">
		<input type="button" id="exitBtn" value="나가기" style="display: none">
	</div>
	<script type="text/javascript">
		connect();
		function connect() {
			sock = new SockJS("<c:url value="/chat"/>");
			sock.onopen = function() {
				console.log('open');
			};
			sock.onmessage = function(evt) {
				var data = evt.data;
				console.log(data);
				var obj = JSON.parse(data);
				
				//if(obj.buyer_id === ${data.seller_id })
				//cosole.log(${data.seller_id });
				//console.log(obj);
				//console.log(obj.user_id);
				appendMessage(obj.message_content, obj.msg_sender);
			};
			sock.onclose = function() {
				appendMessage("연결을 끊었습니다.");
				console.log('close');
			};
		}

		function send() {
			var msg = $("#message").val();
			if (msg != "") {
				message = {};
				message.message_content = $("#message").val()
				message.buyer_id = '${data.buyer_id}'
				message.seller_id = '${data.seller_id}'
				message.product_id = '${data.product_id}'
				message.chat_id = '${data.chat_id}'
				message.msg_sender = '${sessionScope.userDto.user_id }'
			}

			sock.send(JSON.stringify(message));
			$("#message").val("");
		}

		function getTimeStamp() {
			var d = new Date();
			var s = leadingZeros(d.getFullYear(), 4) + '-'
					+ leadingZeros(d.getMonth() + 1, 2) + '-'
					+ leadingZeros(d.getDate(), 2) + ' ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2) + ':'
					+ leadingZeros(d.getSeconds(), 2);

			return s;
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();

			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
			}
			return zero + n;
		}
		function appendMessage(msg, msg_sender) {

			if (msg == '') {
				return false;
			} else {

				var t = getTimeStamp();
				//$("#chatMessageArea").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/displayFile?fileName=${userImage}&directory=profile' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${user_name}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")		 

				$("#chatMessageArea")
						.append(
								
								"<div class='col-12 row' style = 'height : auto; margin-top : 5px;'>"
								+"<div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'>"
								+ "<img src='/udon/resources/images/profile1.png' id='profileImg' class='img-fluid' style = 'width:50px; height:50px; '>"
								+"<div style='font-size:9px; clear:both;'>"+msg_sender+"</div>"
								+"</div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#95c4de; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"
										+ msg
										+ "</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'>"
										+"<span style ='float:right; font-size:9px; text-align:right;' >"
										+ t + "</span></div></div></div>")

				var chatAreaHeight = $("#chatArea").height();
				var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
				$("#chatArea").scrollTop(maxScroll);

			}
		}
		$(document).ready(function() {
			$('#message').keypress(function(event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					send();
				}
				event.stopPropagation();
			});

			$('#sendBtn').click(function() {
				send();
			});/* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
		});
	</script>
</body>
<jsp:include page="./bottom.jsp"></jsp:include>
</html>