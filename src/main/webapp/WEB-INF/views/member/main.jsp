<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/member/main.css" rel="stylesheet"
   type="text/css">
</head>
<body class="sb-nav-fixed">
   <%@ include file="../commons/manager_header.jsp"%>
   <div id="layoutSidenav_content">
      <main>
         <div class="container-fluid px-4">
            <h1 class="mt-4">회원 관리</h1>
            <div class="card mb-4"></div>
            <div class="card mb-4">
               <div class="card-header">
                  <i class="fas fa-table me-1"></i>회원 목록
               </div>
               <div class="card-body">
                  
                  <div class="head">
                     <form action="main.me" method="POST" class="form">
                        <select name="searchType">
                           <option value="search">검색기준</option>
                           <option value="uName" name="uName"
                              <c:if test="${searchType eq 'uName'}">selected</c:if>>이름</option>
                           <option value="userId" name="userId"
                              <c:if test="${searchType eq 'userId'}">selected</c:if>>아이디</option>
                        </select> 
                        <input type="text" name="keyword">
                        <button type="button" id="searchMem">검색</button>
                     </form>
                     <br>
                  </div>
                  
                  <div class="content">
                     <table>
                        <tr>
                           <th><input type="checkbox" name="checkAll" id="checkAll"
                              class="test" onclick="checkAll1()"></th>
                           <th>이름</th>
                           <th>아이디</th>
                           <th>가입일</th>
                           <th>연락처</th>
                        </tr>
                        <c:forEach items="${ list }" var="a">
                           <tr onclick="memberDetail(this.id)" id="${ a.userId }">
                              <th onclick="javascript:event.stopPropagation();"><input
                                 type="checkbox" class="test" name="check" id="${ a.userId }"
                                 onclick="check1()">
                              </td>
                              <td>${ a.uName }</td>
                              <td>${ a.userId }</td>
                              <td>${ a.joinDate }</td>
                              <td>${ a.phone }</td>
                           </tr>
                        </c:forEach>
                     </table>
                     <input type="button" id="deleteBtn();" name="deleteBtn" onclick="minus()" value="선택 삭제">
                  </div>

                  <br> 

                  <div class="board_page">

                     <!-- << -->
                     <c:url var="goFirst" value="${ loc }">
                        <c:param name="page" value="1" />
                     </c:url>
                     <a href="${ goFirst }" class="pageBtn frist"><<</a>

                     <!-- < -->
                     <c:if test="${ pi.currentPage > 1 }">
                        <c:url var="goBack" value="${ loc }">
                           <c:param name="page" value="${pi.currentPage -1 }" />
                        </c:url>
                     </c:if>
                     <a href="${goBack}" class="pageBtn prew"><</a>

                     <!-- 현재 페이지 -->
                     <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                        <c:url var="goNum" value="${loc}">
                           <c:param name="page" value="${p}" />
                        </c:url>
                        <c:if test="${ pi.currentPage eq p}">   <!-- 현재페이지 색 들어옴 -->
                           <a href="${goNum}" class="num selected">${p}</a>
                        </c:if>
                        <c:if test="${ pi.currentPage ne p }">
                           <a href="${goNum}" class="num">${p}</a>
                        </c:if>
                     </c:forEach>

                     <!-- > -->
                     <c:if test="${ pi.currentPage < pi.endPage }">
                        <c:url var="goNext" value="${loc}">
                           <c:param name="page" value="${pi.currentPage +1 }" />
                        </c:url>
                     </c:if>
                     <a href="${ goNext }" class="pageBtn next">></a>

                     <!-- >> -->
                     <c:url var="goLast" value="${ loc }">
                        <c:param name="page" value="${ pi.endPage }" />
                     </c:url>
                     <a href="${ goLast }" class="pageBtn last">>></a>
                  </div>
               </div>
            </div>
         </div>
      </main>


   <!-- 조건 검색 -->
   <script>
   document.getElementById('searchMem').onclick = function() {
      let searchType = document.getElementsByName("searchType")[0].value;
      let keyword = document.getElementsByName("keyword")[0].value;
      
      console.log(searchType);
      console.log(keyword);
      
      location.href = 'main.me?searchType=' + searchType + '&keyword=' + keyword;
   }
   </script>

   <!-- 전체선택 / 해제 -->
      <script type="text/javascript">
      userId=[];
      <!-- 체크박스 선택 -->
       const check1 = () =>{
          const checkboxes = document.querySelectorAll('input[name="check"]');      // 전체 체크박스들
          const checked = document.querySelectorAll('input[name="check"]:checked')   // 선택된 체크박스
          const checkAll = document.querySelector('input[name="checkAll"]');         // 전체선택 박스
          
          for(i=0; i < checked.length; i++){
             
          }
          
          if(checkboxes.length == checked.length){                           // 체크박스 전체개수 = 선택된 체크박스
             checkAll.checked = true;
          } else {
             checkAll.checked = false;
          }
       }
       <!-- 전체 선택 -->
      const checkAll1 = () =>{
         const checkboxes = document.querySelectorAll("input[type=checkbox]");
         for(let i=1; i<checkboxes.length; i++){
            checkboxes[i].checked = checkboxes[0].checked;                     // 배열 갯수만큼 체크된 체크박스 = 전체선택 박스
            }
         } 
      <!-- 선택 삭제 -->
         const minus = () =>{
               const checkboxes = document.querySelectorAll("input[name='check']:checked");
               const deleteIds = [];
              
               for(i=0; i<checkboxes.length; i++){
                  deleteIds[i] = checkboxes[i].id;
                  console.log(deleteIds[i]);
               }
               if(deleteIds.length != 0){
                  location.href = "selectDelete.me?deleteIds="+deleteIds;
               }
         };     

      <!-- 선택 삭제 -->
      /*                                          >>>> 선택삭제 O               
      const minus = () =>{
           const checkAll = document.querySelector('input[name="checkAll"]');
           
         const delete1 = document.querySelectorAll('input[name="check"]:checked');
         for(i=0; i < delete1.length; i++){
            console.log(delete1[i]);
            
            delete1[i].parentElement.parentElement.remove();
           };
         location.href='selectDelete.me';
        }
      */
      
                                                
      /*                                          >>>> ajax 전체 선택 / 해제
         $(document).ready(function() {
            // 전체 체크박스 클릭
            $('#checkAll').click(function() {
               if($('#checkAll').prop("checked")){
                  $(".test").prop("checked", true);
               } else {
                  $(".test").prop("checked", false);
               }
            });
   
            // 전체 체크박스 선택 중 체크박스 하나 제거하면 전체 체크 해제
            $(".test").click(function() {
               if($("input[name='check']:checked").length == $("input[name='check']").length){
                  $('#checkAll').prop('checked', true);
               } else {
                  $('#checkAll').prop("checked", false);
               }
            });
         });   
      */
   </script>

   <script>
   /*   function memberDetail(userId){
         window.open('memberDetail.me?userId=' + userId, 'popup', "width=730, height=520");
      }*/
      
      const memberDetail = (userId) =>{
         let _width = "730";
         let _height = "520";
         let _left = (window.screen.width/2) - (_width/2);
         let _top = (window.screen.height/2) - (_height/2);
         const openWin = window.open("memberDetail.me?userId="+userId, "popup", "width="+_width+", height="+_height+",left="+_left+",top="+_top);
      }
   </script>

      <%@ include file="../commons/manager_footer.jsp"%>
</body>
</html>