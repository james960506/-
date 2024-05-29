<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="${path}/resources/css/reservation/reservationList.css" rel="stylesheet">
<script>
	window.onload = () =>{
		const startDate = document.getElementById("startDate");
		const endDate = document.getElementById("endDate");
		let today = new Date();
		let maxDate = today.toISOString().substring(0, 10);
		startDate.max = maxDate;
		endDate.max = maxDate;
	}
	
	const checkSelect = () =>{
		const checkAllcBox = document.querySelectorAll("input[type=checkbox]")[0];
		const cboxs = document.querySelectorAll("input[name='deleteCbox']");
		const checkCboxs = document.querySelectorAll("input[name='deleteCbox']:checked");
		if(cboxs.length == checkCboxs.length){
			checkAllcBox.checked = true;
		}else{
			checkAllcBox.checked = false;
		}
	};

	const checkAll = () =>{
		const cboxs = document.querySelectorAll("input[type=checkbox]");
		for(let i=1; i<cboxs.length; i++){
			cboxs[i].checked = cboxs[0].checked;
		}
	};
	
	const deleteRes = () =>{
		const checkCboxs = document.querySelectorAll("input[name='deleteCbox']:checked");
		const deleteRnos = [];
		for(i=0; i<checkCboxs.length; i++){
			deleteRnos[i] = checkCboxs[i].value;
		}
		if(deleteRnos.length != 0){
			location.href = "deleteRes.ma?deleteRnos="+deleteRnos;
		}
	}; 
	
	const detailDiv = () =>{
		$(".detailSearch").toggle();
	};
	
	const detailSearch = (value) =>{
		const dates = document.querySelectorAll("input[type=date]");
		const inDate = document.getElementsByName("inDate")[0];
		const outDate = document.getElementsByName("outDate")[0];
		const keyword = document.getElementsByName("keyword")[0];
		const form = document.getElementById("detailSearchForm");
		switch(value){
		case '1':
			if(dates[0].value == "" || dates[1].value == ""){
				alert("날짜를 입력해주세요.");
				return;
			}
			inDate.value = dates[0].value;
			outDate.value = dates[1].value;
			keyword.value = "reserveDate";
			break;
		case '2':
			if(dates[2].value == "" || dates[3].value == ""){
				alert("날짜를 입력해주세요.");
				return;
			}
			inDate.value = dates[2].value;
			outDate.value = dates[3].value;
			keyword.value = "checkIn";
			break;
		case '3':
			if(dates[4].value == "" || dates[5].value == ""){
				alert("날짜를 입력해주세요.");
				return;
			}
			inDate.value = dates[4].value;
			outDate.value = dates[5].value;
			keyword.value = "checkOut";
			break;
		}
		form.submit();
	};
	
	const detailReserve = (rno) =>{
		let _width = "750";
		let _height = "1000";
		let _left = (window.screen.width/2) - (_width/2);
		let _top = (window.screen.height/2) - (_height/2);
		const openWin = window.open("detailRes.ma?rno="+rno, "popup", "width="+_width+", height="+_height+",left="+_left+",top="+_top);
	}
	
	const checkValue = () =>{
		if(document.getElementById("value").value.trim() == ""){
			location.href = "selectResList.ma";
			return false;
		}
		return true;
	}
	rno = 0;
	const updateStatus = (value) =>{
		let strArr = [];
		if(value[0] == "Y"){
			text = "예약취소";
		}else{
			text = "취소불가";
		}
		rno = value;
		value = value.substr(1);
		strArr[0] = value;
		strArr[1] = text;
		 $.ajax({
			url:"updateStatus.re",
			type:"post",
			data:{arr : strArr},
			success: (data) =>{
				if(rno[0] == "Y"){
					text = "예약취소";
				}else{
					text = "취소불가";
				}
				rno = rno.substr(1);
				document.getElementById("status"+rno).innerText = text;
			},
			error: (data) =>{
				console.log(data)
			}
		}); 
	}
