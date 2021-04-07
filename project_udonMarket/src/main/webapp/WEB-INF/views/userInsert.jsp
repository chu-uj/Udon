<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 회원가입</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- 도로명주소 api 불러오기 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">	
	window.onload = function() {
		let btnIns = document.getElementById("btnIns");
		btnIns.addEventListener("click", checkData);
	}
	
	
	function checkData() {
		if (myform.user_id.value === "") {
			alert("id를 입력하세요");
			myform.name.focus();
			return;
		}
		
		if((myform.user_id.value.length < 4) || (myform.user_id.value.length > 12)){
			alert("아이디를 4~12로 해주세요");
			myform.user_id.value="";
			myform.name.focus();
			return;
		}
	 	
		myform.submit();
		
		if (myform.password.value === "") {
			alert("비밀번호를 입력하시오");
			myform.pass.focus();
			return;
		}

	}
	
	
	
	
	//비밀번호 체크 (글자수 제한+특수문자꼭적용시키기 +비밀번호 불일치 일치 확인)
	function check_pw(){
		var pass1 = document.getElementById('pass1').value;
		var SC = ["!","@","#","$","%"];
		var check_SC = 0;
		   if(pass1.length < 5 || pass1.length > 16){
               window.alert('비밀번호는 5글자 이상, 16글자 이하만 이용 가능합니다.');
               document.getElementById('pass1').value='';
               document.getElementById('pw_pro').value='0';
               return;
           }
           for(var i=0;i<SC.length;i++){
               if(pass1.indexOf(SC[i]) != -1){
                   check_SC = 1;
               }
           }
           if(check_SC == 0){
               window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
               document.getElementById('pass1').value='';
               return;
           }
           if(pass1.length < 8){
        	   document.getElementById('pw_pro').value='1'; //이 숫자가 보안성 막대기 칸 수 
           }
           else if(pass1.length<12){
        	   document.getElementById('pw_pro').value='2';
           }else{
        	   document.getElementById('pw_pro').value='3';
           }
           if(document.getElementById('pass1').value !='' && document.getElementById('pass2').value!=''){
               if(document.getElementById('pass1').value==document.getElementById('pass2').value){
                   document.getElementById('check').innerHTML='비밀번호가 일치합니다.';
                   document.getElementById('check').style.color='blue';
               }
               else{
                   document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                   document.getElementById('check').style.color='red';
               }
           }
	}
	
	
	//우편주소 넣기
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("[name=addr1]").val(data.zonecode);
               $("[name=addr2]").val(fullRoadAddr);
               
               document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('addr2').value = fullRoadAddr;
               
           }
        }).open();
    }


	
</script>
</head>
<body>
	<script type="text/javascript">

$('#user_id').blur(function(){ 
	var user_id = $('#user_id').val();
	$.ajax({
		url : "idChk?user_id="+user_id,
		type : "get",
		dataType : "json",
		success : function(data) {
			console.log("1=중복"+data);
			if (data == 1) {
				//alert("떠라");
				$('#id_check').test("사용중인 아이디입니다 :p");
				$("#id_check").css("color", "red");
			} else if (data == 0) {
				$('#id_check').test("사용가능한 아이디입니다. ");
				$("#id_check").css("color", "green");
			}
		}
	});
});
</script>
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="container" style="padding:50px 0; height: 850px;">
		<form role="form" class="form-horizontal" action="userInsert"
			method="POST" name="myform">
			<fieldset>
				<div id="legend"  class="ft_title center">
					<legend style="text-align: center; margin-bottom: 50px; font-size: 30px;" class="ft_title center">회원가입</legend>
				</div>
				<h4>1. 로그인 정보</h4>
				<hr class="large">
				<!-- 아이디 -->
				<div class="form-group">
					<label class="control-label col-sm-3" for="orgcode">아이디</label>
					<div class="col-sm-3">
						<input type="text" id="orgcode" style="width: 300px;" id="user_id"
							name="user_id" placeholder="아이디(4자~12자)" class="form-control"
							required ><div class="check_font" id="id_check"></div>
					</div>
				</div>
				<div id="idInfo"></div>
				<hr class="middle">
				<!-- 패스워드-->
				<div class="form-group">
					<label class="control-label col-sm-3" for="pass">패스워드</label>
					<div class="col-sm-3">
						<input type="password" id="pass1" style="width: 300px;"
							name="password" placeholder="패스워드(특수문자포함 5자~16자)"
							class="form-control" minlength="4" onchange="check_pw()">
						<div style="width: 300px;" style="color:cadetblue">
							보안성
							<progress id="pw_pro" value="0" max="3">
								</rogress>
						</div>
					</div>
				</div>
				<!-- 패스워드-->
				<div class="form-group">
					<label class="control-label col-sm-3" for="passChk">패스워드확인</label>
					<div class="col-sm-3">
						<input type="password" id="pass2" style="width: 300px;"
							name="passChk" placeholder="패스워드 확인" class="form-control"
							minlength="4" onchange="check_pw()">
						<div style="width: 300px;" id="check"></div>
					</div>
					<br>
				</div>
				<br> <br> <br>
				<h4>2. 개인 정보</h4>
				<hr class="large">
				<!-- 성명-->
				<div class="form-group">
					<label class="control-label col-sm-3" for="orgname">성명</label>
					<div class="col-sm-3">
						<input type="text" id="orgname" style="width: 300px;"
							name="user_name" placeholder="성명" class="form-control"
							minlength="1" required>
					</div>
				</div>
				<!-- 주소-->
				<div class="form-group">
					<label class="control-label col-sm-3" for="addr">우편번호</label>
					<div class="col-sm-3">
						<button type="button" class="btn btn-default"
							onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
						<br> <br> <input class="form-control"
							style="width: 300px; display: inline;" placeholder="우편번호"
							name="addr1" id="addr1" type="text" readonly="readonly">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3">도로명 주소</label>
					<div class="col-sm-3">
						<input class="form-control" style="width: 300px;"
							placeholder="도로명 주소" name="user_addr" id="addr2" type="text"
							readonly="readonly" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3">상세 주소</label>
					<div class="col-sm-3">
						<input class="form-control" style="width: 300px;"
							placeholder="상세주소" name="addr3" id="addr3" type="text" />
					</div>
				</div>


				<!-- Button -->
				<div class="form-group">
					<div class="col-sm-3"></div>
					<div class="col-sm-3 col-sm-offset-2">
						<input type="button" value="가입하기" id="btnIns"
							class="btn btn-primary" />
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html>