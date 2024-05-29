<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>갤러리 게시판</title>
    <c:set var="path" value="${ pageContext.request.contextPath }"/>
    <link href="resources/css/yongwoo/style.css?after" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<jsp:include page="../commons/Nav.jsp"/>
    
    <div class="board_wrap">
        <div class="board_title">
            <strong>갤러리 게시판</strong>
        </div>
        <form action="${ contextPath }/moveToUpdateGalary.at" method="post" enctype="multipart/form-data">
	        <div class="board_write_wrap">
	            <div class="board_view">
		            <div class="title">
		            	${ board.title }
		            </div>
		            <div class="info">A
		            	<dl>
		                	<dt>번호</dt>
		                	<dd>${ board.boardNo }</dd>
		                </dl>
		                <dl>
		                	<dt>아이디</dt>
		                    <dd>${ board.userId }</dd>
		                </dl>
		                <dl>
		                    <dt>작성일</dt>
		                    <dd>${ board.createDate }</dd>
		                </dl>
		                <dl>
		                    <dt>조회</dt>
		                    <dd>${ board.boardView }</dd>
		                </dl>
		                <dl>
		                    <dt>좋아요</dt>
		                    <dd><span id="likeCount">${ likeCount }</span></dd>
		                </dl>
		            </div>
	                <input type="hidden" value="${ board.boardNo }" name="boardNo">
	                <input type="hidden" value="${ board.title }" name="title">
	                <c:if test="${ !empty id }">
	                	<input type="hidden" value="${ loginUser.userId }" id="idInput">
	                </c:if>
	                <br>
	            	<div class="cont">
	                	<textarea placeholder="내용 입력" name="boardContent" readonly>${ board.boardContent }</textarea>
	            	</div>
	            </div>
				<br>
				
				<span id="like" onclick="like();">
					<span id="emptyHeart">
						<i class="bi-heart fs-1"></i> <span style="font-size: 25px">좋아요</span> 
					</span>
					
					<span id="fillHeart" style="display: none">
						<i class="bi-heart-fill fs-1" style="color: red;"></i> <span style="font-size: 25px">좋아요</span>
					</span>
				</span>
				<br><br><br>
				<div class="container">
    				<div class="row">
						<c:forEach items="${ pList }" var="p">
							<input type="hidden" name="file" value="${ p.fileRename }">
							<div class="col-md-3 mb-5">
					            <div class="card" style="width: 18rem;">
								  <img src="${ path }/resources/uploadFiles/${ p.fileRename }" class="card-img-top">
								  <div class="card-body">
								    <a href="${ path }/resources/uploadFiles/${ p.fileRename }" download="${ p.fileName }" style="text-decoration: none; color: black">${ p.fileName }</a>
								  </div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="bt_wrap" style="text-align: right;">
	            	<c:if test="${ loginUser.isAdmin eq 'Y' && board.userId eq loginUser.userId}">
	                	<button class="btn btn-success btn-lg me-1">수정</button>
	                	<button type="button" class="btn btn-success btn-lg me-1" onclick="deleteGalary();">삭제</button>
	               </c:if>
	                <button type="button" class="btn btn-dark btn-lg ms-1" id="cancel" onclick="history.back();">뒤로</button>
	            </div>
			</div>
		</form>
		</div>
	    <div >  
			<table id="reply-table-tr" style="border-radius: 10%">
				<tr>
					<td><input id="reply-id" value="${id}" name="loginId" readonly style="margin-left: 2.5%"></td>
				</tr>
				<tr>
		    		<td><textarea id="replyContent" placeholder="댓글을 작성해보세요" style="width:95%; margin-left: 2.5%; margin-right: 2.5%; height: 100px"></textarea></td>
				</tr>
				<tr>
		    		<td>
				       <button id="replyBtn" onclick="enrollReply();"
				   	   <c:if test="${ empty loginUser }"> disabled</c:if>>댓글등록
					   </button>
					</td>
				</tr>    
			</table>
		</div>
	    <c:forEach items="${ rList }" var="r">
	    	<div id="reply-submit-line">
		         <table id="reply-table">
		            <tbody >
			            <tr class="reply-tr" >
			              <td>${r.replyWriter }</td>  
			            <tr>
			            <tr class="reply-tr">
			               <td>${r.replyContent }</td>
			            </tr>
			            <tr>
			               <td align="right" >${r.replyCreateDate }</td>
			            </tr>
			            <c:if test="${loginUser.userId eq r.replyWriter }">
				            <tr>
				               <td align="right">
				               	<input type="hidden" value="${ r.replyNo }" id="replyNo">
				                  <button type="button" class="replyDelete" onclick="replyDelete();">삭제</button>
				               </td>
				            </tr>
			            </c:if>
		            </tbody> 
		         </table>
	         </div>
	       </c:forEach>
	
	<div class="modal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">삭제 확인</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>삭제 하시면 복구하실 수 없습니다. 정말 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="deleteOk">삭제</button>
	        <button type="button" class="btn btn-dark" data-bs-dismiss="modal" id="deleteNo">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<jsp:include page="../commons/footer.jsp"/>
	
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
					url:"updateLike.at",
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
	
		window.onload = () =>{
			const modal = document.getElementsByClassName('modal')[0];
			modal.style.display = 'none';
			
		}
	
		const deleteGalary = () =>{
			const modal = document.getElementsByClassName('modal')[0];
			const boardNo = document.querySelectorAll("input")[0].value;
			const deleteBtn = document.getElementById('deleteOk');
			const cancelBtn = document.getElementById('deleteNo');
			modal.style.display = 'block';
			deleteBtn.addEventListener('click',function(){
				location.href="deleteGalary.at?boardNo=" + boardNo;
			});
			cancelBtn.addEventListener('click',function(){
				modal.style.display = 'none';
			});
		}
		
		
		//좋아요 ajax
		const like = () =>{
			const id = $('#idInput').val();
			const boardNo = $('input:eq(0)').val();
			if(id != undefined){
				$.ajax({
					type:"post",
					url:"updateLike.at",
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
								url:"updateViewLike.at",
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
								url:"updateViewLike.at",
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
		
		//댓글 작성
		const enrollReply = () =>{//insert까진 되니까 갱신만 하기
			const replyContent = $('#replyContent').val();
			const id = $('#idInput').val(); 
			const boardNo = $('input:eq(0)').val();
			if(id != undefined){
				if(replyContent != ''){
					$.ajax({
						type:"post",
						url:"enrollReply.at",
						data:{
							id : id,
							replyContent : replyContent,
							boardNo : boardNo
						},
						success : (data) => {
							console.log(data);
							
							for (var i = 0; i < data.length; i++) {
							    var r = data[i];
							    
							    var divElement = document.createElement("div");
							    divElement.id = "reply-submit-line";

							    // table 요소 생성
							    var tableElement = document.createElement("table");
							    tableElement.id = "reply-table";

							    // tbody 요소 생성
							    var tbodyElement = document.createElement("tbody");

							    // 첫 번째 행
							    var tr1 = document.createElement("tr");
							    var td1 = document.createElement("td");
							    td1.innerText = r.replyWriter;
							    tr1.appendChild(td1);

							    // 두 번째 행
							    var tr2 = document.createElement("tr");
							    var td2 = document.createElement("td");
							    td2.innerText = r.replyContent;
							    tr2.appendChild(td2);

							    // 세 번째 행
							    var tr3 = document.createElement("tr");
							    var td3 = document.createElement("td");
							    td3.innerText = r.replyCreateDate;
							    tr3.appendChild(td3);

							    // 네 번째 행 (userId와 replyWriter 비교)
							    if (id === r.replyWriter) {
							        var tr4 = document.createElement("tr");
							        var td4 = document.createElement("td");
							        var button = document.createElement("button");
							        button.type = "button";
							        button.className = "replyDelete";
							        button.innerText = "삭제";
							        td4.appendChild(button);
							        tr4.appendChild(td4);
							    }

							    // tbody에 행 추가
							    tbodyElement.appendChild(tr1);
							    tbodyElement.appendChild(tr2);
							    tbodyElement.appendChild(tr3);
							    
							    // userId와 replyWriter 비교 후 행 추가
							    if (id === r.replyWriter) {
							        tbodyElement.appendChild(tr4);
							    }

							    // table에 tbody 추가
							    tableElement.appendChild(tbodyElement);

							    // div에 table 추가
							    divElement.appendChild(tableElement);

							    // body에 div 추가
							    document.body.appendChild(divElement);
							}
							location.reload();
						},
						error : (data) => {
							console.log(data);
						}
					})
				}else{
					alert('내용을 입력하셔야 됩니다');
				}
			}else{
				alert('로그인을 해야 댓글을 다실 수 있습니다');
			}
		}
		
		 function resize(obj) {
	          obj.style.height = '1px';
	          obj.style.height = (12 + obj.scrollHeight) + 'px';
	       }
		 
		 const replyDelete = () =>{
			const id = $('#idInput').val(); 
			const boardNo = $('input:eq(0)').val();
			const replyNo = $('#replyNo').val();
				$.ajax({
					type:"post",
					url:"deleteReply.at",
					data:{
						id : id,
						boardNo : boardNo,
						replyNo : replyNo
					},
						success : (data) => {
							console.log(data);
							
							for (var i = 0; i < data.length; i++) {
							    var r = data[i];
								    
							    var divElement = document.createElement("div");
							    divElement.id = "reply-submit-line";

								    // table 요소 생성
							    var tableElement = document.createElement("table");
							    tableElement.id = "reply-table";

								    // tbody 요소 생성
							    var tbodyElement = document.createElement("tbody");

								    // 첫 번째 행
							    var tr1 = document.createElement("tr");
							    var td1 = document.createElement("td");
							    td1.innerText = r.replyWriter;
							    tr1.appendChild(td1);

								    // 두 번째 행
							    var tr2 = document.createElement("tr");
							    var td2 = document.createElement("td");
							    td2.innerText = r.replyContent;
							    tr2.appendChild(td2);

								    // 세 번째 행
							    var tr3 = document.createElement("tr");
							    var td3 = document.createElement("td");
							    td3.innerText = r.replyCreateDate;
							    tr3.appendChild(td3);

								    // 네 번째 행 (userId와 replyWriter 비교)
							    if (id === r.replyWriter) {
							    	var tr4 = document.createElement("tr");
							    	var td4 = document.createElement("td");
							    	var button = document.createElement("button");
							    	button.type = "button";
							    	button.className = "replyDelete";
							    	button.innerText = "삭제";
							    	td4.appendChild(button);
							    	tr4.appendChild(td4);
								}

								// tbody에 행 추가
							tbodyElement.appendChild(tr1);
							tbodyElement.appendChild(tr2);
							tbodyElement.appendChild(tr3);
								    
								    // userId와 replyWriter 비교 후 행 추가
							if (id === r.replyWriter) {
							    tbodyElement.appendChild(tr4);
							}

							  // table에 tbody 추가
							tableElement.appendChild(tbodyElement);

								    // div에 table 추가
						    divElement.appendChild(tableElement);

								    // body에 div 추가
						    document.body.appendChild(divElement);
							}
						location.reload();
					},
					error : (data) => {
						console.log(data);
					}
				})
	 		}
	</script>
</body>
</html>