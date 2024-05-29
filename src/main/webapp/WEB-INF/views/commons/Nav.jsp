<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/commons/header_nav.css?after" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
#topMenu>li{   
    float: left;
    font-size: 0.8em;
}

#topMenu>li>a{   
    display: block;
    color: black;
    font-weight: 600;
    cursor: pointer;
    text-decoration : none;
    font-family: 'Gowun Dodum', sans-serif !important;
}

#topMenu>li>ul>li>a:hover{   
    color: yellowgreen !important;
    text-shadow: 0 -1 #07c;
    
}
#topMenu>li>ul {
	display: none;
	background-color: rgba(255, 255, 255, 0.5);
	text-align: center;
}
#topMenu>li:first-child>ul {
	margin-left:12px;
}
#topMenu>li:first-child>ul>li {
	text-align:center;
}
#topMenu>li>ul>li{   
     padding: 20px 10px 20px 10px;
     margin-right: 25px;
}
#topMenu>li>ul>li>a{
	 padding-left : 0;
     font-size: 20px;
     color: black;
     text-decoration : none;
     font-family: 'Gowun Dodum', sans-serif;
}
#topMenu>li:hover>ul{   
    display: block;
    z-index: 10;
}
</style>
</head>
<body>
	<div id="container">
		<header>
			<div id="logo" style="left: 12px;">
				<a href="${contextPath }/home">
					<img src="resources/image/logo.png"
						width="150px" height="170px" aria-posinset="center">
						<span style="font-size: 2.3em;">멍놀먹자 유치원</span>
				</a>
			</div>
			
			<nav>
				<ul id="topMenu">
					<li style="font-size: 1em;"><a>유치원 소개</a>
					<ul>
						<li><a href="map.bo">오시는길</a></li>
						<li><a href="notice.bo">공지사항</a></li>
					</ul>
					</li>
					<li style="font-size: 1em;"><a>커뮤니티</a>
					<ul>
						<li><a href="list.go">커뮤니티</a></li>
						<li><a href="moveToAttmList.at">사진게시판</a></li>
					</ul>
					</li>
					<li style="font-size: 1em;"><a>예약하기</a>
					<ul>
						<li><a href="requestMain.do">예약상담</a></li>
						<li><a href="insertRes.re">호텔예약</a></li>
					</ul>
					</li>
				</ul>
			</nav>
			<div id="login">
				<c:if test="${empty loginUser }">
					<li id="login"><a href="loginView.me" style="font-family: 'Gowun Dodum', sans-serif; font-size: 1.2em;">로그인</a></li>
				</c:if>
			</div>
			<div class="loginUser">
				<c:if test="${!empty loginUser }">
						<c:if test="${loginUser.isAdmin == 'N' }">
							<li id="myPage"><a href="myPage.me">마이페이지</a></li>
							<li id="logout"><a href="logout.me">로그아웃</a></li>
						</c:if>
						<c:if test="${loginUser.isAdmin == 'Y' }">
							<li id="manager"><a href="main.me">관리자 페이지</a></li>
							<li id="myPage"><a href="myPage.me">마이페이지</a></li>
							<li id="logout"><a href="logout.me">로그아웃</a></li>
						</c:if>
				</c:if>
			</div>
		</header>
	</div>
	<div id="minHeight" style="min-height: 590px;">
</body>
</html>