<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gothic+A1:wght@600&family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
<link href="resources/css/sohwa/userPage2.css?after" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>

<!-- ================================header==================================== -->
   <jsp:include page="../commons/Nav.jsp"/>

   
   
   
      
<!--=====================================움직이는 로고================================-->
   
   <div id="allDiv">
   
      <div class="test_obj" style="margin-left: 15%;">
         <span>멍</span>
         <span>놀</span>
         <span>먹</span>
         <span>자</span>
         <span>|</span>
         <span>상</span>
         <span>담</span>
         <span>수</span>
         <span>정</span>
         <p style="font-size: 15px;">필수입력란은 모두 적어주시길 바랍니다. <br>
            반려견 정보는 필수 입력란이 아니지만 전화상담의 빠른 진행을 위해 적어주시는게 좋습니다.</p>
      </div>
      
      
      
<!--=====================================말풍선================================-->
      
      
      <div id="counselNotice" style="margin-left: 15%;">
         <div class="balloon">
               <!-- 말풍선 내용을 추가하세요 --> &nbsp;상담 신청 전, 꼭! 확인해주세요 :D
           </div>
           
           <div id="before">
              <br>
            • 1년 이내 5가지 접종(종합, 코로나, 켄넬코프, 신종 인플루엔자, 광견병) 받지 않은 반려견은 입실이 제한됩니다.<br><br>
            ※ 접종기록은 접종병원명이 꼭 필요하므로 증빙 자료는 미리 준비해주세요.<br><br>
            • 1살 미만의 반려견인 경우 항체 검사가 필수 입니다. (단, 1살 이상 시 재접종 기록 확인)<br><br>
            • 생리,건강문제 또는 공격성이 강해 타 고객의 이용에 피해가 되는 반려견 일 경우 입실이 제한됩니다.<br><br>
            • 간단 설명칸은 비워놓으셔도 되지만, 전화상담의 빠른 진행을 위해 상담하실 내용을 간략히 적어놓으시는게 좋습니다.
         </div>
           
      </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      
<!--=====================================구분선(세로)================================-->
      
      <div id="heightLineDiv"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
<!--=====================================상담신청칸================================-->

      
      <div id="requestDiv">
         <div class="sign-in-container">
              
                 <div id="form">
                    <h1 id="h1">상담신청</h1>
                   <br>
                   <div class="radio-group">
                         <label for="preschool">
                             <input type="radio" id="preschool" value="A" name="consultationType" style="width:20px; vertical-align: middle;" th:checked="${r.consultingType == 'A'}"> 유치원 입학상담
                         </label>&nbsp;&nbsp;&nbsp;
                         <label for="hotelRegist">
                             <input type="radio" id="hotelRegist" value="B" name="consultationType" style="vertical-align: middle;" th:checked="${r.consultingType == 'B'}"> 호텔 예약상담
                         </label>
                     </div>
                     <br>
                     <div><div class="orange-dot"></div>&nbsp;&nbsp;보호자 성함&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <input type="text" id="userName" name="userName" placeholder="name" value="${r.userName}">
                    <br>
                     <div><div class="orange-dot"></div>&nbsp;&nbsp;이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <input type="email" id="email" name="email" placeholder="email" value="${r.email }">
                    <br>
                    <div><div class="orange-dot"></div>&nbsp;&nbsp;신청일자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <input type="date" id="requestTime1" name="day" value="${fn:split(r.requestTime,'/')[0]}" required>
                    <input type="time" id="requestTime2" value="${fn:split(r.requestTime,'/')[1]}" name="time">
                 </div>
              
         </div>
         
         
         <div class="overlay-right" style="margin-right:80px;">
            <span style="font-size: 20px;">반려견 정보</span>
            <textarea id="information" name="dogInfo" placeholder="상담받고 싶은 반려견의 내용을 간단히 적어주세요." style="width:300px; height: 350px;">${r.dogInfo}</textarea>
              <button id="signUp" class="overlay_btn" onclick="${contextPath}/updateRequest.do">수정하기</button>
          </div>
        
      </div>
      
      <form method="POST" action="${contextPath }/updateRequest.do" id="realForm2">
         <input type="hidden" name="consultingType" id="type2">
         <input type="hidden" name="userName" id="name2">
         <input type="hidden" name="email" id="email2">
         <input type="hidden" name="day" id="time2">
         <input type="hidden" name="time" id="time3">
         <input type="hidden" name="dogInfo" id="info2">
         <input type="hidden" name="requestNo" value="${r.requestNo }">
      </form>
      
   
   </div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <jsp:include page="../commons/footer.jsp"/>

   <script>
      
      document.getElementById('signUp').addEventListener('click',()=>{
         
         const type = document.getElementsByName('consultationType');
         let consultationType = "A";
         
         for(let i=0; i<type.length; i++){
            if(type[i].checked){
               consultationType = type[i].value;
               
            }
         }
         const userName = document.getElementById('userName').value;
         const phoneNumber = document.getElementById('email').value;
         const day = document.getElementById('requestTime1').value;
         const time = document.getElementById('requestTime2').value;
         const dogInfo = document.getElementById('information').value;
         
         
         
         if(userName != "" && phoneNumber != "" && day != "" && time != ""){
            console.log(consultationType);
            document.getElementById('type2').value=consultationType;
            document.getElementById('name2').value=userName;
            document.getElementById('email2').value=phoneNumber;
            document.getElementById('time2').value=day;
            document.getElementById('time3').value=time;
            document.getElementById('info2').value=dogInfo;
            
            
            if (!/@/.test(phoneNumber)) {
                // '@'가 포함되지 않는 경우에 실행할 코드
                alert('이메일 형식으로 입력해주세요.');
            }else{
               document.getElementById('realForm2').submit();
            }
            
         }else{
            alert('필수항목을 모두 입력해주세요.');
         }
         
         
      })
   
   
   
   
   
   
      document.getElementById('requestTime1').addEventListener('input', function (event) {
           const selectedDate = new Date(event.target.value);
           const today = new Date();
   
           if (selectedDate < today) {
               event.target.value = ''; // 선택된 날짜 초기화
               alert('오늘 이전의 날짜를 선택할 수 없습니다.');
           }
       });
   
      
      
      
      
      
      
      
      
      
      
         
       document.addEventListener("DOMContentLoaded", function() {
           // Spring에서 전달된 값 가져오기
           var selectedValue = '${r.consultingType}';
           
           // 가져온 값에 해당하는 라디오 버튼 선택하기
           var radioButtons = document.querySelectorAll('input[name="consultationType"]');
           radioButtons.forEach(function(radioButton) {
               if (radioButton.value === selectedValue) {
                   radioButton.checked = true;
               }
           });
       });

      
   </script>
   
   

   
   
   



   
   
   <script>
      window.onload()=>{
         
             const consultingType = '${r.consultingType}'; // consultingType 변수에 ${r.consultingType} 값 할당
             if (consultingType === 'A') {
                 // consultingType 값이 A일 때, 유치원 입학상담 라디오 버튼 체크
                 document.getElementById('preschool').checked = true;
             } else if (consultingType === 'B') {
                 // consultingType 값이 B일 때, 호텔 예약상담 라디오 버튼 체크
                 document.getElementById('hotelRegist').checked = true;
             }
             
             
             
             
         
      }
   </script>
   

</body>
</html>