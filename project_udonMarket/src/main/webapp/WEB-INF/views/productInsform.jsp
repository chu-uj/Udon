<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><!-- spring tag 사용 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 우리동네 상품</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			let btnIns = document.getElementById("btnIns");
			btnIns.addEventListener("click",checkData, false);
			
		}
		function checkData(){
			if(frm.name.product_title === ""){
				alert("작성자를 입력하세요");
				frm.product_title.focus();
				return;
			}else if(frm.category_id.value === ""){
				alert("카테고리를 선택하세요");
				frm.category_id.focus();
				return;
			}
			frm.submit();
		}
		
		function uploadImage(){
			mypopup=window.open("/udon/imagePopup.jsp","mywin","width=500, height=300,top=100, toolbar=yes,state=yes");
		}
	</script>
</head>
<body>
	<% 
		String user_id =(String)session.getAttribute("user_id");
	%>
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="container" style="padding:50px 0; height: 750px;">
		<h2 class="ft_title center" style="margin-bottom : 50px;"><br>중고거래 글쓰기</h2>
		<form action="productInsert" method="post" name="frm">
		<input type="hidden" name="user_id" value=<%=user_id %>>
		<table  class="table table-bordered">
			<tr>
		  		<td>이미지</td>
		  		<td>	
		  			<input type="text" name ="product_image" placeholder="이미지를 업로드 하세요" readonly  class="form-control">
		  			<input type="button" value="이미지 업로드" onclick="uploadImage()" class="btn btn-default">
		  		</td>
			</tr>
			<tr>		
			<tr>
			  	<td>카테고리</td>
			  	<td>
			  		<select name="category_id" class="form-control">
						<option value="0">카테고리를 선택하세요</option>
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
			  	</td>
		  	</tr>
			<tr>
		  		<td>제목</td>
		  		<td><input type="text" name="product_title" class="form-control"></td>
			</tr>
		  	<tr>
		  		<td>가격</td>
		  		<td><input type="number" name="product_price" class="form-control"></td>
		  	</tr>
			<tr>
				<td>내용</td>
		  		<td>
		  		<textarea rows="5" cols="50" name="product_content" class="form-control"></textarea>
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan="2" style="text-align: center;">
		  		<input type="hidden" name="bip" value="<%=request.getRemoteAddr()%>">
		  		<input class="btn btn-primary" type="button" value="등록" id="btnIns">
		  		<!-- <input type="button" value="등록" onclick="checkData()"> -->
		  		<input class="btn btn-info" type="button" value="목록" id="a" onclick="location.href='productList?page=1'">
		  	</td>
		  </tr>
		</table>
		</form>
 	</div>
 	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>