 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료</title>
<style>
.main_content {
	width: 65%;
	height: 30%;
	margin: auto;
	margin-top: 100px;
}
hr{
	margin-top: 30px;
	margin-bottom: 20px;
}
.table table{
	width: 100%;
	border-collapse: collapse;
}
.table tr{
	height: 55px;
	border-bottom: 1px solid black;
}
.table tr:last-child {
	line-height:120px;
	border: none;
}
.table tr td:first-child{
	text-align: left;
	font-weight: bold;
}
.table tr td:last-child{
	text-align: right ;
}
.table input[type=button]{
	width: 180px;
	height: 40px;
}
</style>
</head>
<body>
<jsp:include page="../commons/Nav2.jsp"/>
<div class="main_content">
		<h1>
			${ loginUser.uName }님<br> 결제가 완료되었습니다.
		</h1>
		<hr>
		<div class="table">
			<table>
				<tr>
					<td>숙박일수 및 반려견 수</td>
					<td>${res.dnos}마리 ${ length }박</td>
				</tr>
				<tr>
					<td>체크인</td>
					<td>${ inDate }</td>
				</tr>
				<tr>
					<td>체크아웃</td>
					<td>${ outDate }</td>
				</tr>
				<tr>
					<td><h2>결제금액</h2></td>
					<td><h2><fmt:formatNumber value="${ res.totalprice }" pattern="#,###" />원</h2></td>
				</tr>
				<tr>
					<th colspan="2"><input type="button" value="홈으로 이동" onclick="location.href='home'"></th>
				</tr>
			</table>
		</div>
	</div>
<%@ include file="../commons/footer2.jsp"%>A
</body>
</html>