<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<style> 
   .container{
      height: 100%;
      position: relative;
   }
      
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/ming/notice.css">
</head>
<body>
<jsp:include page="../commons/Nav.jsp"/>
   <div class="container">
       <div class="board_wrap">
           <div class="board_title">
               <h1>공지사항</h1>
               <p>공지사항을 빠르고 정확하게 안내드립니다.</p>
           </div>
           <form method="POST" id="detailForm">
                <input type="hidden" value='${ n.noticeNo }' name="noticeNo">
            <input type="hidden" value='${ page }' name="page">
              <div class="board_view_wrap">
                  <div class="board_view">
                      <div class="title" style="font-weight: bold;">
                         <br>${n.noticeTitle }
                      </div>
                      <div class="info">
                          <dl>
                              <dt>번호</dt>
                              <dd>${n.noticeNo }</dd>
                          </dl>
                          <dl>
                              <dt>글쓴이</dt>
                              <dd>${n.notice }</dd>
                          </dl>
                          <dl>
                              <dt>작성일</dt>
                              <dd>${n.noticeModifyDate }</dd>
                          </dl>
                          <dl>
                              <dt>조회</dt>
                              <dd>${n.noticeCount }</dd>
                          </dl>
                      </div>
                      <div class="cont" style="white-space: pre-line;">${ n.noticeContent }
                            <div class="content" style="width: 1160px; overflow:hidden; margin:0 auto;">
                                 <c:forEach items="${list}" var="no">
                                    <c:if test="${fn:containsIgnoreCase(no.noticeRenameName, 'jpg') or fn:containsIgnoreCase(no.noticeRenameName, 'png')}">
                                       <img src="${contextPath }/resources/mingFiles/${no.noticeRenameName}" style="object-fit: cover; width: 100%;">
                                       <a href="${contextPath }/resources/mingFiles/${no.noticeRenameName}" download="${ no.noticeOriginalName}" style="text-decoration: none;">
                                       ${no.noticeOriginalName}
                                 </a>
                                    </c:if>
                                    <c:if test="${!(fn:containsIgnoreCase(no.noticeRenameName, 'jpg') or fn:containsIgnoreCase(no.noticeRenameName, 'png'))}">
                                       <a href="${contextPath }/resources/mingFiles/${no.noticeRenameName}" download="${ no.noticeOriginalName}" style="text-decoration: none;">
                                 ${no.noticeOriginalName}
                                 </a>
                                    </c:if>
                                 </c:forEach>
                            </div> 
                      </div>
                  </div>
                 <div class="bt_wrap" id="small-div">
                     <c:if test="${loginUser.isAdmin == 'Y'}">
                         <button type="button" id="updateForm">수정</button>
                         <button type="button" id="deleteModal">삭제</button>
                    </c:if>
                    <button class="on" type="button" onclick="location.href='${contextPath}/notice.bo?page='+${page}">목록</button>
                </div>
              </div>
           </form>
        </div>
       </div>
       <div class="modal fade" tabindex="-1" role="dialog"  id="modalChoice" >
      <div class="modal-dialog" role="document">
         <div class="modal-content rounded-3 shadow">   
            <div class="modal-body p-4 text-center">
              <h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
              <p class="mb-0">삭제 후 게시글은 복구 할 수 없습니다.</p>
            </div>
            <div class="modal-footer flex-nowrap p-0">
              <button id ="delete" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end">
                 <strong>네</strong>
              </button>
              <button class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" 
                 data-bs-dismiss="modal">아니오
              </button>
            </div>
         </div>
      </div>  
    </div>
    <script>
       window.onload = () => {
              const form = document.getElementById('detailForm');
              const del = document.getElementById('deleteModal');
                 if(del != null){
                    del.addEventListener('click', ()=> {
                       $('#modalChoice').modal('show');
                    })
              }
           
              document.getElementById('delete').addEventListener('click', ()=>{
                 form.action = '${contextPath}/delete.bo';
                 form.submit();
              }) 
              const update = document.getElementById('updateForm');
                 if(update != null){
                    update.addEventListener('click', ()=> {
                       form.action = '${contextPath}/updateForm.bo';
                       form.submit();
                 });
           }
       }
   </script>
   <br> <br> <br> <br>
   <jsp:include page="../commons/footer.jsp"/>
</body>
</html>