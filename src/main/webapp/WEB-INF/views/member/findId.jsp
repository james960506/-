<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="path" value="${ pageContext.request.contextPath }" />	       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="${path}/resources/css/member/findId.css" rel="stylesheet" type="text/css"></head>
</head>
<body>
	<form class="form" action="selectFindId.me" method="POST">
  		<div class="logo">
			<img src="resources/image/logo.png">
		</div>
 		<div class="title"><label>아이디 찾기</label></div>
 		<table class="table">
			<tr><td><input type="text" name="uName" placeholder="이름" required autofocus id="uName"></td></tr> 
			<tr><td><input type="email" name="email" placeholder="이메일" required id="email"></td></tr>
			<tr height="10px;"><td></td></tr>
			<tr><td><button type="submit" id="find_id">ID 찾기</button></td></tr>
			<tr height="10px;"><td></td></tr>
			<tr><td><button type="button" id="find_pwd">비밀번호 찾기</button></td></tr>
  		</table>
	</form>

	<script>
		document.getElementById("find_pwd").addEventListener('click', function() {
			const uName = document.getElementById("uName").value;	
			const email = document.getElementById("email").value;
			
			location.href='findPW.me?uName=' + uName + "&email=" + email;
		});
	</script>	
</body>
</html>