<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="resources/css/sohwa/userPage3.css?after" rel="stylesheet">
<link href="resources/css/sohwa/adminList.css?after" rel="stylesheet" />
<style>
	a{
		text-decoration: none !important;
	}
</style>
</head>
<body>

   <jsp:include page="../commons/Nav.jsp"/>
   <!-- ================================header==================================== -->
   
<!--    <div id="main"> -->
<!--       <nav> -->
<!--          <div id="logo"> -->
<%--             <a href="${contextPath }/home"> --%>
<!--                <img src="resources/image/logo.png" -->
<!--                   width="130px" height="150px" aria-posinset="center"> -->
<!--                   <span>멍놀먹자 유치원</span> -->
<!--             </a> -->
<!--          </div> -->
<!--             <div id="horizontal-underline"></div> -->
<!--                <div class="test"> -->
<!--                   <a href="map.bo" style="font-weight:bold;">유치원소개</a> -->
<!--                   <a href="BoardList.bo">커뮤니티</a> -->
<!--                   <a href="#">유치원 이용료</a> -->
<!--                   <a href="insertRes.re">예약하기</a> -->
<!--                </div> -->
<%--                   <c:if test="${loginUser.isAdmin == 'Y'}"><!-- 이거는 추후 수정해야함! --> --%>
<!--                      <li id="manager"><a href="#">관리자페이지</a></li> -->
<%--                   </c:if> --%>
<!--          <li id="login"><a href="loginView.me">로그인</a></li> -->
<!--       </nav> -->
<%--       <script src="${path}/resources/js/commons/nav.js"></script> --%>
<!--    </div> -->
   
   <!-- ============================================================================ -->
   
   <jsp:include page="../commons/side.jsp"/>
   
   
   
   
   
   <div id="wrappedDiv" style="padding-left:100px;">
   
   
      <div class="myRequest" style="padding-left:200px;">
         <span>멍</span>
         <span>놀</span>
         <span>먹</span>
         <span>자</span>
         <span>|</span>
         <span>내</span>
         <span>&nbsp;</span>
         <span>상</span>
         <span>담</span>
         <span>내</span>
         <span>역</span>
         <p style="font-size:15px; font-weight:bold; color:gray; padding-bottom:0px; margin-bottom:0px;">상담신청했었던 상세정보를 확인하실 수 있습니다.</p>
                             <p style="font-size:15px; font-weight:bold;"> *신청의 승인상태는 신청 시 기재했던 이메일로 확인 가능합니다.</p>
      </div>
      
      
      
      
                      
                  
      <c:if test="${empty list }">
            <div style="border:1px dashed gray; width:70%; height:400px; padding:150px; margin-left:15%;">
               <h1 style="margin-left:20%;">상담신청한 내역이 존재하지 않습니다.</h1>
               <button style="margin-left:20%;" class="btn btn-warning" onclick="location.href='${ contextPath }/counselRequest.do'">상담신청하러 가기</button>
            </div>
            
      </c:if>                
                      
   
      
      <div id="myHistory" style="padding-left:330px; color:black;">
         <c:if test="${ !empty list }">
            <c:forEach items="${list }" var="l">
               <article class="card" style="color:white; background-color: rgb(255, 243, 157); display:inline-block; height:400px;">
                   <div class="temporary_text" style="color:gray; background-color: rgb(255, 243, 157);">
                       ${l.userName }<h3 style="font-size:20px; color:darkgray;">님의 <br>상담내역<br></h3>
                       <span class="card_title" style="font-size:15px;">${l.requestDay }에 신청한 상담내역</span>
                   </div>
                  <div class="card_content" style="color:black; background-color: white;">
                      <input type="hidden" name="requestNo" value="${l.requestNo }">
                          <span class="card_subtitle"><b>상담유형:</b>${ l.consultingType == 'A' ? '유치원 입학 상담' : '호텔 예약 상담' }</span>
                       <p class="card_description"><b>신청 이메일 : </b>${l.email }<br>
                                            <b>신청 일자 : </b>${l.requestTime }<br>
                                            <div style="width:200px; height:80px; overflow: scroll;"><b>반려견 정보 : </b>${l.dogInfo }</div>
                                            <c:if test="${l.adminStatus eq 'Q' }">
                                               <div style="text-align:center;">
                                                  <button type="button" class="btn btn-outline-warning cancelRequest" data-requestNo="${l.requestNo}" style="width:70px; height:30px; font-size:10px;">신청 취소</button>
                                                  <button class="btn btn-warning updateRequest" data-requestNo="${l.requestNo}" style="width:70px; height:30px; font-size:10px;">신청 수정</button></p>
                                               </div>
                                            </c:if>
                                            
                                      
             
                  </div>
               </article>
            </c:forEach>
         </c:if>
      </div>
      
      <div class="board_page">
               <c:url var="goFirst" value="${ loc }">
                  <c:param name="page" value="${ pi.startPage }" />
               </c:url>
   
               <a href="${ goFirst }" class="pageBtn frist" style="text-decoration:none;"><<</a>
   
               <c:if test="${ pi.currentPage > 1}">
                  <c:url var="goBack" value="${ loc }">
                     <c:param name="page" value="${ pi.currentPage-1 }" />
                  </c:url>
               </c:if>
   
               <a href="${ goBack }" class="pageBtn prew" style="text-decoration:none;"><</a>
   
               <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                  <c:url var="goNum" value="${ loc }">
                     <c:param name="page" value="${ p }" />
                  </c:url>
                  <c:if test="${ pi.currentPage eq  p }">
                     <a href="${ goNum }" class="num selected" style="text-decoration:none;">${ p }</a>
                  </c:if>
                  <c:if test="${ pi.currentPage ne  p }">
                     <a href="${ goNum }" class="num" style="color:black;" style="text-decoration:none;">${ p }</a>
                  </c:if>
               </c:forEach>
   
               <c:if test="${ pi.currentPage <= endPage}">
                  <c:url var="goNext" value="${ loc }">
                     <c:param name="page" value="${ pi.currentPage+1 }" />
                  </c:url>
               </c:if>
   
               <a href="${ goNext }" class="pageBtn next" style="text-decoration:none;">></a>
   
               <c:url var="goLast" value="${ loc }">
                  <c:param name="page" value="${ pi.endPage }" />
               </c:url>
               <a href="${ goLast }" class="pageBtn last" style="text-decoration:none;">>></a>
            </div>

      </div>
      
      
      
      
      
   </div>
   
   <br><br><br>
   
   
   
   
   
   
   
   
   <!-- ==========================footer======================================= -->