</script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="../commons/manager_header.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">예약 관리</h1>
				<div class="card mb-4"></div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 예약 목록
					</div>
					<div class="card-body">
						<form action="detailSearchDate.ma" method="post" id="detailSearchForm">
							<input type="hidden" name="inDate"> <input type="hidden" name="outDate"> <input type="hidden" name="keyword"> <input type="hidden" name="page" value="${ pi.currentPage }">
						</form>
						<div class="search">
							<form action="searchRes.ma" method="get" id="searchForm" onsubmit="return checkValue()">
								<input type="button" value="상세검색" onclick="detailDiv()"> 
								<select name="keyword">
									<option value="userId">아이디</option>
									<option value="name">이름</option>
								</select> <input type="hidden" name="page" value="${ pi.currentPage }"> <input type="search" id="value" name="value"> <input type="submit" value="검색">
							</form>
						</div>

						<div class="detailSearch">
							<table>
								<tr>
									<th><h4>&nbsp;&nbsp;&nbsp;예약일</h4></th>
									<th><input type="date" id="startDate"></th>
									<th><input type="date" id="endDate"></th>
									<th><input type="button" value="검색" onclick="detailSearch('1')"></th>
								</tr>
								<tr>
									<th><h4>&nbsp;&nbsp;&nbsp;체크인</h4></th>
									<th><input type="date"></th>
									<th><input type="date"></th>
									<th><input type="button" value="검색" onclick="detailSearch('2')"></th>
								</tr>
								<tr>
									<th><h4>&nbsp;&nbsp;&nbsp;체크아웃</h4></th>
									<th><input type="date"></th>
									<th><input type="date"></th>
									<th><input type="button" value="검색" onclick="detailSearch('3')"></th>
								</tr>
							</table>
						</div>

						<div class="content">
							<table>
								<tr>
									<th><input type="checkbox" id="checkAll" onchange="checkAll()"></th>
									<th>예약번호</th>
									<th>예약일</th>
									<th>예약자명</th>
									<th>예약 기간</th>
									<th>반려견 수</th>
									<th>금액</th>
									<th>예약 상태</th>
								</tr>
								<c:if test="${ !empty res }">
								<c:forEach items="${ res }" var="res">
									<tr onclick="detailReserve(this.id)" id="${ res.rno }">
										<th onclick="javascript:event.stopPropagation()"><input type="checkbox" name="deleteCbox" onchange="checkSelect()" value="${ res.rno }"></th>
										<td>${ res.rno }</td>
										<td>${ res.reserveDate }</td>
										<td>${ res.uName }</td>
										<td>${ res.inDate }<br>${ res.outDate }</td>
										<td>${fn:length(fn:split(res.dnos, "/"))}마리</td>
										<td><fmt:formatNumber value="${ res.totalprice }" pattern="#,###" />원</td>
										<td id="status${ res.rno }">${ res.status }<br>
											<c:if test="${ res.status eq '취소신청' }">
											<input type="button" value="승인" class="approve-button" onclick="javascript:event.stopPropagation();updateStatus('Y${res.rno}')">
											<input type="button" value="거부" class="deny-button" onclick="javascript:event.stopPropagation();updateStatus('N${res.rno}')">
										</c:if>
										</td>
									</tr>
								</c:forEach>
								</c:if>
								<c:if test="${ empty res }">
									<tr>
										<th colspan="8" rowspan="3"><h1>검색 결과가 없습니다.</h1></th>
									</tr>
									<tr></tr>
									<tr></tr>
								</c:if>
							</table>
							<input type="button" class="btn" value="선택삭제" onclick="deleteRes()">
						</div>
						
						
						<div class="board_page">
							<c:url var="goFirst" value="${ loc }">
								<c:param name="page" value="${ pi.startPage }" />
								<c:param name="keyword" value="${ keyword }" />
								<c:param name="value" value="${ value }" />
							</c:url>

							<a href="${ goFirst }" class="pageBtn frist"><<</a>

							<c:if test="${ pi.currentPage > 1}">
								<c:url var="goBack" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage-1 }" />
									<c:param name="keyword" value="${ keyword }" />
									<c:param name="value" value="${ value }" />
								</c:url>
							</c:if>

							<a href="${ goBack }" class="pageBtn prew"><</a>

							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var="goNum" value="searchRes.ma">
									<c:param name="keyword" value="${ keyword }" />
									<c:param name="page" value="${ p }" />
									<c:param name="value" value="${ value }" />
								</c:url>
								<c:if test="${ pi.currentPage eq  p }">
									<a href="${ goNum }" class="num selected">${ p }</a>
								</c:if>
								<c:if test="${ pi.currentPage ne  p }">
									<a href="${ goNum }" class="num">${ p }</a>
								</c:if>
							</c:forEach>

							<c:if test="${ pi.currentPage <= pi.endPage}">
								<c:url var="goNext" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage+1 }" />
									<c:param name="keyword" value="${ keyword }" />
									<c:param name="value" value="${ value }" />
								</c:url>
							</c:if>

							<a href="${ goNext }" class="pageBtn next">></a>

							<c:url var="goLast" value="${ loc }">
								<c:param name="page" value="${ pi.endPage }" />
								<c:param name="keyword" value="${ keyword }" />
									<c:param name="value" value="${ value }" />
							</c:url>
							<a href="${ goLast }" class="pageBtn last">>></a>
						</div>
					</div>
				</div>
			</div>
		</main>
		<%@ include file="../commons/manager_footer.jsp"%>
</body>
</html>