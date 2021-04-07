<%@page import="pack.user.model.UserDto"%>
<%@page import="org.springframework.http.HttpStatus"%>
<%@page import="org.springframework.web.client.HttpClientErrorException"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 우리동네상품</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- 댓글 -->
	<script>
    $(document).ready(function(){
        listReply(); 
        // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
        $("#btnReply").click(function(){
            var reply_content=$("#reply_content").val();
            var product_id="${data.product_id}"
            var param="reply_content="+reply_content+"&product_id="+product_id;
            $.ajax({                
                type: "post",
                url: "productReplyInsert",
                data: param,
                success: function(){
                	document.getElementById("reply_content").value='';
                	$("#reply_content").value = "";
                    alert("댓글이 등록되었습니다.");
                    listReply();
                }
            });
        });
        function listReply(){
            $.ajax({
                type: "get",
                url: "productReplyList?product_id=${data.product_id}",
                success: function(result){
                    console.log(result);
                    var output = "<table class='table table-striped'>";
                    for(var i in result){
                        output += "<tr>";
                        output += "<td style='font-size:17px; font-weight: bold;' colspan='2';>";
                        output += result[i].reply_content;
                        output += "</td>";
                        output += "</tr>";
                        
                        output += "<tr>";
                        output += "<td style='font-size:13px;'>";
                        output += result[i].user_id;
                        output += "&nbsp;&nbsp;("+result[i].reply_date+")";
                        output += "</td>";
                        output += "<td><a href='productReplyDelete?reply_no="+result[i].reply_no+"&product_id=${data.product_id}&page=${page}'>&nbsp;&nbsp;[삭제]</a></td>";
                        output += "</tr>";
                    }
                    output += "</table>";
                    $("#listReply").html(output);
                }
            });
        }
    });
    </script> 
	<!-- font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!-- resource -->
	<script src='/udon/resources/js/main.js'></script>
	<link href='/udon/resources/css/basic.css' rel='stylesheet'>
	<% UserDto user = (UserDto) session.getAttribute("userDto"); //session처리  
	if(session.getAttribute("userDto") != null)
	//out.print("<a href='logout'>로그아웃</a>"); //logout을 하면 session 죽이고 index.jsp으로 갈것이다.%> 
	<style>
		.fLarge{
			font-size: 20px;
			font-weight: bold;
		}
		.fSmall{
			font-size: 13px;
			color: #8e979d;
		}
		.fMiddle{
			font-size: 15px;
		}
		.chatBtn{
		    display: block;
		    background-color: #7099e0;
		    box-shadow: 5px 5px 16px 0 rgb(0 0 0 / 30%);
		    color: #ffffff;
		    margin: 0 1px 10px 0;
		    padding: 16px 30px 17px;
		    font-weight: 500;
		    font-size: 25px;
		    letter-spacing: 3px;
		    text-align: center;
    	}
    	.wishBtn{
    	    display: inline-block;
		    width: 99.5%;
		    font-weight: 400;
		    margin: 4px 0 0 0;
		    background: #ffffff;
		    color: #222222;
		    border: 1px solid #ccc;
		    padding: 12px 20px;
		    font-size: 15px;
		    letter-spacing: -0.03em;
		    text-align: center;
		    font-weight: bold;
    	}
    	.replyBtn{
    	    display: inline-block;
		    width: 20%;
		    font-weight: 400;
		    float:right;
		    margin: 4px 0 0 0;
		    background: #ffffff;
		    color: #222222;
		    border: 1px solid #ccc;
		    padding: 12px 20px;
		    font-size: 15px;
		    letter-spacing: -0.03em;
		    text-align: center;
		    font-weight: bold;
    	}
	</style>
