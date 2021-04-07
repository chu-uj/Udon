<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#submitButton").click(function(){
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				for(var i=0; i<files.length; i++){
					 formData.append("uploadFile", files[i]);
				}
				var uploadFileName = document.form1.uploadFile.value;
				console.log(uploadFileName);
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf('\\') +1 );
				console.log(uploadFileName);
				
				$.ajax({
					type:"post",
					url:"upload",
					data: formData,
					processData:false,
					contentType:false,
					
					success:function(data){
						opener.document.frm.product_image.value = uploadFileName;
						//close();
					},
					error:function(){
						opener.document.frm.product_image.value = uploadFileName;
						close();
						$("#inform").text("에러발생"); // 여기 왜 들어오는 지 확인해야함.
					}
				});
			});
			$(".custom-file-input").on("change", function() {
			  var fileName = $(this).val().split("\\").pop();
			  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
			});
		});
		
	</script>
</head>
<body>
	<div class="container mt-3">
		<h2 style="text-align: center;">파일 업로드</h2>
		<br>
		업로드할 파일 선택 : <br>
		<form name="form1" action="">
		<div class="custom-file mb-3">
			<input type="file" id="uploadFile" name="uploadFile" class="custom-file-input" size="200" multiple>
			<label class="custom-file-label" for="customFile">파일을 선택하세요</label>
		</div>
		</form>
		<input type="button" value="전송" id="submitButton" class="btn btn-primary">
	
		<div id="inform"></div>
	</div>
</body>
</html>