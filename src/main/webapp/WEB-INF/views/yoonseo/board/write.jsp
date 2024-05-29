<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="resources/css/yoonseo-css/css/style.css">
    <style>
    	.board_wrap{
    		min-height: 590px;
    	}
    	
    </style>
</head>
<body>
<jsp:include page="../../commons/Nav.jsp"/>
   <form action="insertBoard.go"> 
    <div class="board_wrap">
        <div class="board_title">
            <strong>커뮤니티 게시판</strong>
            <p></p>
        </div>
      
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="title" required></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>카테고리</dt>
                        <dd>
                          <select name="kind">
                             <option>후기</option>
                             <option>자유</option>
                             <option>질의응답</option>
                          </select>
                        </dd>
                    </dl>
                   
                </div>
                <div class="cont">
                    <textarea  style="white-space: pre;" id="content" placeholder="내용 입력" name="boardContent" required></textarea>
                </div>
            </div>
            <div class="bt_wrap1">
                <button class="on">등록</button>
                <button type="button" onclick="javascript:history.back();">취소</button>
            </div>
        </div>
    </div>
  </form>
  
    
  <jsp:include page="../../commons/footer.jsp"/>
</body>
</html>