<!--    <footer> -->
<!--       <br> -->
<!--          <div id="bottomMenu"> -->
<!--             <ul> -->
<!--                <li><a href="#">오시는길</a></li> -->
<!--                <li><a href="#">상담신청</a></li> -->
<!--             </ul> -->
<!--          </div> -->
<!--          <div id="company"><br> -->
<!--             <p>   &nbsp;&nbsp;&nbsp;상호 : 멍놀먹자 유치원 -->
<!--                사업자등록번호 : 012-34-56789</p><br> -->
<!--             <p> &nbsp;&nbsp;&nbsp;주소:서울특별시 중구 남대문로 120 대일빌딩 2층, 3층 -->
<!--                전화:02-1544-9970 -->
<!--             </p> -->
<!--             <br> -->
            
<!--          </div> -->
<!--       </footer> -->
   
   
   <jsp:include page="../commons/footer.jsp"/>
   
   
   
   
   
   
<!-- <!--    <script> --> 
<!-- //       window.onload()=>{ -->
<!-- //          document.getElementById('cancelRequest').addEventListener('click',()=>{ -->
<!-- //             const hiddenInput = document.querySelector('input[type="hidden"]'); -->
<!-- //             const hiddenValue = hiddenInput.value; -->
<!-- //             const form = document.createElement('form'); -->
<!-- //             form.method = 'POST'; -->
<%-- //             location.href = '${contextPath}/userDeleteRequest.do' --%>
            
<!-- //             const input = document.createElement('input'); -->
<!-- //             input.type = 'hidden'; -->
<!-- //             input.name = 'hiddenValue'; -->
<!-- //             input.value = hiddenValue; -->
            
<!-- //             form.appendChild(input); -->
<!-- //             document.body.appendChild(form); -->
            
<!-- //             form.submit(); -->
<!-- //          }) -->
<!-- //       } -->
<!-- <!--    </script> --> 
   
   
         <script>
            window.onload=()=>{
               
                const cancelButtons = document.querySelectorAll('.cancelRequest');
                const updateButtons = document.querySelectorAll('.updateRequest');
                cancelButtons.forEach(cancelBtn => {
                       cancelBtn.addEventListener('click', function() {
                           const requestNo = this.getAttribute('data-requestNo');
                           if (confirm('이 상담신청을 정말 취소하시겠습니까?')) {
                               const form = document.createElement('form');
                               form.method = 'POST';
                               form.action = 'userDeleteRequest.do';

                               const input = document.createElement('input');
                               input.type = 'hidden';
                               input.name = 'requestNo';
                               input.value = requestNo;

                               form.appendChild(input);
                               document.body.appendChild(form);
                               form.submit();
                               console.log(requestNo);
                           } else {
                               console.log('상담신청 취소');
                           }
                       });
                   });

                   updateButtons.forEach(updateBtn => {
                       updateBtn.addEventListener('click', function() {
                           const requestNo = this.getAttribute('data-requestNo');
                           const form = document.createElement('form');
                           form.method = 'POST';
                           form.action = 'userUpdateRequest.do';

                           const input = document.createElement('input');
                           input.type = 'hidden';
                           input.name = 'requestNo';
                           input.value = requestNo;

                           form.appendChild(input);
                           document.body.appendChild(form);
                           form.submit();
                       });
                   });
               
//                //신청취소
//                document.getElementById('cancelRequest').addEventListener('click', ()=>{
//                   if(confirm('이 상담신청을 정말 취소하시겠습니까?')){
//                      const hiddenInput = document.querySelector('input[type="hidden"]');
//                      const hiddenValue = hiddenInput.value;
//                      console.log(hiddenValue);
                     
//                      const form = document.createElement('form');
//                      form.method = 'POST';
//                      form.action = 'userDeleteRequest.do';
                     
//                      const input = document.createElement('input');
//                      input.type = 'hidden';
//                      input.name = 'requestNo';
//                      input.value = hiddenValue;
                     
//                      form.append(input);
//                      document.body.appendChild(form)
//                      form.submit();
//                   }else{
//                      console.log('상담신청 취소');
//                   }
                  
//                })
               
//                document.getElementById('updateRequest').addEventListener('click', ()=>{
                  
//                      const hiddenInput = document.querySelector('input[type="hidden"]');
//                      const hiddenValue = hiddenInput.value;
//                      console.log(hiddenValue);
                     
//                      const form = document.createElement('form');
//                      form.method = 'POST';
//                      form.action = 'userUpdateRequest.do';
                     
//                      const input = document.createElement('input');
//                      input.type = 'hidden';
//                      input.name = 'requestNo';
//                      input.value = hiddenValue;
                     
//                      form.append(input);
//                      document.body.appendChild(form)
//                      form.submit();
                  
                  
                  
//                })
            
               
               
             }
         </script>
   
   

    
   
   
   
   
   
   
   
   

</body>
</html> 