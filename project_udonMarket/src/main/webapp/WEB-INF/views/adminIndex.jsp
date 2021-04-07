<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 관리자페이지</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!--  -->
	<style>
	    #container{
	        text-align: center;
	    }
	</style>
	<!-- modal bootstrap -->
  
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	
	
	<script type="text/javascript">
		
	
		$(document).ready(function(){
			var userId = ""; 
			$("#userbtn").click(function(){
				$("view").empty();
						
				$.ajax({
					type: "get",
					url: "userlist",
					dataType: "json",
					success: function(user){	
						var str = "<table class='table table-dark table-striped'>";
						str += "<tr><th>유저 아이디</th><th>비밀번호</th><th>유저명</th><th>유저 주소</th><th>유저삭제</th></tr>";
						let list = user.datas;
						$(list).each(function(inx, arr){	
							str += "<tr>";
							str += "<td>" + arr["user_id"] + "</td>";	
							userId = arr.user_id;
							str += "<td>" + arr["password"] + "</a></td>";	
							str += "<td>" + arr.user_name + "</td>";
							str += "<td>" + arr.user_addr + "</td>";
							str += "<td><a class='btn btn-danger' href='deleteUser?user_id="+arr.user_id+"'>삭제</a><td>";
							str += "</tr>";
						});
						str += "</table>";
						
						$("#view").html(str);
					},
					error: function(){
						$("#view").text("에러 발생");
					} 
				}); //ajax	
			}); //userbtn
		});//ready
		
	</script>

	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#warnbtn").click(function(){
				$("view").empty();
				$.ajax({
					type: "get",
					url: "warninglist",
					dataType: "json",
					success: function(warn){	
						var str = "<table class='table table-dark table-striped'>";
						str += "<tr><th>유저 아이디</th><th>상품번호</th><th>상품 제목</th><th>상품 상세내용</th><th>상품삭제</th></tr>";
						let list = warn.wdatas;
						$(list).each(function(inx, arr){	
							str += "<tr>";
							str += "<td>" + arr["user_id"] + "</td>";	
							str += "<td>" + arr["product_id"] + "</td>";	
							str += "<td>" + arr.product_title + "</td>";
							str += "<td>" + arr.product_content + "</td>";
							str += "<td><a class='btn btn-danger' href='deleteProduct?product_id="+arr.product_id+"'>삭제</a><td>";
							str += "</tr>";
						});
						str += "</table>";
						
						$("#view").html(str);
					},
					error: function(){
						$("#view").text("에러 발생");
					} 
				}); //ajax	
			}); //warnbtn
			
		});//ready
	</script>
	
	<!-- banSelect -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#banlistbtn").click(function(){
				$("view").empty();
				$.ajax({
					type: "get",
					url: "banlist",
					dataType: "json",
					success: function(ban){	
						
						var str = "<a id='insertban' class='btn btn-danger' href='javascript:abc()'>금지어 키워드 추가</a><br><br>";
						str += "<table class='table table-dark table-striped'>";
						str += "<tr><th>금지어 번호</th><th>금지어 키워드</th><th>금지어 삭제</th></tr>";
						let list = ban.bandatas;
						$(list).each(function(inx, arr){	
							str += "<tr>";
							str += "<td>" + arr["ban_id"] + "</td>";	
							str += "<td>" + arr["ban_word"] + "</td>";	
							str += "<td><a class='btn btn-danger' href='deleteBan?ban_id="+arr.ban_id+"'>삭제</a><td>";
							str += "</tr>";
						});
						str += "</table>";
						
						$("#view").html(str);
					},
					error: function(){
						$("#view").text("에러 발생");
					} 
				}); //ajax	
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			abc = function(){
				$("#view").empty();
				var str = "<form action='banInsert' method='post' class='was-validated'>";
				    str += "<div class='inputText'>추가할 키워드를 입력하세요 </div>";
				    str += "<input type='text' name='ban_word' class='form-control' required><br>";
				    str += "<input class='btn btn-primary' type='submit' value='등록'>"
			        str += "</form>"
				$("#view").html(str);
			};
		});	
			
			
	</script>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#blamebtn").click(function(){
				$("view").empty();
				$.ajax({
					type: "get",
					url: "blameAdminList",
					dataType: "json",
					success: function(warn){	
						var str = "<table class='table table-dark table-striped'>";
						str += "<tr><th>신고번호</th><th>신고당한 상품번호</th><th>신고이유</th><th>신고 상세내용</th><th>신고시간</th><th>신고 삭제</th></tr>";
						let list = warn.bdatas;
						$(list).each(function(inx, arr){	
							str += "<tr>";
							str += "<td>" + arr["blame_id"] + "</td>";	
							str += "<td>" + arr["product_id"] + "</td>";	
							str += "<td>" + arr.blame_reason + "</td>";
							str += "<td>" + arr.blame_detail + "</td>";
							str += "<td>" + arr.blame_date + "</td>";
							str += "<td><a class='btn btn-danger' href='deleteBlame?blame_id="+arr.blame_id+"'>삭제</a><td>"
							str += "</tr>";
						});
						str += "</table>";
						
						$("#view").html(str);
					},
					error: function(){
						$("#view").text("에러 발생");
					} 
				}); //ajax	
			}); //userbtn
		});//ready
	</script>
	
	</script>
	

	
</head>
<body>
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="container">
		<h2>관리자님 환영합니다.<i class="fas fa-coffee"></i></h2>
		<br>
		<div class="list-group">
				<li><button id='userbtn' type="button" class="btn btn-info">전체 회원 보기</button></li>
				<li><button id='warnbtn' type="button" class="btn btn-info">금지어 키워드 상품 목록</button></li>
				<li><button id='blamebtn' type="button" class="btn btn-info">신고내용 확인</button></li>
				<br>
				<button id='banlistbtn' type='button'  class='btn btn-danger'>금지 키워드 확인하기</button>
				<br>
				
				

		</div>
		
			
		<br>
		<br>
		<br>
		<div id="view"></div>
		
		<br>
	</div>
</body>
</html>