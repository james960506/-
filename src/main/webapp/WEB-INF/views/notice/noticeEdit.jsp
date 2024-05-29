<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.input-file-button{
  z-index:0;
  padding: 6px 25px;
  background-color:white;
  border-radius: 4px;
  color: black;
  border: solid 1px black;
  cursor: pointer;
  right: 100px;
}
input::file-selector-button{
   display: none;
}
.btn{
   cursor: pointer;
   background: black; 
   color: white; 
   width: 80px; 
   height: 40px;
   position: absolute;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/ming/notice.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>

<body>
<jsp:include page="../commons/Nav2.jsp"/>
    <div class="board_wrap">
        <div class="board_title">
            <h1>공지사항</h1>
            <p>공지사항을 빠르고 정확하게 안내드립니다.</p>
        </div>
        <form action="updateNotice.bo" method="post" id="noticeForm" enctype="multipart/form-data">
           <div class="board_write_wrap">
               <div class="board_write">
              <input type="hidden" name="noticeNo" value="${n.noticeNo }">
            <input type="hidden" name="page" value="${page }">
            <input type="hidden" value="${ n.userId }" name="userId">      
                   <div class="title">
                       <dl>
                           <dt>제목</dt>
                           <dd><input type="text" name="noticeTitle" placeholder="제목 입력" value="${n.noticeTitle }" required></dd>
                       </dl>
                   </div>
                   <div class="info">
                     <dl>
                          <dt>작성자</dt>
                          <dd><input type="text" placeholder="작성자 입력" value="${n.userId }"></dd>
                      </dl>
                   </div>
                   <div class="cont">
                       <textarea name="noticeContent" placeholder="${n.noticeContent }" required></textarea>
                        <h5>
                           <c:forEach items="${ list }" var="list">
                           <a href="${contextPath }/resources/mingFiles/${list.noticeRenameName}" download="${ list.noticeOriginalName}" style="text-decoration: none;">${ list.noticeOriginalName}</a>
                           <button type="button" class="deleteAttm" id="delete-${list.noticeRenameName}" style="width: 80px; height: 30px; background: black; color: white; cursor: pointer;">삭제 OFF</button>
                           <input type="hidden" name="deleteAttm" value="none">
                           </c:forEach>
                        </h5>
                        <br>
                     <label class="input-file-button" for="input-file">
                     파일선택
                       <input type="file" class="btnFile" name="file" id="input-file">
                     </label>
                       <br><br>
                   </div>
                   <br>
               <button class="btn" id="submitAttm" type="submit" style="left: 1372px;">등록</button>
               <button class="btn" type="button" onclick="javascript:history.back();" style="left: 1472px;">취소</button>
               </div>
            </form>
        </div>
    </div>
   <script>
   window.onload = ()=>{
      
      const delBtns = document.getElementsByClassName('deleteAttm');
      const form = document.getElementById('attmForm');
      document.getElementById('submitAttm').addEventListener('click', ()=>{
         const files = document.getElementsByName('file');
         let isEmpty = true;
         for(const f of files){
            if(f.value != ''){
               isEmpty = false;
            }
         }
         
      });
      for(const btn of delBtns){
         btn.addEventListener('click', function(){
            const nextHidden = this.nextElementSibling;
            if(this.innerText == '삭제 OFF'){
               this.style.background = 'white';
               this.style.color ='black';
               this.innerText='삭제 ON';
               nextHidden.value = this.id.split('-')[1];
            }else{
               this.style.background = 'black';
               this.style.color ='white';
               this.innerText='삭제 OFF';
            }
         });
      }
   }
      
   </script>
   <jsp:include page="../commons/footer.jsp"/>
</body>
</html>