</head>
<body>
<% String user_id = (String)session.getAttribute("user_id"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${msg != null}">
	<script type="text/javascript">
	</script>
</c:if>
<jsp:include page="./top.jsp"></jsp:include>
<br><br><br>
<div class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 fSmall">
			<span style="float:left;">
				<!-- list -->
		  		<a href="productList?page=${page}">
		  			<img style="width: 30px; height: 30px;" src="./resources/images/list.png" />
		  		</a>
		  		<span class="fMiddle">
					<c:set var="state" value="${data.product_status}"/>
					<c:choose>
						<c:when test="${state eq '0'}">[판매중]</c:when>
						<c:when test="${state eq '1'}"><span style="color: #00b48c;">[예약중]</span></c:when>
						<c:when test="${state eq '2'}"><span style="color: #f7bb1f;">[거래완료]</span></c:when>
					</c:choose>
				</span>
	  		</span>
			<span style="float:right;">
	  		<!-- edit -->
	  		<%if(user_id != null){ %> <!-- 로그인되어있으면 수정,삭제 가능 -->
		  		<a href="productUpdate?product_id=${data.product_id}&page=${page}">
		  			<img style="width: 30px; height: 30px"  src="./resources/images/modify.png" />
		  		</a>
		  		&nbsp;
		  		<!-- delete -->
		  		<a href="productDelete?product_id=${data.product_id}&page=${page}">
		  			<img style="width: 30px; height: 30px"  src="./resources/images/delete.png" />
		  		</a>
			<%} %>
			</span>
		</div>
		<div class="col-sm-1"></div>
	</div><br>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-5" style="display: inline-block; margin: auto; text-align: center;">
			<img src="/udon/resources/upload/${data.product_image}" alt="사진" style="width: 400px; height: 400px; border-radius: 10px;">
		</div>
		<!-- 책이름 -->
		<div class="col-sm-5">
			<h2 style="font-weight: bold;">${data.product_title}</h2>
			<div class="fSmall">
				<c:set var="cate" value="${data.category_id}"/>
				<c:choose>
					<c:when test="${cate eq '1'}">디지털/가전</c:when>
					<c:when test="${cate eq '2'}">가구/인테리어</c:when>
					<c:when test="${cate eq '3'}">아동/유아도서</c:when>
					<c:when test="${cate eq '4'}">생활/가공식품</c:when>
					<c:when test="${cate eq '5'}">스포츠/레저</c:when>
					<c:when test="${cate eq '6'}">여성잡화</c:when>
					<c:when test="${cate eq '7'}">여성의류</c:when>
					<c:when test="${cate eq '8'}">남성패션</c:when>
					<c:when test="${cate eq '9'}">게임/취미</c:when>
					<c:when test="${cate eq '10'}">뷰티/미용</c:when>
					<c:when test="${cate eq '11'}">반려동물용품</c:when>
					<c:when test="${cate eq '12'}">도서/티켓/음반</c:when>
					<c:when test="${cate eq '13'}">식물</c:when>
					<c:when test="${cate eq '14'}">기타 중고물품</c:when>
				</c:choose>
				&nbsp;·&nbsp;조회수 : ${data.views}
			</div>
			<div class="fSmall">
		  		작성일 : ${data.write_date}
			</div><br>
			<div class="fMiddle">
				작성자&nbsp;:&nbsp;${data.user_id}&nbsp;&nbsp;&nbsp;<img style="width: 40px; height: 40px" src="/udon/resources/images/profile1.png" alt="프로필사진"/>
			</div><br/><br/>
			<div class="fLarge">\ ${data.product_price}</div>
			<br><br/>
			<div>
		  		<!-- wish -->
			  	<a class="wishBtn" href="wishChange?product_id=${data.product_id}&page=${page}&user_id=<%= user_id%>">
			  		찜하기
			  		<c:choose> 
			  			<c:when test="${existWish eq true}">
			  				<img style="width: 30px; height: 30px" src="./resources/images/heart_color.png" />
			  			</c:when>
						<c:otherwise>
							<img style="width: 30px; height: 30px" src="./resources/images/heart_normal.png" />
						</c:otherwise>  			
			  		</c:choose>
			  	</a><hr>
				<!-- chat -->
		  		<a class="chatBtn" href="chat?product_id=${data.product_id}&seller_id=${data.user_id}&buyer_id=<%= user_id%>">채팅하기<i style="font-size: 23px; padding-top: 4px;" class="fas fa-comments"></i></a>	
				<br>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<br><br><br>
	<!-- 내용 -->
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="fMiddle">
	  			<p style="width: 90%; height: 150px; overflow: auto;">${data.product_content}</p>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<!-- 댓글 작성창 -->
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10"  style="margin: auto; display: inline-block;">
	        <br>
	        <%if(user != null){ %>  <!-- 로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
	        <textarea rows="5" cols="110" id="reply_content" placeholder="댓글을 작성해주세요" class="form-control"></textarea>
	        <a class="replyBtn"  id="btnReply" style="cursor: pointer;">
					댓글 달기<img style="width: 30px; height: 30px;" src="./resources/images/reple.png" />
			 </a>
	        <%} %>
        </div>
        <div class="col-sm-1"></div>
	</div><br><br>
	<!-- 댓글 목록 출력할 위치 -->
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10" id="listReply"></div>
		<div class="col-sm-1"></div>
	</div>
	<div class="row" style="height: 100px; width: 100%"></div>
</div>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>