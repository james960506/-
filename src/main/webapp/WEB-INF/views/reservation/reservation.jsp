<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application" />
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="resources/css/reservation/reservation.css" rel="stylesheet">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="resources/js/reservation/reservation.js"></script>
<style>
#minHeight {
	position: relative;
	z-index: -1;
}
</style>
<script>

nowMonth = new Date();
k = 3;
const onload = () => { //처음 달력
	//이번달
	let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);
	let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);
	let year = nowMonth.getFullYear().toString();
	let month = (nowMonth.getMonth() + 1).toString();
	document.getElementById("month").innerHTML = "<span class='title'>" + year + "년 " + month + "월</span>";
	let text = "";
	if (month == 0) {
		year = nextYear - 1;
		month = 12;
	}
	for (let i = 0; i <= firstDate.getDay() - 1; i++) {
		text += "<th></th>";
	}
	for (let i = 1; i <= lastDate.getDate(); i++) {
		if (i < nowMonth.getDate()) {
			text += "<th id='firCalendar" + i + "' class='today'>" + i + "</th>";
		} else if (i >= nowMonth.getDate()) {
			text += "<th id='firCalendar" + i + "' style='cursor:pointer' onclick='selectCalendar(" + year + String(month).padStart(2, "0") + String(i).padStart(2, "0") + "1)'>" + i + "</th>";
		} else {
			text += "<th id='firCalendar" + i + "'>" + i + "</th>";
		}
		if ((i + firstDate.getDay()) % 7 == 0) {
			text += "<tr>"
		}
	}
	document.getElementById("nowMonth").innerHTML += text;

	//다음달
	text = "";
	let nextFirstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 1);
	let nextLastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 2, 0);
	let nextYear = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 2, 1).getFullYear();
	let nextMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 2, 1).getMonth();
	if (nextMonth == 0) {
		nextYear = nextYear - 1;
		nextMonth = 12;
	}
	document.getElementById("nMon").innerHTML = "<span class='title'>" + nextYear + '년 ' + nextMonth + "월</span> <input class='nextBtn' type='button' value='>' onclick='nextMonth()'>";
	for (let i = 0; i <= nextFirstDate.getDay() - 1; i++) {
		text += "<th></th>";
	}
	console.log("다음해"+nextYear);
	console.log("다음달"+nextMonth);
	for (let i = 1; i <= nextLastDate.getDate(); i++) {
		text += "<th id='secCalendar" + i + "' style='cursor:pointer' onclick='selectCalendar(" + nextYear + String(nextMonth).padStart(2, "0") + String(i).padStart(2, "0") + "2)'>" + i + "</th>";
		if ((i + nextFirstDate.getDay()) % 7 == 0) {
			text += "<tr>"
		}
	}
	document.getElementById("nextMonth").innerHTML += text;

}


const nextMonth = () => { // 다음달
	document.getElementById("nowMonth").innerHTML = '<tr><th colspan="7" id="month"></th></tr><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'
	let text = "";
	let nextFirstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 2, 1);
	let nextLastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 1, 0);
	let nextYear = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 1, 1).getFullYear();
	let nextMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 1, 1).getMonth();
	let nMon = document.getElementById("nowMonth");
	if (nextMonth == 0) {
		nextYear = nextYear - 1;
		nextMonth = 12;
	}
	document.getElementById("month").innerHTML = "<input class='preBtn' type='button' value='<' onclick='preMonth()'><span class='title'>" + nextYear + "년 " + nextMonth + "월</span>";
	for (let i = 0; i <= nextFirstDate.getDay() - 1; i++) {
		text += "<th></th>";
	}
	for (let i = 1; i <= nextLastDate.getDate(); i++) {
		text += "<th id='firCalendar" + i + "' style='cursor:pointer' onclick='selectCalendar(" + nextYear + String(nextMonth).padStart(2, "0") + String(i).padStart(2, "0") + "1)'>" + i + "</th>";
		if ((i + nextFirstDate.getDay()) % 7 == 0) {
			text += "<tr>"
		}
	}
	nMon.innerHTML += text;

	text = "";
	nextFirstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 1, 1);
	nextLastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k, 0);
	nextYear = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k, 1).getFullYear();
	nextMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k, 1).getMonth();
	nMon = document.getElementById("nextMonth");
	if (nextMonth == 0) { //12월
		nextYear = nextYear - 1;
		nextMonth = 12;
	}
	nMon.innerHTML = '<tr><th colspan="7" id="nMon"></th></tr><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>';
	if (nextYear == nowMonth.getFullYear() + 1 && nextMonth == 12) {
		document.getElementById("nMon").innerHTML = "<span class='title'>" + nextYear + "년 " + nextMonth + "월</span>";
	} else {
		document.getElementById("nMon").innerHTML = "<span class='title'>" + nextYear + "년 " + nextMonth + "월</span> <input class='nextBtn' type='button' value='>' onclick='nextMonth()'>";
	}
	for (let i = 0; i <= nextFirstDate.getDay() - 1; i++) {
		text += "<th></th>";
	}
	for (let i = 1; i <= nextLastDate.getDate(); i++) {
		text += "<th id='secCalendar" + i + "' style='cursor:pointer' onclick='selectCalendar(" + nextYear + String(nextMonth).padStart(2, "0") + String(i).padStart(2, "0") + "2)'>" + i + "</th>";
		if ((i + nextFirstDate.getDay()) % 7 == 0) {
			text += "<tr>"
		}
	}
	nMon.innerHTML += text;
	k++;
}

