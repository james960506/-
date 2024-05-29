<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<style>
.input-file-button{
  padding: 6px 25px;
  background-color:white;
  border-radius: 4px;
  color: black;
  border: solid 1px black;
  cursor: pointer;
  right: 1200px;
  width:400px;
  position: absolute;
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
.myPage{
   
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=, initial-scale=1.0">
<title>공지 사항</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="resources/css/ming/notice.css">
<link href="${path}/resources/css/ming/header.css" rel="stylesheet">
<link href="${path}/resources/css/ming/footer.css" rel="stylesheet">

</head>
<body>
   <jsp:include page="../commons/Nav2.jsp"/>
         <form action="${ contextPath }/inserNotice.bo" method="POST" enctype="multipart/form-data" id="attmForm"> 
            <div class="board_wrap">
               <div class="board_title">
                     <strong>공지사항 </strong>
                   <p>공지사항을 빠르고 정확하게 안내드립니다.</p>
                 </div>
                 <div class="board_write_wrap">
                  <div class="board_write">
                      <div class="title">
                       <dl>
                           <dt>제목</dt>
                           <dd><input type="text" placeholder="제목 입력" name="noticeTitle" required></dd>
                       </dl>
                   </div>
                   <div class="cont">
                       <textarea placeholder="내용 입력" name="noticeContent" required></textarea>
                   </div>
                   <div id="fileArea">
                  <div class="bt_wrap1">
                  <label class="input-file-button" for="input-file">
                      <input type="file" class="btnFile" name="file" id="input-file">
                  </label>
                   </div>
                </div>
               </div>
               <div class="bt_wrap1">
                  <button class="btn" style="left: 1470px;">등록</button>
                  <button type="button" onclick="javascript:history.back();" class="btn" style="left: 1570px;">취소</button>
               </div>
           </div>
        </form>
    </div>
    <jsp:include page="../commons/footer.jsp"/>
</body>
</html>