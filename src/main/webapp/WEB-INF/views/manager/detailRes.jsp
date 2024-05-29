<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세</title>
<link href="resources/css/reservation/detailRes.css" rel="stylesheet">
</head>
<body>
	<div class="main">
		<h1>${ res.uName }(${ res.userId })</h1>&nbsp;&nbsp;&nbsp;&nbsp;
		${ res.inDate } ~ ${ res.outDate }<br><br>
		<table>
			<tr>
				<th>예약 번호</th>
				<td>${ res.rno }</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>예약일</th>
				<td>${ res.reserveDate }</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>예약자명</th>
				<td>${ res.uName }</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3">${ res.email }</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td colspan="3">${ res.phone }</td>
			</tr>
			<tr>
				<th>예약상태</th>
				<td>${ res.status }</td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<hr>
		<table>
			<tr>
				<th>체크인</th>
				<td>${ res.inDate }</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>체크아웃</th>
				<td>${ res.outDate }</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<table class="childTable">
				<caption>반려견 수 ${ res.dnos }마리</caption>
					<tr>
						<th>반려견이름</th>
						<th>견종</th>
						<th>견종 크기</th>
					</tr>
					<c:forEach items="${ dList }" var="d">
						<tr>
							<td>${ d.dogName }</td>
							<td>${ d.breed }</td>
							<td>${ d.dogSize }</td>
						</tr>
					</c:forEach>
					<tr class="etc">
						<th>고객 요청사항</th>
					</tr>
					<tr>
						<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ res.etc }</td>
					</tr>
				</table>
			</tr>
		</table>
		<h3>결제내역</h3>
		<table class="payment">
			<tr>
				<th>결제방법</th>
				<th>카드명</th>
				<th>결제금액</th>
			</tr>
			<tr>
				<td>${ res.payMethod }</td>
				<td>${ res.cardName }</td>
				<td><fmt:formatNumber value="${ res.totalprice }" pattern="#,###" />원</td>
			</tr>
		</table>
		<h3>총 결제 금액 : <fmt:formatNumber value="${ res.totalprice }" pattern="#,###" />원</h3>
		<input type="button" value="닫기" onclick="window.close()">
	</div>
</body>
</html>