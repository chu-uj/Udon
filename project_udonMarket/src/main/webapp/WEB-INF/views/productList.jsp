<%@page import="pack.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 우리동네 상품</title>
	<script src='/udon/resources/js/main.js'></script>
	<link href='/udon/resources/css/basic.css' rel='stylesheet'>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		    $("#p_status").change(function(){
		        if($("#p_status").is(":checked")){
		        	$(location).attr('href','productListSort?page=1&order_by=selling');
		        }else{
		        	$(location).attr('href','productList?page=1');
		        } 
		    });
		});
	</script>
	<style type="text/css">
	.borderLeftRight{vertical-align: middle;display:inline-block;position:relative;color:#1b202d; font-weight:bold;}.borderLeftRight:after{content:"";position:absolute;width:100%;transform:scaleX(0);height:2px;bottom:-4px;left:0;background-color:#4397c5;transform-origin:bottom right;transition:transform .4s cubic-bezier(.86,0,.07,1)}.borderLeftRight:hover:after{color:#3482ab; transform:scaleX(1);transform-origin:bottom left}
	 th {background:#f2f8fb;font-size: 15px;}
	 .pushUpBtn {
    padding: 120px 240px;
    background-color: hsl(222, 100%, 95%);
    color: hsl(243, 80%, 62%);
    border-radius: 6px;
    transition: transform 0.25s ease, box-shadow 0.25s ease, background-color 0.25s ease;
    box-shadow: 0 4px 6px rgba(50,50,93,.11), 0 1px 3px rgba(0,0,0,.08);
}

.pushUpBtn:cover {
    transform: translate3d(0px,-1px,0px);
    background-color: hsl(222, 100%, 92%);
    box-shadow: 0 7px 14px rgba(50,50,93,.1), 0 3px 6px rgba(0,0,0,.08);
}
.list:hover{
    color: #3b5998;
    box-shadow: 0 5px 20px 0px rgb(0 0 0 / 20%);
    -moz-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.2);
    -webkit-box-shadow: 0 5px 20px 0px rgb(0 0 0 / 20%);
    -o-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.2);
    -ms-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.2);
 }
	</style>
<% UserDto user = (UserDto) session.getAttribute("userDto"); //session처리  %> 
</head>
<body>
	<% String user_id = (String)session.getAttribute("user_id"); %>
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="container" style="padding:50px 0; height: 1350px;">
		<h2 class="ft_title center"><br>우리동네 상품&emsp;<img style="width: 28px; height: 38px" src="./resources/images/locationlogo.png" alt="사진" /> 사당동</h2>
		<section class="section3 w1280">
			<table  class="table">
			  <tr>
			  	<th>
			  		<%if(user != null){ //로그인되어있으면 글쓰기 버튼 show %>
			  		<a href="productInsert">글쓰기<img style="width: 30px; height: 30px" src="./resources/images/write.png" /></a>
			  		<%} %>
			  	</th>
			  	<th class="text-right">
					<!-- 상품 정렬 -->
			  		<a href="productListSort?page=1&order_by=views desc" class="borderLeftRight">인기순</a>&emsp;&emsp;
			  		<a href="productList?page=1" class="borderLeftRight">최신순</a>&emsp;&emsp;
			  		<a href="productListSort?page=1&order_by=wish_id desc" class="borderLeftRight">좋아요순</a>&emsp;&emsp;
			  		<a href="productListSort?page=1&order_by=product_price desc" class="borderLeftRight">높은가격</a>&emsp;&emsp;
			  		<a href="productListSort?page=1&order_by=product_price asc" class="borderLeftRight">낮은가격</a>&emsp;
			  	</th>
			  </tr>
			  <tr>
			  	<td colspan="2" align="right">
				  	<c:choose>
					    <c:when test="${checked == null}">
					        <input type="checkbox" id="p_status" /> 거래완료 안보기
					    </c:when>
					    <c:otherwise>
					        <input type="checkbox" id="p_status" checked="${checked}" /> 거래완료 안보기
					    </c:otherwise>
					</c:choose>		  	
			  	</td>
			  </tr>
			</table>
			<div class="productNew">
				<ul class="productNewUl">
					<c:forEach var="p" items="${data}">
						<li class="list">
							<a href="productDetail?product_id=${p.product_id}&page=${page}" class="box">
								<div class="productImg">
									<img src="/udon/resources/upload/${p.product_image}" alt="사진" />
								</div>
								<dl>
									<b><dt class="price" style="">${p.product_title}</dt></b>
									<!-- 판매중이면 아무것도 안뜸, 예약중/거래완료는 표시 -->
									<c:if test="${p.product_status == 1}">
										<span style="color: #00b48c;">[예약중]</span>
									</c:if>
									<c:if test="${p.product_status == 2}">
										<span style="color: #f7bb1f;">[거래완료]</span>
									</c:if>
									<dd class="memAddress d_inblock">조회수 ${p.views} 
									<!-- 댓글이 있으면 조회수 옆에 출력하기 -->
									<c:if test="${p.reply_count > 0}">
										<span style="color: #4397c5;">댓글 ${p.reply_count}개</span>
									</c:if>
									</dd>
									<dd class="price">${p.product_price}원</dd>
									<a href="listWishChange?product_id=${p.product_id}&page=${page}&user_id=<%= user_id%>">
										<c:choose> 
							  				<c:when test="${p.wish_id > 0}">
							  					<img style="width: 30px; height: 30px" src="./resources/images/heart_color.png" />
							  				</c:when>
											<c:otherwise>
												<img style="width: 30px; height: 30px" src="./resources/images/heart_normal.png" />
											</c:otherwise>  			
							  			</c:choose>
						  			</a>
								</dl>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>
		<!-- paging -->
		<ul class="pager">
		<c:forEach var="psu" begin="1" end="${pageCount}">
			<c:if test="${psu==page}">
		  		<li><b><a href="#">${psu}</a></b></li>
		  	</c:if>
		  	<c:if test="${psu!=page}">
		  		<li><a href="productList?page=${psu}">${psu}</a></li>
		  	</c:if>
		</c:forEach>
		</ul>
		<!-- search -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="input-group" style="margin: auto; display: inline-block;">
				<form action="productSearch" method="post">
					<!-- <div style="display: inline-block;"> -->
					<select class="form-control" name="category_id" id="sel1" style="width: 100px;">
							<option value="0" selected="selected">카테고리를 선택하세요</option>
							<option value="1">디지털/가전</option>
							<option value="2">가구/인테리어</option>
							<option value="3">아동/유아도서</option>
							<option value="4">생활/가공식품</option>
							<option value="5">스포츠/레저</option>
							<option value="6">여성잡화</option>
							<option value="7">여성의류</option>
							<option value="8">남성패션</option>
							<option value="9">게임/취미</option>
							<option value="10">뷰티/미용</option>
							<option value="11">반려동물용품</option>
							<option value="12">도서/티켓/음반</option>
							<option value="13">식물</option>
							<option value="14">기타 중고물품</option>
						</select>
					<input type="text" class="form-control" placeholder="상품 검색" name="product_title" style="width: 300px;">
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