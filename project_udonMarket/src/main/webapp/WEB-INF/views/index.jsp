<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 우리동네</title>
	<!-- font -->
	<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- resource -->
	<script src='/udon/resources/js/main.js'></script>
	<link href='/udon/resources/css/basic.css' rel='stylesheet'>
</head>
<script type="text/javascript">
$(document).ready(function() {
	var check=$("#blameCheck").text();
	if(check=="1"){
		alert("신고가 정상 등록되었습니다.")
	}
})
</script>
<body>
	<!--신고 등록처리 확인  -->
	<div id="blameCheck" style="display: none;"><%=request.getParameter("loginCheck") %></div>
	<!-- top -->
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="contentWrap">
		<!-- search -->
		<jsp:include page="./search.jsp"></jsp:include>
		<section class="section2 w1280">
			<h2 class="ft_title center">
				우리동네 상품
			</h2>
			<h4 class="ft_title center">
				<a href="productList" type="button" class="btn btn-link">더보기</a>
			</h4>
			<div class="productNew">
				<ul class="productNewUl">
					<c:forEach var="p" items="${data}">
						<li>
							<a href="productDetail?product_id=${p.product_id}&page=${page}">
								<div class="productImg">
									<img src="/udon/resources/upload/${p.product_image}" alt="사진">
								</div>
								<dl>
									<dt class="productName">${p.product_title}</dt>
									<dd class="memAddress d_inblock">조회수 : ${p.views} / </dd>
									<dd class="memname d_inblock">작성자 : ${p.user_id}</dd>
									<dd class="price">${p.product_price}원</dd>
								</dl>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>
	</div><hr>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>