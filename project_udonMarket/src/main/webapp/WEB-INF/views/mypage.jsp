<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<jsp:include page="./top.jsp"></jsp:include>
<div class="container">
<h2>${user_id}</h2>
<table class="table caption-top">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="i" items="${list }">
	  	 <tr>
	      <td>${i.category_name }</td>
	      <td>${i.product_title }</td>
	      <td><img src="/udon/resources/images/${i.product_image}.png"/></td>
	    </tr>
  	</c:forEach>
  </tbody>
</table>
	<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group me-2" role="group" aria-label="First group" style="margin-left: 50%;">
	  	<c:forEach var="psu" begin="1" end="${totalPage}">
	  		<c:if test="${psu==page}">
	    		<button type="button" class="btn btn-outline-secondary">${psu}</button>
	    	</c:if>
	    	<c:if test="${psu!=page}">
	  			<a href="userInfo?user_id=${user_id}&page=${psu}"><button type="button" class="btn btn-outline-secondary">${psu}</button></a>
	  		</c:if>
	  	</c:forEach>
	  </div>
	 </div> 
</div>
<div class="container">
<h2>${user_id}</h2>
<table class="table caption-top">
<thead>
    <tr>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
 </thead>
  <tbody>
  	<c:forEach var="i" items="${list1 }">
	  	 <tr>
	      <td>${i.board_no }</td>
	      <td>${i.board_title }</td>
	      <td>${i.board_wrt_date}</td>
	      <td>${i.views}</td>
	    </tr>
  	</c:forEach>
  </tbody>
</table>
<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group me-2" role="group" aria-label="First group" style="margin-left: 50%;">
	  	<c:forEach var="psu" begin="1" end="${totalBoardPage}">
	  		<c:if test="${psu==page}">
	    		<button type="button" class="btn btn-outline-secondary">${psu}</button>
	    	</c:if>
	    	<c:if test="${psu!=page}">
	  			<a href="userInfo?user_id=${user_id}&page=${psu}"><button type="button" class="btn btn-outline-secondary">${psu}</button></a>
	  		</c:if>
	  	</c:forEach>
	  </div>
	 </div>
</div>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>