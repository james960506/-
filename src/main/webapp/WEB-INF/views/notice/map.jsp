<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${ path }/resources/css/ming/map.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Nanum+Myeongjo&family=Noto+Serif+TC:wght@200&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69cc558a57d626f42a3847099725a144"></script>
</head>
<body>
	<jsp:include page="../commons/Nav.jsp"/>
	<div class="board_wrap">
        <div class="board_title">
            <p class="sub_title">오시는길</p><br>
            <p class="sub">멍놀먹자유치원으로 오시는 길입니다.</p>
        </div>
    
        <hr class="hr-14"><br><br>
        <table>
			<tr>
				<th style="border-top: 1px solid #222;">주소</th>
				<td style="border-top: 1px solid #222;">서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩)(T:1544-9970 / F: 02-722-0858")</td>
			</tr>
			<tr>
				<th>버스</th>
				<td class="bus">
					"우리은행 종로지점 정류장"
					<hr>
				
				<img src="https://iei.or.kr/resources/images/sub01/sub01_06_busB.jpg">
				"163 / 172 / 201 / 262 / 401 / 406 / 701 / 704 / N15 / N62"
				<br>
				<img src="https://iei.or.kr/resources/images/sub01/sub01_06_busG.jpg">
				"7017 / 7021 / 7022" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="https://iei.or.kr/resources/images/sub01/sub01_06_busR.jpg">
				"8110"
			</tr>
			<tr>
				<th style="border-top: 1px solid #222;">&nbsp;지하철 &nbsp;</th>
				<td style="border-top: 1px solid #222;">지하철 2호선 을지로 입구역 3번 출구 100M / 1호선 종각역 4번, 5번 출구 200M</td>
			</tr>
        </table><br><br>
        <div id="map" style="width: 900px; height: 700px;"></div>
        </div>
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
	<jsp:include page="../commons/footer.jsp"/>
</body>
</html>