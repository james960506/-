<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:set var="path" value="${ pageContext.request.contextPath }" />	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/member/searchSuccess.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form class="form">
		<div class="logo">
			<img src="resources/image/logo.png">
		</div>
		<div class="title">아이디 찾기 결과</div>
			
		<table class="table">
			<c:if test="${m1.uName ne null}">
				<tr class="true"><td>입력하신 정보와 일치하는 아이디는 아래와 같습니다.</td></tr>
				<tr class="true"><td>${ m1.uName }의 아이디는 ${ m1.userId }입니다.</td></tr>	
				<tr><th><button type="button" onclick="location.href='loginView.me'">로그인</button></th></tr>	
			</c:if>
			
			<c:if test="${m1.uName eq null }">
				<tr><td class="false">존재하는 아이디가 없습니다.</td></tr>
				<tr><th><button type="button" onclick="location.href='findID.me'">ID 찾기</button></th></tr>	
			</c:if>
  		</table>
	</form>
	
</body>
</html>