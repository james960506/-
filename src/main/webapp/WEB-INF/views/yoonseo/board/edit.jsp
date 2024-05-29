<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="resources/css/yoonseo-css/css/style.css">
</head>
<style>
    	.board_wrap{
    		min-height: 590px;
    	}
    	
    </style>
<body>
 <jsp:include page="../../commons/Nav.jsp"/>
    <div class="board_wrap">
        <div class="board_title">
            <strong>커뮤니티 게시판</strong>
            <p></p>
        </div>
      
      <form method="POST" action="${contextPath}/updateBoard.go">
        <div class="board_write_wrap">
            <div class="board_write">
                <input type="hidden" value="${ b.userId }" name="userId">
				<input type="hidden" value="${ page }" name ="page">
				<input type="hidden" value="${ b.boardNo }" name ="boardNo">
				
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="title" value="${b.title }" required></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>카테고리</dt>
                        <dd>
                          <select name="kind">
                             <option <c:if test="${ b.kind eq '후기'}"> selected</c:if>> 후기</option>
                             <option <c:if test="${ b.kind eq '자랑하기'}"> selected</c:if>> 자랑하기</option>
                             <option <c:if test="${ b.kind eq '질의응답'}"> selected</c:if>> 질의응답</option>
                          </select>
                        </dd>
                    </dl>
                    
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력" name="boardContent" required>${b.boardContent}</textarea>
                </div>
            </div>
            <div class="bt_wrap1">
                <button class="on">등록</button>
                <button type="button" onclick="javascript:history.back();">취소</button>
            </div>
        </div>
      </form>
    </div>
  <jsp:include page="../../commons/footer.jsp"/>
</body>
</html>