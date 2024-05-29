<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="${path}/resources/css/reservation/resList.css"
	rel="stylesheet">
<style>
.sidebar {
	text-align: left;
	position: fixed;
	top: 50%;
	transform: translateY(-50%);
	left: 30px;
	height: 400px;
	width: 250px !important;
	padding-top: 10px;
	background-color: #fff9c4;
	border-radius: 8px;
	border-right: 1px solid #dee2e6;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
<script>
	window.onload = () =>{
		const startDate = document.getElementById("startDate");
		const endDate = document.getElementById("endDate");
		let today = new Date();
		let maxDate = today.toISOString().substring(0, 10);
		console.log(maxDate);
		startDate.max = maxDate;
		endDate.max = maxDate;
	}

	const dateCheck = () =>{
		const startDate = document.getElementById("startDate").value;
		const endDate = document.getElementById("endDate").value;
		if(startDate == "" || endDate == ""){
			location.href = "selectMyResList.re";
		}else{
			location.href = "searchResDate.re?startDate="+startDate+"&endDate="+endDate;	
		}
	}
	const resInfo = (value) =>{
		location.href = "selectMyRes.re?rno="+value+"&page=${pi.currentPage}";
	}
	const updateStatus = (rno) =>{
		let arr = [];
		arr[0] = rno;
		arr[1] = "취소신청";
		$.ajax({
			url:"updateStatus.re",
			type:"post",
			data:{arr},
			success: (data) =>{
				document.getElementById("status"+rno).innerText = arr[1];
			},
			error: (data) =>{
				console.log(data)
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="../commons/side.jsp" />
	<jsp:include page="../commons/Nav.jsp" />
	<div class="myRequest" style="padding-left: 200px;">
		<span>멍</span> <span>놀</span> <span>먹</span> <span>자</span> <span>|</span>
		<span>내</span> <span>&nbsp;</span> <span>예</span> <span>약</span> <span>내</span>
		<span>역</span>
		<p style="font-size: 15px; font-weight: bold;">
			예약신청했었던 목록을 확인하실 수 있습니다.<br> <font color="black">*예약취소는
				체크인 3일전까지 가능합니다.</font>
		</p>
	</div>
	<div class="main_content">
		<div class="top">
			<ul>
				<li>조회기간(예약일)</li>
				<li><a href="searchResDate.re?value=1W">1주일</a></li>
				<li><a href="searchResDate.re?value=6M">6개월</a></li>
				<li><a href="searchResDate.re?value=1Y">1년</a></li>
				<li><a href="searchResDate.re?value=all">전체</a></li>
				<li><input type="date" id="startDate"> ~ <input
					type="date" id="endDate"> &nbsp;<input type="button"
					value="검색하기" onclick="dateCheck()"></li>
			</ul>
		</div>
		<div class="table">
			<h3>*최근예약</h3>
			<table>
				<tr>
					<th>예약일</th>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>반려견 수</th>
					<th>결제금액</th>
					<th>주문상태</th>
				</tr>
				<c:if test="${ !empty res }">
				<c:forEach items="${ res }" var="r">
					<tr onclick="resInfo(this.id)" id="${ r.rno }">
						<td class="center">${ r.reserveDate }</td>
						<td class="center">${ r.inDate }</td>
						<td class="center">${ r.outDate }</td>
						<td class="center">${fn:length(fn:split(r.dnos,"/"))}마리</td>
						<td class="center"><fmt:formatNumber
								value="${ r.totalprice }" pattern="#,###" />원</td>
						<td class="center" id="status${ r.rno }">${ r.status }<br>
							<c:set var="now" value="<%=new java.util.Date()%>" /> <fmt:parseNumber
								value="${now.time / (1000*60*60*24)}" integerOnly="true"
								var="nowfmtTime" scope="request" /> <fmt:parseNumber
								value="${r.reserveDate.time / (1000*60*60*24)}"
								integerOnly="true" var="dbDtParse" scope="request" /> <c:if
								test="${ r.status == '예약완료'}">
								<c:if test="${nowfmtTime - dbDtParse <= 3}">
									<input type="button" value="취소신청"
										onclick="javascript:event.stopPropagation();updateStatus('${r.rno}')">
								</c:if>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${ empty res }">
					<tr>
						<th colspan="8" rowspan="3"><h1>예약내역이 없습니다.</h1></th>
					</tr>
					<tr></tr>
					<tr></tr>
				</c:if>
			</table>
		</div>
		<c:if test="${! empty res }">
		<div class="board_page">
			<c:url var="goFirst" value="${ loc }">
				<c:param name="page" value="${ pi.startPage }" />
			</c:url>

			<a href="${ goFirst }" class="btn frist"><<</a>

			<c:if test="${ pi.currentPage > 1}">
				<c:url var="goBack" value="${ loc }">
					<c:param name="page" value="${ pi.currentPage-1 }" />
				</c:url>
			</c:if>

			<a href="${ goBack }" class="btn prew"><</a>

			<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				<c:url var="goNum" value="${ loc }">
					<c:param name="page" value="${ p }" />
				</c:url>
				<c:if test="${ pi.currentPage eq  p }">
					<a href="${ goNum }" class="num selected">${ p }</a>
				</c:if>
				<c:if test="${ pi.currentPage ne  p }">
					<a href="${ goNum }" class="num">${ p }</a>
				</c:if>
			</c:forEach>

			<c:if test="${ pi.currentPage <= endPage}">
				<c:url var="goNext" value="${ loc }">
					<c:param name="page" value="${ pi.currentPage+1 }" />
				</c:url>
			</c:if>

			<a href="${ goNext }" class="btn next">></a>

			<c:url var="goLast" value="${ loc }">
				<c:param name="page" value="${ pi.endPage }" />
			</c:url>
			<a href="${ goLast }" class="btn last">>></a>
		</div>
		</c:if>
	</div>
	<%@ include file="../commons/footer.jsp"%>
</body>
</html>