const preMonth = () => { //이전 달
	document.getElementById("nowMonth").innerHTML = '<tr><th colspan="7" id="month"></th></tr><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'
	let text = "";
	let nextFirstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 4, 1);
	let nextLastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 3, 0);
	let nextYear = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 3, 1).getFullYear();
	let nextMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 3, 1).getMonth();
	let nMon = document.getElementById("nowMonth");
	if (nextMonth == 0) {
		nextYear = nextYear - 1;
		nextMonth = 12;
	}

	for (let i = 0; i <= nextFirstDate.getDay() - 1; i++) {
		text += "<th></th>";
	}
	for (let i = 1; i <= nextLastDate.getDate(); i++) {
		text += "<th id='firCalendar" + i + "' style='cursor:pointer' onclick='selectCalendar(" + nextYear + String(nextMonth).padStart(2, "0") + String(i).padStart(2, "0") + "1)'>" + i + "</th>";
		if ((i + nextFirstDate.getDay()) % 7 == 0) {
			text += "<tr>"
		}
	}
	nMon.innerHTML += text;
	if (nowMonth.getFullYear() == nextYear && nowMonth.getMonth() == nextMonth - 1) {
		for (let i = 1; i < nowMonth.getDate(); i++) {
			document.getElementById('firCalendar' + i).style.cursor = "default";
			document.getElementById('firCalendar' + i).className = "today";
			document.getElementById('firCalendar' + i).onclick = null;
		}
		document.getElementById("month").innerHTML = "<span class='title'>" + nextYear + "년 " + nextMonth + "월</span>";

	} else {
		document.getElementById("month").innerHTML = "<input class='preBtn' type='button' value='<' onclick='preMonth()'><span class='title'>" + nextYear + "년 " + nextMonth + "월</span>";
	}

	text = "";
	nextFirstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 3, 1);
	nextLastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 2, 0);
	nextYear = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 2, 1).getFullYear();
	nextMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + k - 2, 1).getMonth();
	nMon = document.getElementById("nextMonth");
	if (nextMonth == 0) {
		nextYear = nextYear - 1;
		nextMonth = 12;
	}
	nMon.innerHTML = '<tr><th colspan="7" id="nMon"></th></tr><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>';
	document.getElementById("nMon").innerHTML = "<span class='title'>" + nextYear + "년 " + nextMonth + "월</span> <input class='nextBtn' type='button' value='>' onclick='nextMonth()'>";
	for (let i = 0; i <= nextFirstDate.getDay() - 1; i++) {
		text += "<th></th>";
	}
	for (let i = 1; i <= nextLastDate.getDate(); i++) {
		text += "<th id='secCalendar" + i + "' style='cursor:pointer' onclick='selectCalendar(" + nextYear + String(nextMonth).padStart(2, "0") + String(i).padStart(2, "0") + "2)'>" + i + "</th>";
		if ((i + nextFirstDate.getDay()) % 7 == 0) {
			text += "<tr>"
		}
	}
	nMon.innerHTML += text;
	k--;
}


