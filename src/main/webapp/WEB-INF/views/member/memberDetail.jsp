<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/member/memberDetail.css" rel="stylesheet">
</head>
<body>
<form>
	<div class="main">
		<h1>${loginUser.uName}(${loginUser.userId})</h1>
	
		<table>
			<tr>
				<th height="50px">회원 정보</th>
			</tr>
			<tr>
				<th>이름</th>
				<th>${loginUser.uName}</th>
			</tr>		
			<tr>
				<th>아이디</th>
				<th>${loginUser.userId}</th>
			</tr>		
			<tr>
				<th>연락처</th>
				<th>${loginUser.phone}</th>
			</tr>	
			<tr>
				<th>이메일</th>
				<th>${loginUser.email}</th>
			</tr>	
			<tr>
				<th>주소</th>
				<th width="500px">${loginUser.address}</th>
			</tr>	
		</table>
		
		<hr>
		
		<table>	
			<tr>
				<th height="50px">활동 정보</th>
			</tr>
			<tr>
				<th>가입일</th>
				<th colspan="2">${loginUser.joinDate}</th>
			</tr>
			<tr>
				<th>권한</th>
				<th>
					<c:if test="${loginUser.isAdmin == 'N' }">
						회원
					</c:if>
					<c:if test="${loginUser.isAdmin == 'Y' }">
						관리자	
					</c:if>
				</th>
			</tr>
		</table>
	
		<input type="button" onclick="window.close()" value="닫기">
	</div>
</form>
</body>
</html>