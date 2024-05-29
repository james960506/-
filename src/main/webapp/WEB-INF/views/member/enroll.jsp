<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="path" value="${ pageContext.request.contextPath }" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="${path}/resources/css/member/enroll.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form class="form" action="insertMember.me" method="POST" onsubmit="return checkForm();">
		<div class="logo">
			<img src="resources/image/logo.png">
		</div>
  		<div class="title"><label>회원가입</label></div>

 		<table class="table">
		    <tr><td><input type="text" placeholder="아이디" id="userId" name="userId" autofocus></td></tr> 
			<tr><td><input type="password" id="pwd" placeholder="비밀번호" name="pwd"></td></tr> 
			<tr><td><input type="password" id="pwd2" placeholder="비밀번호 확인"  onblur="focusOut();"></td></tr>
			<tr><td><input type="text" placeholder="이름" id="uName" name="uName"></td></tr> 
			<tr><td><input type="tel" placeholder="전화번호(-제외)" id="phone" name="phone"></td></tr>
			<tr><td><input type="text" id="email" placeholder="이메일" name="email"></td></tr>
			<tr>
				<td><input type="text" id="sample6_postcode" placeholder="주소검색" name="sample6_postcode">
				<input type="button" id="sample6" onclick="sample6_execDaumPostcode()" value="주소검색"></td>
			</tr>
			<tr><td><input type="text" id="sample6_address" placeholder="기본주소" name="sample6_address"></td></tr>
			<tr><td><input type="text" id="sample6_detailAddress" placeholder="상세주소" name="sample6_detailAddress"></td></tr>
			<tr><td><input type="text" id="sample6_extraAddress" placeholder="참고항목" name="sample6_extraAddress"> </td></tr>
			<tr><td><input type="date" id="birth" placeholder="생년월일" name="birth"></td></tr>
			<tr><td><button type="button" onclick="openChild()" id="popup_button">반려견 정보 추가</button></td></tr>
			<tr height="10px;"><td></td></tr>
			<tr><td><button id="submit-btn" type="submit">회원가입</button></td></tr>
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
			openWin = window.open("child.me", "popup", "width=600, height=450");
		}
	</script>

	<!-- 아이디 중복체크 / 정규식 -->
	<script>
		window.onload = () =>{
			document.getElementById('userId').addEventListener('change', function(){
				const idResult = document.getElementById('idCheckResult');		// 아이디 확인
				let idval = $('#userId').val();
		        let idvalcheck = /^[a-z0-9]+$/;
				if(this.value.trim() == ''){
					alert('아이디는 영소문자,숫자로 구성된 6글자 이상으로 조합하시오.');
    				userId.style.borderColor = 'red';
		            $('#userId').focus();
				}else if(!idvalcheck.test(idval) || idval.length<6){
					alert('아이디는 영소문자,숫자로 구성된 6글자 이상으로 조합하시오.');
    				userId.style.borderColor = 'red';
   
				} else {
			    	$.ajax({
			    		url: 'checkId.me',
			    		data: {userId:this.value.trim()},
			    		success: (data) =>{
			    			console.log(data);
			    			if(data == 'yes'){
			    				userId.style.borderColor = 'green';
			    				checkId = true;
			    			} else {
			    				userId.style.borderColor = 'red';
			    				checkId = false;
			    			}
			    		},
			    		error: data => console.log(data)
			    	})   
				}
			});
		}
	</script>
	
	<script>
		<!-- 비밀번호 확인 + 정규식 -->
	 	checkId = false;
	 	checkPwd = false;
		function focusOut(){
			
			let pwd = document.getElementById("pwd");
	        let pwd2 = document.getElementById("pwd2");
	        let pwdcheck = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#%^&*])[A-Za-z\d!@#%^&*]{8,}$/;
	        
			if(pwd2.value.trim() == ''){	
			
			} else if(pwd2.value != pwd.value || !pwdcheck.test(pwd.value)) {	
				pwd.style.borderColor = 'red';
				pwd2.style.borderColor = 'red';
				console.log(pwd.value);
				console.log(pwd2.value);
				alert('비밀번호는 영대소문자,숫자, 특수문자로 구성된 8글자 이상으로 조합하시오.')
				checkPwd = false;
			} else if(pwd2.value == pwd.value && pwdcheck.test(pwd.value)){					
				pwd.style.borderColor = 'green';
				pwd2.style.borderColor = 'green';
				console.log(pwd.value);
				console.log(pwd2.value);
				checkPwd = true;
			} 
		}
		<!-- 회원가입 버튼 클릭 시 아이디 비밀번호 체크 후 넘어감 -->
		const checkForm = ()=>{
			console.log(checkId);
			console.log(checkPwd);
			if(checkId == true && checkPwd == true){
				return true;
			} else {
				return false;
			}
		}
	</script> 
 
	
	
</body>
</html>