count = 0; //체크인인지 체크아웃인지
checkIn = 0;//체크인 날짜(일)
checkOut = 0;//체크아웃 날짜(일)
selectedCal = 0;//전에 몇번째 달력이 체크됐는지
firCalLastDay = 0;//마지막 몇일인지
selectedDate = 0;//체크인 날짜(년월일)
state = 0;//달력 변경 여부
checkInDate = "";
checkOutDate = "";
const selectCalendar = (date) => { //달력 선택
	count++;
	if (count == 3) {
		nextMonth();
		preMonth();
		count = 1;
	}
	console.log(date);
	const year = Number(date.toString().substr(0, 4));
	const month = Number(date.toString().substr(4, 2));
	const day = Number(date.toString().substr(6, 2));
	const selCal = date.toString().substr(8, 1);
	let selFirCal = document.getElementById('firCalendar' + day);
	let selSecCal = document.getElementById('secCalendar' + day);
	const lastDate = new Date(year, month, 0); //마지막 일

	//예외처리
	if (count == 2 && Number(date.toString().substr(0, 8)) <= Number(selectedDate)) {
		checkIn = day;
		selectedCal = selCal;
		nextMonth();
		preMonth();
		if (selectedCal == 1) {
			selFirCal = document.getElementById('firCalendar' + checkIn);
			selFirCal.style.background = "#ed741a";
			selFirCal.style.boxSizing = "border-box";
			selFirCal.style.borderRadius = "50%";
			selFirCal.style.color = "white";
		} else {
			selSecCal = document.getElementById('secCalendar' + checkIn);
			selSecCal.style.background = "#ed741a";
			selSecCal.style.boxSizing = "border-box";
			selSecCal.style.borderRadius = "50%";
			selSecCal.style.color = "white";
		}
		checkOut = 0;
		count = 1;
	}

	//작동
	if (count == 1) {
		checkInDate = date.toString().substr(0, 4) + "-" + date.toString().substr(4, 2) + "-" + date.toString().substr(6, 2);
		selectedDate = date.toString().substr(0, 8);
		state = k;
		document.getElementById("checkInDate").innerText = year + "년 " + month + "월 " + day + "일";
		document.getElementById("checkInResult").innerText = year + "년 " + month + "월 " + day + "일";
		document.getElementById("checkInDate").style.color = "black";
		document.getElementById("checkInDate").style.fontWeight = "bold";
		document.getElementById("checkOutDate").innerText = "날짜선택";
	} else if (count == 2) {
		checkOutDate = date.toString().substr(0, 4) + "-" + date.toString().substr(4, 2) + "-" + date.toString().substr(6, 2);
		document.getElementById("checkOutDate").innerText = year + "년 " + month + "월 " + day + "일";
		document.getElementById("checkOutResult").innerText = year + "년 " + month + "월 " + day + "일";
		document.getElementById("checkOutDate").style.color = "black";
		document.getElementById("checkOutDate").style.fontWeight = "bold";
	}

	if (selCal == 1) { // 1번달력
		if (count == 1) {
			checkIn = day;
			for (let i = 1; i < day; i++) {
				document.getElementById('firCalendar' + i).className = "today";
			}
		} else {
			checkOut = day;

			if (state != k) {
				for (let i = 1; i <= checkOut; i++) {
					document.getElementById('firCalendar' + i).className = "between";
				}
			} else {
				for (let i = checkIn; i <= checkOut; i++) {
					document.getElementById('firCalendar' + i).className = "between";
				}
			}
		}
		selFirCal.style.background = "#ed741a";
		selFirCal.style.boxSizing = "border-box";
		selFirCal.style.borderRadius = "50%";
		selFirCal.style.color = "white";
		firCalLastDay = lastDate.getDate();
		selectedCal = 1;
	} else { // 2번달력
		firCalLastDay = new Date(year, month - 1, 0).getDate();
		if (count == 1) {
			checkIn = day;
			for (let i = 1; i <= firCalLastDay; i++) {
				document.getElementById('firCalendar' + i).className = "today";
			}
			for (let i = 1; i < day; i++) {
				document.getElementById('secCalendar' + i).className = "today";
			}
		} else {
			checkOut = day;
			if (state != k) {
				for (let i = 1; i <= firCalLastDay; i++) {
					document.getElementById('firCalendar' + i).className = "between";
				}
				for (let i = 1; i <= checkOut; i++) {
					document.getElementById('secCalendar' + i).className = "between";
				}
			} else {
				if (selectedCal == 1) {
					for (let i = checkIn; i <= firCalLastDay; i++) {
						document.getElementById('firCalendar' + i).className = "between";
					}
					for (let i = 1; i <= checkOut; i++) {
						document.getElementById('secCalendar' + i).className = "between";
					}
				} else {
					for (let i = checkIn; i <= checkOut; i++) {
						document.getElementById('secCalendar' + i).className = "between";
					}
				}
			}
		}
		selSecCal.style.background = "#ed741a";
		selSecCal.style.boxSizing = "border-box";
		selSecCal.style.borderRadius = "50%";
		selSecCal.style.color = "white";
		selectedCal = 2;
	}
}


