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
    <link href="${ path }/resources/css/yongwoo/style.css?after" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../commons/Nav.jsp"/>
	<div class="modal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">사진 등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>사진을 등록하지 않으면 게시글을 등록할 수 없습니다. 사진을 등록해주세요</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="ok">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">제목 입력</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>제목을 입력하지 않으면 게시글을 등록할 수 없습니다. 제목을 입력해주세요</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="okTitle">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <div class="board_wrap">
        <div class="board_title">
            <strong style="color: black;">갤러리 게시판</strong>
        </div>
        <form method="post" enctype="multipart/form-data" id="form">
        	<input type="hidden" name="boardNo" value="${ board.boardNo }">
	        <div class="board_write_wrap">
	            <div class="board_write">
	                <div class="title">
	                    <dl>
	                        <dt>제목</dt>
	                        <dd><input type="text" placeholder="제목 입력" name="title" value="${ board.title }" id="inputTitle"></dd>
	                    </dl>
	                </div>
	                <hr>
	                <br>
	            	<div class="cont">
	                	<textarea placeholder="내용 입력" name="boardContent" style="resize: none; width: 1200px; height: 300px;">${ board.boardContent }</textarea>
	            	</div>
	            </div>
	            <div>
					<br>
	            	<button type="button" class="btn btn-secondary btn-lg" id="fileButton">
		            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-image" viewBox="0 0 16 16">
						  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
						  <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z"/>
						</svg>
		            	&nbsp;파일 추가
	            	</button>
	            	<br><br>
	            	<c:forEach items="${ fileRenames }" var="fileRenames">
	            		<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
						    <input type="checkbox" class="btn-check" id="btncheck${ fileRenames }" autocomplete="off">
						    <label class="btn btn-outline-primary" for="btncheck${ fileRenames }">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
								  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>
								  <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>
								</svg>
						    </label>
						    &nbsp;&nbsp;<span style="font-size: 19px;" id="fileName" class="fileNames">${ fileRenames }</span>
						    <input type="hidden" name="deleteFile" class="deleteFiles">
			            </div>
			            <br><br>
	            	</c:forEach>
	            	<div id="filePlace">
	            	</div >
	            </div>
	            
	            <div class="bt_wrap">
	                <button type="button" class="btn btn-success btn-lg me-1" id="submitButton">수정</button>
	                <button type="button" class="btn btn-dark btn-lg ms-1" id="cancel" onclick="history.back();">취소</button>
	            </div>
	        </div>
	    </form>
	</div>
	
<jsp:include page="../commons/footer.jsp"/>
    
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
	<script>
		window.onload = () =>{
			const checkBoxBtn = document.getElementsByClassName("btn-check");
			
			const alert =  document.getElementsByClassName('modal')[0];
			alert.style.display = 'none';
			
			const alertTitle =  document.getElementsByClassName('modal')[1];
			alertTitle.style.display = 'none';
			
			const ok = document.getElementById('ok');
			const okTitle = document.getElementById('okTitle');
			
			const pClose = document.getElementsByClassName('btn-close')[0];
			const tClose = document.getElementsByClassName('btn-close')[1];
			
			const filePlace = document.getElementById('filePlace');
			const add = document.getElementById('fileButton');
			
			add.addEventListener('click',function(){
				const input = document.createElement('input');
				const br = document.createElement('br');
				
				filePlace.append(input);
				filePlace.append(br);
				
				
				input.setAttribute('type', 'file');
				input.setAttribute('class', 'form-control form-control-lg');
				input.setAttribute('name', 'file');
				
			})
			
			const submitBtn = document.getElementById('submitButton');
			submitBtn.addEventListener('click',function(){
				
				const inputTitle = document.getElementById('inputTitle').value;
				
				let check = true;
				
				if(inputTitle == ''){
					const form = document.getElementById('form');
					form.removeAttribute("action");
					alertTitle.style.display = 'block';
					tClose.addEventListener('click',function(){
						alertTitle.style.display = 'none';
					})
					okTitle.addEventListener('click',function(){
						alertTitle.style.display = 'none';
					})
					
				}
				
				
				if(filePlace.children.length == 0){
					for(let i = 0; i < checkBoxBtn.length; i++){
						if(!(checkBoxBtn[i].checked)){
							check = false;
						}
					}
					if(check){
						alert.style.display = 'block';
						document.getElementById('ok').addEventListener('click',function(){
							alert.style.display = 'none';
						})
					}else{
						const btnCheck = document.getElementsByClassName('btn-check');
						const deleteFiles = document.getElementsByClassName("deleteFiles");
						const fileName = document.getElementsByClassName("fileNames");
						for(let i = 0; i < btnCheck.length; i++){
							if(btnCheck[i].checked){
								deleteFiles[i].setAttribute("value", fileName[i].innerText);
							}
						}
						const form = document.getElementById('form');
						form.action = "updateGalaryEnroll.at";
						form.submit();
					}
				}
				
				let allCheck = false;
				
				for(let i = 0; i < (filePlace.children.length/2);i++){
					
					for(let i = 0; i < checkBoxBtn.length; i++){
						if(!(checkBoxBtn[i].checked)){
							check = false;
						}
					}
					
					if(filePlace.children[2 * i].value != ''){
						allCheck = true;
					}
				}
				for(let i = 0; i < (filePlace.children.length/2);i++){
					if(check == true && allCheck == false){
						alert.style.display = 'block';
						document.getElementById('ok').addEventListener('click',function(){
							alert.style.display = 'none';
						})
						pClose.addEventListener('click',function(){
							alert.style.display = 'none';
						})
						break;
					}else{
						const btnCheck = document.getElementsByClassName('btn-check');
						const deleteFiles = document.getElementsByClassName("deleteFiles");
						const fileName = document.getElementsByClassName("fileNames");
						for(let i = 0; i < btnCheck.length; i++){
							if(btnCheck[i].checked){
								deleteFiles[i].setAttribute("value", fileName[i].innerText);
							}
						}
						const form = document.getElementById('form');
						form.action = "updateGalaryEnroll.at";
						form.submit();
					}
				}
				
			})
		}
	</script>
</body>
</html>