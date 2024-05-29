<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="${path}/resources/css/ming/Button.css" rel="stylesheet">
<link href="${path}/resources/css/ming/Main.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Nanum+Myeongjo&family=Noto+Serif+TC:wght@200&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69cc558a57d626f42a3847099725a144"></script>
</head>
<body>
	<div id="main">
			<div id="logo">
				<a href="${contextPath}/home">
					<img src="resources/image/logo.png"
						width="150px" height="170px" aria-posinset="center">
						<span>멍놀먹자 유치원</span>
				</a>
			</div>
		<nav>
				<ul id="topMenu">
					<li><a>유치원 소개</a>
					<ul>
						<li><a href="map.bo">오시는길</a></li>
						<li><a href="notice.bo">공지사항</a></li>
					</ul>
					</li>
					<li><a>커뮤니티</a>
					<ul>
						<li><a href="list.go">커뮤니티</a></li>
						<li><a href="moveToAttmList.at">사진게시판</a></li>
					</ul>
					</li>
					<li><a>예약하기</a>
					<ul>
						<li><a href="requestMain.do">예약상담</a></li>
						<li><a href="insertRes.re">호텔예약</a></li>
					</ul>
					</li>
				</ul>
		</nav>
			<div id="loginNav" style="padding: 10px;padding-top: 20px;position: absolute; right: 50px; width: 100px;top: 50px;">
				<c:if test="${empty loginUser }">
					<li id="login"><a href="loginView.me" >로그인</a></li>
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
		<div id="information">
			<p style="font-family: bold; font-size: 2em;">반려견과 반려인의 행복한 공간이 펼쳐지는 이 곳은 바로<br><br></p><br><br><br><br>
			<p style="font-weight: bold; font-size: 2em;">'멍놀먹자 유치원' 입니다.<br><br></p><br><br><br><br>
			<p style="font-size: 1.25em;"> 반려동물 행동심리 전문가가 운영하는 멍놀먹자 유치원에서는<br></p><br><br>
			<p style="font-size: 1.25em;"> 반려견을 위한 ‘세듀케어(SEDUCARE)’라는<br></p><br><br>
			<p style="font-size: 1.25em;"> 서비스를 직접 만들어 프로그램을 운영하고 있습니다.<br></p><br><br>
			<br><br><br><br><br><br><br><br><br><br><br>
			<a class="btn" href="notice.bo" style="right: 800px; margin-top: -70px;"><span>자세히보기</span></a>
			<br>
		</div>
	</div>
		<br><br><br><br><br><br><br>
		<div class="line">
			<img src="https://cdn-icons-png.flaticon.com/512/8054/8054592.png" height="300px">
		</div>
		
		<p id="all_about">All&nbsp;&nbsp;&nbsp;about&nbsp;&nbsp;&nbsp;Mine</p>
		
		<div id="centerBox">
			<span>반려견이 세상에 더불어 사는 구성원이 될 수 있도록 <br><br> 보호자의 선택이 후회되지 않는 멍놀먹자 유치원</span>
		</div>
		
		<div id="training" style="display:inline-block;vertical-align:top;">
			<img src="https://images.pexels.com/photos/14116508/pexels-photo-14116508.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"><br>
		</div>
		
		<div id="trainingText" style="display:inline-block;">
			<span>전문가의 손길을 받아보세요!<br><br></span>
			<p> Safe Puppy Care Hotel Service<br></p>
			<p> SEDUCARE<br></p>
			<p> Certified Puppy Expert<br></p>
			<p> preservative-free feed<br></p>
			<br>
			<a href="insertRes.re" title="Button push lightblue" class="button btnPush btnLightBlue">자세히보기</a>
		</div>		
		<br><br><br><br>
		<div class="line">
			<img src="https://svgsilh.com/svg/1084885-795548.svg" height="300px">
		</div>
		<br>
		<section>
			<div id="information2">
				<p>멍놀먹자 유치원은 365일<br>연중무휴로 우리 아이들을 케어합니다.</p>
				<br><br><br><br><br><br><br><br>
				<p style="font-weight: bold; font-size: 2.25em;" >업무시간</p><br><br><br>
				<p style="font-size: 1.25em; font-weight: bold;">월 ~ 토 &nbsp;&nbsp; 09:00 ~ 21:00</p><br><br>
				<p style="font-size: 1.25em; font-weight: bold;">일 / 공휴일 &nbsp;&nbsp; 13:00 ~21:00</p><br><br>
				<p style="font-size: 1.25em; font-weight: bold;">점심시간 &nbsp;&nbsp; 13:00 ~14:00</p><br><br>
			</div>
				<div id="map" style="width: 650px; height: 600px;"></div>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(37.56790611573871, 126.98308342486291 ),
							level: 3
						};
		
						var map = new kakao.maps.Map(container, options);
						var markerPosition  = new kakao.maps.LatLng(37.56790611573871, 126.98308342486291 ); 
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
						marker.setMap(map);
					</script>
		</section>
		<footer>
			<div id="bottomMenu">
				<ul>
					<li><a href="map.bo">오시는길</a></li>
					<li><a href="requestMain.do">상담신청</a></li>
				</ul>
			</div>
			<div id="company">
				<p>	상호 : 멍놀먹자 유치원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					사업자등록번호 : 012-34-56789</p>
				<p> 주소:서울특별시 중구 남대문로 120 대일빌딩 2층, 3층&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					전화:02-1544-9970
				</p>
				
			</div>
		</footer>
			
</body>
</html>