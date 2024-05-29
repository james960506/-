<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/reservation/resInfo.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../commons/Nav.jsp"/>
<div class="main_content">
	<h1>예약 상세 정보</h1><br>
	<div class="firTable">
	<h4>예약 정보</h4>
		<table>
			<tr>
				<th>예약일</th>
				<td>${ res.reserveDate }</td>
			</tr>
			<tr>
				<th>숙박기간</th>
				<td>${ res.inDate } ~ ${ res.outDate }</td>
			</tr>
			<tr>
				<th>예약자명</th>
				<td>${ res.uName }</td>
			</tr>
			<tr>
				<th>주문상태</th>
				<td>${ res.status }</td>
			</tr>
		</table>
	</div>
	<div class="secTable">
	<h4>반려견 신청 정보</h4>
		<table>
			<tr>
				<th>반려견명</th>
				<th>견종</th>
				<th>견종크기</th>
				<th class="etc">특이사항</th>
			</tr>
			<c:forEach items="${ dList }" var="d" varStatus="status">
			<tr>
				<td>${ d.dogName }</td>
				<td>${ d.breed }</td>
				<td>${ d.dogSize }</td>
				<c:if test="${ status.first }">
				<td class="lastTd" rowspan="${fn:length(dList)+1}">${status.end}${ res.etc }</td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div class="thiTable">
	<h4>결제 정보</h4>
		<table>
			<tr>
				<th>결제방법</th>
				<td>${ res.payMethod }</td>
			</tr>
			<tr>
				<th>카드명</th>
				<td>${ res.cardName }</td>
			</tr>
			<tr>
				<th>총 결제금액</th>
				<td><fmt:formatNumber value="${ res.totalprice }" pattern="#,###"/>원</td>
			</tr>
		</table>
	</div>
	<div class="preBtn">
		<input type="button" value="이전 페이지로" onclick="location.href='selectMyResList.re?page=${page}'">
		<input type="button" value="멍놀먹자 메인" onclick="location.href='${contextPath}/home'">
	</div>
</div>
<br><br>
<jsp:include page="../commons/footer.jsp"/>
</body>
</html>