const showCalendar = () => { //달력 초기화
	k = 3;
	count = 0;
	document.getElementsByClassName("sizeCbox")[0].style.display = 'none';
	document.getElementById("nowMonth").innerHTML = '<tr><th colspan="7" id="month"></th></tr><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'
	document.getElementById("nextMonth").innerHTML = '<tr><th colspan="7" id="nMon"></th></tr><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'
	$('.calendar').toggle();
	onload();
}

const showSizeOption = () => { //반려견 수 div 클릭
	let check = "${dList}";
	let checkLogin = "${loginUser}";
	if(checkLogin == ""){
		alert("로그인 후 이용해주세요.");
		document.getElementsByClassName("calendar")[0].style.display = 'none';
		return;
	}
	if(check.trim() == "[]"){
		alert("반려견 등록 후 이용바랍니다.");
		document.getElementsByClassName("calendar")[0].style.display = 'none';
	}else{
		$('.sizeCbox').toggle();
	}
}


	function getDatesStartToLast(startDate, lastDate) {			
		let result = [];									  // result : 체크인 날짜와 체크아웃 날짜 사이의 모든 날짜가 들어갈 배열
		let curDate = new Date(startDate);					 
		while (curDate < new Date(lastDate)) {				  // startDate에서 마지막 날짜인 lastDate까지 반복 실행
			result.push(curDate.toISOString().split("T")[0]); // 날짜를 ISO 문자열로 변환 후 "T"를 기준으로 나눠 날짜 부분만 추출하여 result배열에 추가
			curDate.setDate(curDate.getDate() + 1);			  // curDate에 하루를 더함
		}
		return result;										 
	}


	sTLLength = 0;
	const searchBtn = () => { //검색버튼 클릭
		//초기화
		cboxResult = [];
		$("input[type=checkbox]").prop("checked", false);
		document.getElementById("totalPrice").innerText="0원";
		document.getElementById("dogSize").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소형견 <span>0</span> 중형견 <span>0</span> 대형견 <span>0</span> 초대형견 <span>0</span></span>"
		$('.sizeCbox').hide();
		
		const checkIn = document.getElementById("checkInDate").innerText;
		const checkOut = document.getElementById("checkOutDate").innerText;
		if (checkIn == "날짜선택" || checkOut == "날짜선택") {
			alert("날짜를 선택해주세요.");
			return;
		}
		document.getElementById("checkSearch").value = "true";
		$('.calendar').hide();
		let startToLast = getDatesStartToLast(checkInDate, checkOutDate);
		sTLLength = startToLast.length;
		
		$.ajax({  // getDatesStartToLast 함수에서 return 받은 결과값을 변수 'startToLast'에 담아 checkCount.re로 전송하는 함수
			url:"checkCount.re",
			type:"post",
			data:{'startToLast' : startToLast},
			success: (data) =>{
				document.getElementById("count").innerText = data;
			},
			error: (data) =>{
				console.log("에러 "+data);
			}
		});
	}
	
	//체크박스 선택
	cboxResult = [];
	totalPrice = 0;
	dnos = [];
	$(()=>{
		$(".dogSizeCbox").change(function() {
			const checkVal = $(this).val();
			const sizeSpan = document.getElementById("dogSize").children;
			const possible = document.getElementsByClassName("content")[0].children[0].children;
			const checkInDate = document.getElementById("checkInDate").innerText;
			const checkOutDate = document.getElementById("checkOutDate").innerText;
			let dno = $(this).next().next().val();
			
			if ($(this).is(":checked") == true) {
				dnos.push(dno);
				cboxResult.push($(this).val());
				if(	document.getElementById("checkSearch").value == "false"){
					alert("날짜를 검색해 주세요");
					$(this).prop("checked", false);
					cboxResult.pop();
					return false;
				}
				else if (possible[0].innerHTML == 0) {
					alert("남은 객실 수가 없습니다.");
					$(this).prop("checked", false);
					cboxResult.pop();
					return false;
				}
				
				possible[0].innerHTML = (Number(possible[0].innerHTML) - 1);
				switch (checkVal) {
					case "소형견":
						sizeSpan[0].innerHTML = (Number(sizeSpan[0].innerHTML)) + 1;
						break;
					case "중형견":
						sizeSpan[1].innerHTML = (Number(sizeSpan[1].innerHTML)) + 1;
						break;
					case "대형견":
						sizeSpan[2].innerHTML = (Number(sizeSpan[2].innerHTML)) + 1;
						break;
					case "초대형견":
						sizeSpan[3].innerHTML = (Number(sizeSpan[3].innerHTML)) + 1;
						break;
				}
				
			} else if ($(this).is(":checked") == false) {
				
				for(let i=0; i<cboxResult.length; i++){
					if(cboxResult[i] == $(this).val()){
						cboxResult.splice(i, 1);
						break;
					}
				}
				
				for(let i=0; i<dnos.length; i++){
					if(dnos[i] == $(this).next().next().val()){
						dnos.splice(i, 1);
						break;
					}
				}
				possible[0].innerHTML = (Number(possible[0].innerHTML) + 1);
				switch (checkVal) {
					case "소형견":
						sizeSpan[0].innerHTML = (Number(sizeSpan[0].innerHTML)) - 1;
						break;
					case "중형견":
						sizeSpan[1].innerHTML = (Number(sizeSpan[1].innerHTML)) - 1;
						break;
					case "대형견":
						sizeSpan[2].innerHTML = (Number(sizeSpan[2].innerHTML)) - 1;
						break;
					case "초대형견":
						sizeSpan[3].innerHTML = (Number(sizeSpan[3].innerHTML)) - 1;
						break;
				}
			}
			$.ajax({
				url:"${ pageContext.servletContext.contextPath }/selectCost.re",
				type:"post",
				data:{'cboxValue' :cboxResult},
				success: (data) =>{
					totalPrice = sTLLength*data; 
					document.getElementById("totalPrice").innerHTML = totalPrice.toLocaleString('ko-KR')+"원";
				},
				error: (data) =>{
					console.log("에러 "+data);
				}
			});
		});
	});
	
	const userCode = "imp00263400";
	IMP.init(userCode);

	const requestPay = () =>{
		let check = "${dList}";
		let checkLogin = "${loginUser}";
		if(checkLogin == ""){
			alert("로그인 후 이용해주세요.");
			document.getElementsByClassName("calendar")[0].style.display = 'none';
			return;
		}
		if(check.trim() == "[]"){
			alert("반려견 등록 후 이용바랍니다.");
			return;
		}else if(document.getElementById("count").innerText == "0"){
			alert("반려견을 선택해 주세요.");
			return;
		}else{
			const orderNo= nowMonth.getFullYear() + String(nowMonth.getMonth()).padStart(2, "0") + String(nowMonth.getDate()+1).padStart(2, "0")+(Number(${rno})+1);
			console.log(checkInDate+", "+checkOutDate+", "+totalPrice+", "+"${ loginUser.userId }"+", "+document.getElementById("etc").value);
			let etc = document.getElementById("etc").value;
			let strDnos = "";
			for(let i=0; i<dnos.length; i++){
				if(i==dnos.length-1){
					strDnos += dnos[i];
				}else{
					strDnos += dnos[i]+"/";
				}
			}
			
			//location.href="selectRes.re?inDate="+checkInDate+"&outDate="+checkOutDate+"&totalprice="+totalPrice+"&userId="+"${ loginUser.userId }"+"&etc="+etc+"&dnos="+strDnos+"&sTLLength="+sTLLength;
			IMP.request_pay({
			    pg: "html5_inicis",
			    pay_method: "card",
			    merchant_uid: orderNo,
	 		    //merchant_uid: "fdgdfg344234",
	 		    name: "멍놀먹자",
	 		    amount: totalPrice,
	 		    //amount: 10000,
	 		    buyer_name: "${ loginUser.userId }",
	 		    buyer_tel: "${phone}",
	 		}, function (rsp){
	 			if(rsp.success){
	 				location.href="selectRes.re?inDate="+checkInDate+"&outDate="+checkOutDate+"&totalprice="+totalPrice+"&userId="+"${ loginUser.userId }"+"&etc="+etc+"&dnos="+strDnos+"&sTLLength="+sTLLength;
	 			}
	 		});  
		}
	}
	</script>
