$(document).ready(function() {
		$("#Content").empty();
		$.ajax({
			type:"get",
			url: $("#myData").attr("href"),
			dataType:"json",
			success:function(data){
				var str="<table class='table table-hover'>";
				let list = data.datas
				$(list).each(function(idx,arr) {
					let grade = data.userGrade;
					str+="<tr>"+"<td class='userRow'>"+"아이디</td><td  class='userRow'>"+arr["user_id"]+"</td>"+"</tr>";
					str+="<tr>"+"<td class='userRow'>"+"유저 등급</td><td  class='userRow'>"+grade+"</td>"+"</tr>";
					str+="<tr>"+"<td class='userRow'>"+"별명</td><td  class='userRow'>"+arr["user_name"]+"</td>"+"</tr>";
					if(arr["profile_image"] == null){
						str+="<tr>"+"<td class='userRow'>"+"프로필 사진</td><td  class='userRow'>"+"<img src='/udon/resources/images/profile1.png"+"' class='mr-3 mt-3 rounded-circle'>"+"</td>"+"</tr>";
					}else{
						str+="<tr>"+"<td class='userRow'>"+"프로필 사진</td><td  class='userRow'>"+"<img src='/udon/resources/profile/"+arr["profile_image"]+"' class='mr-3 mt-3 rounded-circle'>"+"</td>"+"</tr>";
					}
					
					str+="<tr>"+"<td class='userRow'>"+"주소지</td><td  class='userRow'>"+arr["user_addr"]+"</td>"+"</tr>";
				});
					str+="</table><br>"
					$(list).each(function(idx,arr){
							str+="<a href='userDataUpdate?user_id="+arr["user_id"]+"'>"+"<button type='button' class='btn btn-primary'>"+"내 정보 수정"+"</button>"+"</a>";
						});
					$("#Content").html(str);
			},
			error:function(){
				$("#Content").text("에러발생");	
			}
		})
		$("#myData").click(function(){
			$("#Content").empty();
			event.preventDefault();
			$.ajax({
				type:"get",
				url: $("#myData").attr("href"),
				dataType:"json",
				success:function(data){
					var str="<table class='table table-hover'>";
					let list = data.datas
					$(list).each(function(idx,arr) {
					let grade = data.userGrade;
					str+="<tr>"+"<td class='userRow'>"+"아이디</td><td  class='userRow'>"+arr["user_id"]+"</td>"+"</tr>";
					str+="<tr>"+"<td class='userRow'>"+"유저 등급</td><td  class='userRow'>"+grade+"</td>"+"</tr>";
					str+="<tr>"+"<td class='userRow'>"+"별명</td><td  class='userRow'>"+arr["user_name"]+"</td>"+"</tr>";
					if(arr["profile_image"] == null){
						str+="<tr>"+"<td class='userRow'>"+"프로필 사진</td><td  class='userRow'>"+"<img src='/udon/resources/images/profile1.png"+"' class='mr-3 mt-3 rounded-circle'>"+"</td>"+"</tr>";
					}else{
						str+="<tr>"+"<td class='userRow'>"+"프로필 사진</td><td  class='userRow'>"+"<img src='/udon/resources/profile/"+arr["profile_image"]+"' class='mr-3 mt-3 rounded-circle'>"+"</td>"+"</tr>";
					}
					str+="<tr>"+"<td class='userRow'>"+"주소지</td><td  class='userRow'>"+arr["user_addr"]+"</td>"+"</tr>";
					});
						str+="</table><br>";
						$(list).each(function(idx,arr){
							str+="<a href='userDataUpdate?user_id="+arr["user_id"]+"'>"+"<button type='button' class='btn btn-primary'>"+"내 정보 수정"+"</button>"+"</a>";
						});
						$("#Content").html(str);
				},
				error:function(){
					$("#Content").text("에러발생");	
				}
			})
		})
	$("#productList").click(function() {
		$("#Content").empty();
		event.preventDefault();
		$.ajax({
			type:"get",
			url: $("#productList").attr("href"),
			dataType:"json",
			success:function(data){
				var str="<table class='table table-hover'>";
				str+="<tr ><th>상품카테고리</th><th>상품 이름</th><th>상품 이미지</th></tr>"
				let list = data.datas
				$(list).each(function(idx,arr) {
					var product_id = arr["product_id"];
					str+="<tr>";
					str+="<td>"+arr["category_name"]+"</td>";
					str+="<td>"+"<a href=productDetail?product_id="+product_id+"&page=1>"+arr["product_title"]+"</a>"+"</td>";
					str+="<td>"+"<img style='width:30px; height:30px;' src='/udon/resources/upload/"+arr["product_image"]+"'>"+"</td>";
					str+="</tr>";
				});
					str+="</table>"
					$("#Content").html(str);
			},
			error:function(){
				$("#Content").text("에러발생");	
			}
		})
	})
	$("#boardList").click(function() {
		$("#Content").empty();
		event.preventDefault();
		$.ajax({
			type:"get",
			url: $("#boardList").attr("href"),
			dataType:"json",
			success:function(data){
				var str="<table class='table table-hover'>";
				str+="<tr><th>게시판 번호</th><th>게시판 제목</th><th>게시판 작성일</th><th>게시판 조회수</th></tr>"
				let list = data.datas
				$(list).each(function(idx,arr) {
					var board_no= arr["board_no"];
					str+="<tr>";
					str+="<td>"+arr["board_no"]+"</td>";
					str+="<td>"+"<a href=boardDetail?board_no="+board_no+"&page=1>"+arr["board_title"]+"</a>"+"</td>";
					str+="<td>"+arr["board_wrt_date"]+"</td>";
					str+="<td>"+arr["views"]+"</td>";
					str+="</tr>";
				});
					str+="</table>"
					$("#Content").html(str);
			},
			error:function(){
				$("#Content").text("에러발생");	
			}
		})
	})
})/**
 * 
 */