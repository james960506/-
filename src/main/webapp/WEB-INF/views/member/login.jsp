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
<link href="${path}/resources/css/member/login.css" rel="stylesheet" type="text/css">
<script>
	window.onload = () =>{
		let msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
		msg = "";
	}
</script>
</head>
<body>
	<form class="form" action="login.me" method="POST">
		<div class="logo">
			<img src="resources/image/logo.png">
		</div>
		<div class="title">로그인</div>
 		
 		<table class="table">
		    <tr>
			    <td>
			    	<input type="text" placeholder="아이디" id="userId" name="userId" required autofocus>
			    </td>
			</tr>   
			<tr>
			    <td>
			      	<input type="password" id="pwd" placeholder="비밀번호" name="pwd" required>
			    </td>
			</tr> 
	  		<tr height="10px;"><td></td></tr>
			<tr>
	    		<td>
	      			<button type="submit" id="submit-btn">로그인</button>
	    		</td>
			</tr>
	  		<tr height="10px;"><td></td></tr>
	  		<tr>
				<td class="href">
		      		<button type="button" onclick="location.href='enroll.me'" id="join">회원가입</button>
		      		<button type="button" onclick="location.href='findID.me'" id="find_id">ID 찾기</button>
		      		<button type="button" onclick="location.href='findPW.me'" id="find_pwd">PW 찾기</button>
			 	</td>
	      	</tr>
  		</table>
	</form>
</body>
</html>