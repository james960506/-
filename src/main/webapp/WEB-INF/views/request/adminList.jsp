<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/sohwa/adminList.css?after" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<jsp:include page="../commons/manager_header.jsp"></jsp:include>
<%--    <jsp:include page="../commons/manager_header.jsp"/> --%>
   
   <div id="layoutSidenav_content">
      <main>
         <div class="container-fluid px-4">
            <h1 class="mt-4">상담 관리</h1>
            <div class="card mb-4">
            </div>
            <div class="card mb-4">
               <div class="card-header">
                  <i class="fas fa-table me-1"></i> 상담신청 목록
               </div>
               <div class="card-body" style="padding:0px; margin:0px;">
                  
                  <div class="board_wrap" style="padding-left:100px; padding-top:30px; padding-bottom:30px; margin:0px; width:90%;">
                       <div class="board_title">
                           <div id="requestBox" style="background-color: lightgray; padding-top:5px; border-radius: 10px; line-height:6px; vertical-align: middle;">
                           
                              &nbsp;&nbsp;&nbsp;&nbsp;<label for="allList" class="form-check-label">&nbsp;<input  type="radio" value="A" id="allList" name="listCheck"<c:if test="${adminStatus =='A'}">checked</c:if>>&nbsp;전체</label>&nbsp;&nbsp;&nbsp;&nbsp;
                              &nbsp;&nbsp;&nbsp;<label for="acceptList" class="form-check-label">&nbsp;<input type="radio" value="Y" id="acceptList" name="listCheck"<c:if test="${adminStatus =='Y'}">checked</c:if>>&nbsp;승낙한 상담신청</label>&nbsp;&nbsp;&nbsp;&nbsp;
                              <label for="refuseList" class="form-check-label">&nbsp;<input type="radio" id="refuseList" value="N" name="listCheck"<c:if test="${adminStatus =='N'}">checked</c:if>>&nbsp;거절한 상담신청</label>&nbsp;&nbsp;&nbsp;&nbsp;
                              <label for="notyetList" class="form-check-label">&nbsp;<input type="radio" id="notyetList" value="Q" name="listCheck"<c:if test="${adminStatus =='Q'}">checked</c:if>>&nbsp;보류중인 상담신청</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <button id="selectCate" style="background-color: white; color:gray; border-radius: 10px; height:40px; line-height: 6px; vertical-align: middle;">조회</button>
                           </div>
                       </div>
                       <input type='checkbox' name='selectAll' value="전체 선택" id="allSelect" >전체선택<span style="margin-right: 790px;"></span>
                       <button id="checkDelete" style="float:right;">선택 항목 삭제</button>
                       <div class="board_list_wrap">
                           <div class="board_list">
                               <div class="top">
                                   <div class="title">상담유형</div>
                                   <div class="writer">신청자</div>
                                   <div class="date" style="margin-right:0px;">작성일자</div>
                                   <div class="count" >신청일자</div>
                               </div>
                               
                               
                                  <c:if test="${empty list }">
                                     조회된 리스트가 없습니다.
                                  </c:if>
                                  <c:if test="${!empty list }">
                                     <c:forEach items="${list }" var="l">
                                        <div class="checkDiv">
                                           <input type="checkbox" name="dc" value="${l.requestNo }">
                                            <div class="num">${l.requestNo }</div>
                                            <div class="title" style="padding-right:0px; margin-right:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${l.consultingType=='A'? "유치원입학상담" : "호텔예약상담" }</div>
                                            <div class="writer">${l.userName }</div>
                                            <div class="date" style="font-size:18px;">${l.requestDay }</div>
                                            <div class="count">${l.requestTime }</div>
                                           </div>
                                     </c:forEach>
                                  </c:if>
                               
                               
                               
                           <br>
                           </div>
                           
                           <div class="board_page">
                                    <c:url var="goFirst" value="${ loc }">
                                       <c:param name="adminStatus" value="${adminStatus }"></c:param>
                                       <c:param name="page" value="${ pi.startPage }" />
                                    </c:url>
               
                                    <a href="${ goFirst }" class="pageBtn frist"><<</a>
               
                                    <c:if test="${ pi.currentPage > 1}">
                                       <c:url var="goBack" value="${ loc }">
                                          <c:param name="adminStatus" value="${adminStatus }"></c:param>
                                          <c:param name="page" value="${ pi.currentPage-1 }" />
                                       </c:url>
                                    </c:if>
               
                                    <a href="${ goBack }" class="pageBtn prew"><</a>
               
               
               
               
               
                                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                                          <c:url var="goNum" value="${ loc }">
                                             <c:param name="adminStatus" value="${ adminStatus }"></c:param>
                                             <c:param name="page" value="${ p }" />
                                          </c:url>
                                       
                                       <c:if test="${ pi.currentPage eq  p }">
                                          <a href="${ goNum }" class="num selected">${ p }</a>
                                       </c:if>
                                       <c:if test="${ pi.currentPage ne  p }">
                                          <a href="${ goNum }" class="num" style="color:black;">${ p }</a>
                                       </c:if>
                                    </c:forEach>
                                    
                                    
                                    
                                    
               
                                    <c:if test="${ pi.currentPage <= pi.endPage}">
                                       <c:url var="goNext" value="${ loc }">
                                          <c:param name="adminStatus" value="${adminStatus }"></c:param>
                                          <c:param name="page" value="${ pi.currentPage+1 }" />
                                       </c:url>
                                    </c:if>
               
                                    <a href="${ goNext }" class="pageBtn next">></a>
               
                                    <c:url var="goLast" value="${ loc }">
                                       <c:param name="adminStatus" value="${adminStatus }"></c:param>
                                       <c:param name="page" value="${ pi.endPage }" />
                                    </c:url>
                                    <a href="${ goLast }" class="pageBtn last">>></a>
                                 </div>
             
                          </div>
                      </div>
                  
               </div>
            </div>
         </div>
      </main>
   
   
   
   
   
   <jsp:include page="../commons/manager_footer.jsp"/>



    <script>
        window.onload=()=>{
           
           //체크박스 전체선택
           const checkboxes = document.getElementsByName("dc");
            const selectAll = document.getElementById("allSelect");
            selectAll.addEventListener('click',()=>{
               checkboxes.forEach((checkbox) => {
                  console.log(checkbox);
                    checkbox.checked = selectAll.checked;
                })
            })
            
            
            
            
            //분류조회
            document.getElementById('selectCate').addEventListener('click',()=>{
               const value = document.getElementsByName('listCheck');
               const page = '${page}';
               let valueType = "A";
               for(let i=0; i<value.length; i++){
                  if(value[i].checked){
                     valueType= value[i].value;
                     location.href="${contextPath}/adminList.do?adminStatus=" + valueType + "&page=" + 1;
                  }
               }
               
            })
            
            
            
            // 체크 박스 삭제 이벤트
          document.getElementById('checkDelete').addEventListener('click',function(){
             
             if(confirm('정말 삭제하시겠습니까?')){
                var checkBoxArr = [];
                   $("input:checkbox[name='dc']:checked").each(function () {
                       checkBoxArr.push($(this).val());
                   });
               
                   $.ajax({
                       type: "POST",
                       url: "deleteList.do",
                       
//                        data: {checkBoxArr: checkBoxArr},
                   contentType: "application/json", // JSON 형식으로 데이터를 전송
                       data: JSON.stringify(checkBoxArr),
                       
                       success: function (data) {
                           // 서버에서 성공적으로 처리한 후의 동작을 여기에 추가할 수 있습니다.
                           // 예: 처리 완료 후 페이지 리로드
                           location.reload();
                       },
                       error: function () {
                           alert("오류");
                       }
                   });
             }
             
               
          }) 
             
          
                 
            
            
            
            
            
           
         
       }
        
        
          
        
        
           //글 번호 가져오기 & 마우스엔터 이벤트
           const checkDivs = document.querySelectorAll('.checkDiv');
           checkDivs.forEach(checkDiv => {
              checkDiv.addEventListener('mouseenter',()=>{
                 checkDiv.style.cursor = 'default';
              })
              checkDiv.addEventListener('click',()=>{
                 if (!event.target.matches('input[type="checkbox"]')) {
                    const requestNo = checkDiv.querySelector('.num').innerText;
                       // 여기서 가져온 requestNo 값을 원하는 대로 사용
                       location.href="${contextPath}/adminDetail.do?requestNo="+requestNo;
                 }
                 
              })
           });
        
        
        
        
        
       
        
           
        
    </script>
    
    <jsp:include page="../commons/manager_footer.jsp"></jsp:include>
</body>
</html>