</head>
<body onload="onload()">
	<jsp:include page="../commons/Nav2.jsp" />
	<div class="main_content">
		<img src="resources/image/reservationtop.png">
		<h1>호텔 예약 안내</h1>
		<hr>
		<div class="sideleft">
			<h2>애견호텔이란</h2>
			<br>
			<p>
				&nbsp;여행, 출장, 명절 등으로 장 단기간 주인과 떨어져 생활해야 할 때 보호 및 관리, 바쁜 일상 생활로 애견의 운동이나<br> 산책이 필요할 때 기타 가정에서 여러가지 사정으로 인해 호텔 이용이 꼭 필요한 경우
			</p>
			<br> <img src="resources/image/resTable.png">
		</div>
		<hr>
		<h1 class="reserve">객실 확인</h1>
		<hr>
		<div class="calendar">
			<table id="nowMonth">
				<tr>
					<th colspan="7" id="month"></th>
				</tr>
			</table>
			<table id="nextMonth">
				<tr>
					<th colspan="7" id="nMon"></th>
				</tr>
			</table>
			<div class="com">
				<input type="button" value="완료" onclick="showCalendar()">
			</div>
		</div>

		<div class="search">
			<div class="checkIn" onclick="showCalendar()">
				<h3>체크인</h3>
				<span id="checkInDate">날짜선택</span>
			</div>

			<div class="checkOut" onclick="showCalendar()">
				<h3>체크아웃</h3>
				<span id="checkOutDate">날짜선택</span>
			</div>
			<input type="hidden" name="startToLast" value=""> <input type="button" value="검색" onclick="searchBtn()"> <input type="hidden" id="checkSearch" value="false">
		</div>


		<div class="content">
			<h2>
				남은 객실수 <span id="count">0</span>개
			</h2>
			<div class="selectSize" onclick="showSizeOption()">
				<h3>반려견 수</h3>
				<span id="dogSize">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소형견 <span>0</span> 중형견 <span>0</span> 대형견 <span>0</span> 초대형견 <span>0</span></span>
				<div class="sizeCbox" onclick="javascript:event.stopPropagation()">
					<ul class="ks-cboxtags">
						<c:forEach items="${ dList }" var="d">
							<li><input type="checkbox" class="dogSizeCbox" id="checkbox${ d.dno }" value="${ d.dogSize }"> <label for="checkbox${ d.dno }">${ d.dogName } (${ d.breed })</label>
							<input type="hidden" value="${ d.dno }"></li>
						</c:forEach>
						<li><input type="button" value="완료" onclick="showSizeOption()"></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="etc">
			<h2>반려견 특이사항 및 요청사항</h2>
			<textarea id="etc" cols="54" rows="10"></textarea>
		</div>
	</div>
	<div class="side">
		<table>
			<tr>
				<th>
					<h2>결제 정보</h2>
				</th>
			</tr>
			<tr>
				<td>체크인 날짜</td>
			</tr>
			<tr>
				<td id="checkInResult">날짜선택</td>
			</tr>
			<tr></tr>
			<tr>
				<td>체크아웃</td>
			</tr>
			<tr>
				<td id="checkOutResult">날짜선택</td>
			</tr>
			<tr></tr>
			<tr>
				<td>금액</td>
			</tr>
			<tr>
				<td id="totalPrice">0원</td>
			</tr>
			<tr></tr>
			<tr>
				<th><input type="button" value="결제하기" onclick="requestPay()"></th>
			</tr>
		</table>
	</div>
	<%@ include file="../commons/footer2.jsp"%>
</body>
</html>