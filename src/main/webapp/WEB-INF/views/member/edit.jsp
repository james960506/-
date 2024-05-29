<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="${path}/resources/css/member/edit.css" rel="stylesheet" type="text/css">
</head>
<body class="bg-light">
<form class="form" action="updateMember.me" method="POST">
	    <div class="title">회원 정보 수정</div>
 		<table class="table">
		    <tr><td><input type="text" placeholder="아이디" id="userId" name="userId" value="${ loginUser.userId }" readonly required></td></tr> 
			<tr><td><input type="text" placeholder="이름" name="uName" id="uName" value="${ loginUser.uName }" required></td></tr> 
			<tr><td><input type="tel" placeholder="전화번호(-제외)" id="phone" name="phone" value="${ loginUser.phone }" required></td></tr>
			<tr><td><input type="email" id="email" placeholder="이메일" name="email" value="${ loginUser.email }" required></td></tr>
			<tr>
				<td>
			      	<c:set var="sample6_postcode" value="${ fn:split(loginUser.address, '@')[0] }"/>
			      	<input type="text" id="sample6_postcode" name="sample6_postcode" value="${ sample6_postcode }" required>
			      	<input type="button" id="sample6" onclick="sample6_execDaumPostcode()" value="주소검색">
			    </td>
			</tr>
			<tr>
				<td>
	 		      	<c:set var="sample6_address" value="${ fn:split(loginUser.address, '@')[1] }"/>
			      	<input type="text" id="sample6_address" name="sample6_address" value="${ sample6_address }" required>
			    </td>
			</tr>
			<tr>
				<td>
			    	<c:set var="sample6_detailAddress" value="${ fn:split(loginUser.address, '@')[2] }"/>
			      	<input type="text" id="sample6_detailAddress" name="sample6_detailAddress" value="${ sample6_detailAddress }" required>
			    </td>
			</tr>
			<tr>
				<td>
			     	<c:set var="sample6_extraAddress" value="${ fn:split(loginUser.address, '@')[3] }"/>
			      	<input type="text" id="sample6_extraAddress" name="sample6_extraAddress" value="${ sample6_extraAddress }" required>
			    </td>
			</tr>
			<tr><td><input type="date" id="birth" placeholder="생년월일" name="birth" value="${loginUser.birth }" required></td></tr>
			<tr><td><button type="button" onclick="openChild()" id="popup_button" value="반려견 정보 추가">반려견 정보 추가</button></td></tr>
			
			<tr><td><button type="submit" id="submit-btn">수정 완료</button></td></tr>
			
			<tr><td><button type="button" id="changePwd">비밀번호 변경</button></td></tr>						
			<tr><td><button type="button" id="deleteBtn" onclick="delete();">회원탈퇴</button></td></tr>						
  		</table>
	</form>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    } 
	</script>

	<script type="text/javascript">
		var openWin;
		function openChild(){
			openWin = window.open("child.me", "popup", "width=570, height=350");
		}
	</script>	
	
	<script>
		document.getElementById("deleteBtn").addEventListener('click',function(){
	    	if(confirm('정말로 탈퇴 하시겠습니까?')){
	        	location.href = 'deleteMember.me';
	         }
	     });
		document.getElementById('changePwd').addEventListener('click', function() {
			location.href='selectfindPwd.me?userId=' + "${loginUser.userId}" + "&email=" + "${ loginUser.email }";
		});
		
	</script>
</body>
</html>