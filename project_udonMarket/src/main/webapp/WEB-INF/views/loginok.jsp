<%@page import="pack.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우동 | 로그인</title>
<%-- <% request.setCharacterEncoding("utf-8");
UserDto user = (UserDto) session.getAttribute("userDto"); %>
<% String user_id = user.getUser_id();
String password = user.getPassword();
	
	if(user_id.equals(user_id) && password.equals(password)){
		session.setAttribute("user_id", user_id);
		response.sendRedirect("index.jsp");
	}else if(user_id.equals(user_id)){
		out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
	}else if(password.equals(password)){
		out.println("<script>alert('아이디가 틀렸습니다.'); history.back();</script>");
	}else{
		out.println("<script>alert('아이디와 비밀번호가 틀렸습니다.'); history.back();</script>");
	}
		%> --%>
</head>
<body onload="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form id="checkForm">
			<input type="text" name="idinput" id="userId">
			<input type="button" value="중복확인" onclick="idCheck">
		</form>
		<div id="msg"></div>
		<br>
		<input id="cancelBtn" type="button" value="취소" onlick="window.close()"><br>
		<input id="useBtn" type="button" value="사용하기" onclick = "sendCheckValue()">
	</div>



</body>
</html>