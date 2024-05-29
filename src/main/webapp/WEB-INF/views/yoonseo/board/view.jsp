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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../../commons/Nav.jsp"/>
    <div class="board_wrap">
        <div class="board_title">
        
            <strong>커뮤니티 게시판</strong>
            <p></p>
        </div>
        <form id="detailForm">
            <input type="hidden" value="${b.boardNo }" name="boardNo">
            <input id="page" type="hidden" value="${ page }" name="page">
	        <div class="board_view_wrap">
	            <div class="board_view">
	                <div class="title">
	                    ${ b.title }
	                </div>
	                <div class="info">A
	                    <dl>
	                        <dt>글번호</dt>
	                        <dd id="boardNo">${ b.boardNo }</dd>
	                    </dl>
	                    <dl>
	                        <dt>작성자</dt>
	                        <dd>${b.userId }</dd>
	                    </dl>
	                    <dl>
	                        <dt>작성일</dt>
	                        <dd>${b.createDate }</dd>
	                    </dl>
	                    <dl>
	                        <dt>조회</dt>
	                        <dd>${b.boardView }</dd>
	                    </dl>
	                    <dl>
		                    <dt>좋아요</dt>
		                    <dd><span id="likeCount">${ likeCount }</span></dd>
		                </dl>
	                </div>
	                <div class="cont" style="white-space: pre;">${ b.boardContent }</div>
	            </div>
	            <div>
	             <input type="hidden" value="${ id }" id="idInput">
	             <span id="like" onclick="like();">
					<span id="emptyHeart">
						<i class="bi-heart fs-1" style="cursor:pointer;"></i> <span style="font-size: 25px; cursor:pointer;">좋아요</span> 
					</span>
					
					<span id="fillHeart" style="display: none">
						<i class="bi-heart-fill fs-1" style="color: red; cursor:pointer;"></i> <span style="font-size: 25px; cursor:pointer;">좋아요</span>
					</span>
				</span>
	             
	             
		          <div class="bt_wrap" id="small-div">
		              <c:if test="${ loginUser.userId eq b.userId or loginUser.userId eq 'admin'}">
		                <button type="button" id="updateForm">수정</button>
		                <button type="button" id="deleteModal">삭제</button>
		              </c:if>
		              <button type="button" onclick="location.href='${contextPath}/list.go'" class="on">목록</button>
		              
		          </div>
	            </div>
	            
		             <table id="reply-table-tr">
			               <tr>
			                 <td><input id="reply-id" value="${id}" name="loginId" readonly></td>
			               </tr>
			               <tr>
			                  <td><textarea id="replyContent"   placeholder="댓글을 작성해보세요" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
			               </tr>
			               <tr>
			                  <td>
			                    <button id="replyBtn" 
			                     <c:if test="${ empty loginUser }"> disabled</c:if>>댓글등록
			                    </button>
			                  </td>
			               </tr>    
		             </table>
	        </div>
	        
	       <c:forEach items="${ list }" var="r"> 
	         <div id="reply-submit-line">
		         <table id="reply-table">
		            <tbody>
			            <tr class="reply-tr">
			              <td>${r.replyWriter }</td>  
			            <tr>
			            <tr class="reply-tr">
			               <td style="white-space: pre;">${r.replyContent }</td>
			            </tr>
			            <tr>
			               <td align="right" >${r.replyCreateDate }</td>
			            </tr>
			            <c:if test="${loginUser.userId eq r.replyWriter or loginUser.userId eq 'admin'}">
				            <tr>
				               <td align="right">
				                  <button type="button" class="replyDelete" data-requestNo="${r.replyNo}">삭제</button>
				               </td>
				            </tr>
			            </c:if>
		            </tbody> 
		         </table>
	         </div>
	       </c:forEach>
        </form>
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
   
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
	<script type="text/javascript">
		
		//상세페이지 열릴때 좋아요 체크 여부
		$().ready(function(){
			const boardNo = $('input:eq(0)').val();
			const id = $('#idInput').val();
			
			if(id != undefined){
				$.ajax({
					type:"post",
					url:"updateLike.go",
					data:{
						id : id,
						boardNo : boardNo,
						check : "forHeartCheck"
						},
					success: (data) => {
						if(data == 'check'){
							$('#emptyHeart').css('display', 'none');
							$('#fillHeart').css('display', 'inline-block');
						}else{
							$('#emptyHeart').css('display', 'inline-block');
							$('#fillHeart').css('display', 'none');
						}			
					},
					error: data => console.log(data)
				})
			}
		})
		
		//좋아요 ajax
		const like = () =>{
			const id = $('#idInput').val();
			const boardNo = $('input:eq(0)').val();
			if(id != undefined){
				$.ajax({
					type:"post",
					url:"updateLike.go",
					data:{
						id : id,
						boardNo : boardNo,
						check : "notForHeartCheck"
						},
					success: (data) => {
						if(data == 'insert'){
							$('#emptyHeart').css('display', 'none');
							$('#fillHeart').css('display', 'inline-block');
							$.ajax({
								type:"post",
								url:"updateViewLike.go",
								data:{boardNo : boardNo},
								success: (data) =>{
									$('#likeCount').text(data);
								},
								error: (data) => {
									console.log(data);
								}
							})
						}else{
							$('#emptyHeart').css('display','inline-block');
							$('#fillHeart').css('display','none');
							$.ajax({
								type:"post",
								url:"updateViewLike.go",
								data:{boardNo : boardNo},
								success: (data) =>{
									$('#likeCount').text(data);
								},
								error: (data) => {
									console.log(data);
								}
							})
						}
					},
					error: (data) => {
						console.log(data);
					}
				})
			}
		}
		
		
	
	    function resize(obj) {
	  	  obj.style.height = '1px';
	  	  obj.style.height = (12 + obj.scrollHeight) + 'px';
	    }
		 
    
    
        window.onload = () => {
        	const form = document.getElementById('detailForm');
        	const del = document.getElementById('deleteModal');
        	if(del != null){
        		del.addEventListener('click', ()=> {
        			$('#modalChoice').modal('show');
        		})
        	}
        
        	document.getElementById('delete').addEventListener('click', ()=>{
        		form.action = '${contextPath}/listDelete.go';
        		form.submit();
        	}) 
        	const update = document.getElementById('updateForm');
        	if(update != null){
        		update.addEventListener('click', ()=> {
        			form.action = '${contextPath}/updateForm.go';
        			form.submit();
        		})
        	}
        	
        	document.getElementById('replyBtn').addEventListener('click', () => {
        		//댓글 등록 버튼을 클릭하면
        		const content = document.getElementById('replyContent').value;
        		//댓글 내용을 content에 담음
        		if(content != ''){//content가 비어있지 않다면
        			$.ajax({ //ajax를 이용해
            			url:'${contextPath}/insertReply.go',  //전송할 url
            			data:{replyContent:content,  
            				  refBoardNo:${b.boardNo}, replyWriter:'${loginUser.userId}'},
            				  //전송할 데이터들
            		    success:(data) => {
            		    	console.log(data);  //전송에 성공했을 때
            		    	location.reload();
            		    },
            		    error: data => console.log(data)//전송에 실패했을 때
            				
            	   });	
        		}else{
        			alert("댓글 내용을 입력해주세요");//content가 비어있다면 alert창 띄움
        		}
        		
        		
           })
           
           const boardNo = document.getElementById('boardNo').innerText;
           const pageNo = document.getElementById('page').value;
           
           const deleteReply = document.querySelectorAll('.replyDelete');
        	deleteReply.forEach(delBtn => {
        		delBtn.addEventListener('click',function(){
        			const delReplyNo = this.getAttribute('data-requestNo');
        			const form = document.createElement('form');
        			form.method = 'POST';
        			form.action='deleteReply.go?boardNo=' + boardNo + "&page=" + pageNo;
        			
        			const input = document.createElement('input');
        			input.type='hidden';
        			input.name='replyNo';
        			input.value=delReplyNo;
        		
        			
        			form.appendChild(input);
        			document.body.appendChild(form);
        			form.submit();
        			console.log(delReplyNo);
        		})
        	})
        	
        	
         
        	
        }
          
    </script>
  <jsp:include page="../../commons/footer.jsp"/> 
    
</body>
</html>