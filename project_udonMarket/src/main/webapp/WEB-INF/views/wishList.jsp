<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 내가 찜한 목록</title>
	<script src='/udon/resources/js/main.js'></script>
	<link href='/udon/resources/css/basic.css' rel='stylesheet'>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<% String user_id = (String)session.getAttribute("user_id"); %>
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="container" style="padding:50px 0; height: 750px;">
		<h2 class="ft_title center" style="margin-bottom: 50px;"><br>내가 찜한 목록</h2>
		<section class="section3 w1280">
			<table  class="table">
			  <tr>
			  	<td>
			  		[<a href="wishList?page=1&user_id=<%=user_id%>">최근목록</a>]&nbsp;
			  	</td>
			  </tr>
			</table>
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
	</div>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>