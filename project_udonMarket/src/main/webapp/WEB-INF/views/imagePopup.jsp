<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 파일 업로드</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		});
	</script>
</head>
<body>
	<h2>* 파일 업로드/다운로드</h2>
	
	업로드할 파일 선택 : <br>
	<form name="form1" action="">
		<input type="file" id="uploadFile"name="uploadFile" size="200" multiple><br>
	</form>
	<input type="button" value="전송" id="submitButton">

	<div id="inform"></div>
</body>
</html>