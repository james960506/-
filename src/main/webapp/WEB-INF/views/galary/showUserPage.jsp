<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<link href="resources/css/yongwoo/user_galary_page.css?after"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link href="resources/css/commons/sideBar.css?after" rel="stylesheet">
<style type="text/css">
	/*페이지 설정*/
	
	*{
		text-decoration: none !important;
	}
	.board_page {
	   font-family: none;
	   margin-top: 30px;
	   text-align: center;
	   font-size: 0;
	}
	
	.board_page a {
	   text-align: center;
	   display: inline-block;
	   width: 30px;
	   height: 30px;
	   box-sizing: border-box;
	   vertical-align: middle;
	   border: 1px solid #ddd;
	   border-left: 0;
	   line-height: 100%;
	}
	
	.board_page a.btn {
	   padding-top: 7px;
	   font-size: 12px;
	   letter-spacing: -3px;
	}
	
	.board_page a.num {
	   padding-top: 6px;
	   font-size: 14px;
	}
	
	.board_page a.num.selected {
	   background-color: #000;
	   border-color: #000;
	   color: #fff;
	}
	
	.board_page a.frist {
	   border-left: 1px solid #ddd;
	}
</style>
</head>
<body>
	<jsp:include page="../commons/Nav.jsp" />
	<jsp:include page="../commons/sideBarBoard.jsp" />


	<div id="topSpace" style="height: 100px;"></div>
	<div id="tbody">
		<div id="count">총 게시물 ${ totalNum }개</div>
		<div id="searchBox">
			<div>
				<select name="searchType" id="searchType"
					onchange="getSearchType();">
					<option value="title" selected="selected">제목</option>
					<option value="date">날짜</option>
				</select> <input type="text" name="title" id="searchTitle">
				<button id="searchBtn">검색</button>
				<input type="hidden" value="${ pageInfo }">
			</div>
		</div>
		<br clear="all">
	</div>
	<br>

	<div id="setting">
		<br>
		<br>
		<br>
		<div class="container">
			<div class="row ml-1">
				<c:if test="${ empty bList and empty pList }">
					<h1 style="text-align: center;">조회할 게시글이 없습니다</h1>
				</c:if>
				<c:if test="${ !(empty bList) and !(empty pList) }">
					<c:forEach items="${ bList }" var="b">
						<c:forEach items="${ pList }" var="p">
							<c:if test="${ (b.boardNo eq p.boardNo) && (p.thumbnail eq 'Y')}">
								<div class="col-md-4 mb-5">
									<div class="card" style="width: 21rem;">
										<img src="resources/uploadFiles/${ p.fileRename }"
											class="card-img-top">
										<div class="card-body">
											<h5 class="card-title">NO. ${ b.boardNo }</h5>
											<h5 class="card-title">${ b.title }<br>
												<br>
											</h5>
											<h5 class="card-title">작성자 : ${ b.userId }</h5>
											<h5 class="card-title">조회수 : ${ b.boardView }</h5>
											<h5 class="card-title">작성일 : ${ b.updateDate }</h5>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:if>
				<c:if test="${ loginUser.isAdmin eq 'Y' }">
					<div id="adminBtn" style="text-align: right; padding-right: 40px;">
						<button onclick="location.href='${ contextPath }/write.at'"
							class="btn btn-dark">작성</button>
					</div>
				</c:if>
				            <div class="board_page" id="noSearchPaging">
                  <c:url var="goFirst" value="${ loc }">
                     <c:param name="page" value="${ pageInfo.startPage }" />
                  </c:url>
      
                  <a href="${ goFirst }" class="btn frist"><<</a>
      
                  <c:if test="${ pageInfo.currentPage > 1}">
                     <c:url var="goBack" value="${ loc }">
                         <c:param name="page" value="${ pageInfo.currentPage-1 }" />
                     </c:url>
                  </c:if>
      
                  <a href="${ goBack }" class="btn prew"><</a>
      
                  <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                     <c:url var="goNum" value="${ loc }">
                         <c:param name="page" value="${ p }" />
                     </c:url>
                     
                     <c:if test="${ pageInfo.currentPage eq  p }">
                           <a href="${ goNum }" class="num selected">${ p }</a>
                     </c:if>
                     <c:if test="${ pageInfo.currentPage ne  p }">
                           <a href="${ goNum }" class="num">${ p }</a>
                     </c:if>
                  </c:forEach>
      
                  <c:if test="${ pageInfo.currentPage <= pageInfo.endPage}">
                     <c:url var="goNext" value="${ loc }">
                           <c:param name="page" value="${ pageInfo.currentPage+1 }" />
                     </c:url>
                  </c:if>
      
                  <a href="${ goNext }" class="btn next">></a>
      
                  <c:url var="goLast" value="${ loc }">
                     <c:param name="page" value="${ pageInfo.endPage }" />
                  </c:url>
                  <a href="${ goLast }" class="btn last">>></a>
            </div>
              
             <div class="board_page" id="forSearchPagingD">
                 <c:url var="goFirst" value="${ loc }">
                     <c:param name="date" value="${ param.date }"/>
                     <c:param name="page" value="${ pageInfo.startPage }" />
                  </c:url>
      
                  <a href="${ goFirst }" class="btn frist"><<</a>
      
                  <c:if test="${ pageInfo.currentPage > 1}">
                     <c:url var="goBack" value="${ loc }">
                        <c:param name="date" value="${ param.date }"/>
                           <c:param name="page" value="${ pageInfo.currentPage-1 }" />
                     </c:url>
                  </c:if>
      
                  <a href="${ goBack }" class="btn prew"><</a>
      
                  <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                     <c:url var="goNum" value="${ loc }">
                        <c:param name="date" value="${ param.date }"/>
                           <c:param name="page" value="${ p }" />
                     </c:url>
                     <c:if test="${ pageInfo.currentPage eq  p }">
                           <a href="${ goNum }" class="num selected">${ p }</a>
                     </c:if>
                     <c:if test="${ pageInfo.currentPage ne  p }">
                           <a href="${ goNum }" class="num">${ p }</a>
                     </c:if>
                  </c:forEach>
      
                  <c:if test="${ pageInfo.currentPage <= pageInfo.endPage}">
                     <c:url var="goNext" value="${ loc }">
                        <c:param name="date" value="${ param.date }"/>
                           <c:param name="page" value="${ pageInfo.currentPage+1 }" />
                     </c:url>
                  </c:if>
      
                  <a href="${ goNext }" class="btn next">></a>
      
                  <c:url var="goLast" value="${ loc }">
                     <c:param name="date" value="${ param.date }"/>
                     <c:param name="page" value="${ pageInfo.endPage }" />
                  </c:url>
                  <a href="${ goLast }" class="btn last">>></a>
             </div>
             
             
               <div class="board_page" id="forSearchPagingT">
                 <c:url var="goFirst" value="${ loc }">
                     <c:param name="title" value="${ param.title }"/>
                     <c:param name="page" value="${ pageInfo.startPage }" />
                  </c:url>
      
                  <a href="${ goFirst }" class="btn frist"><<</a>
      
                  <c:if test="${ pageInfo.currentPage > 1}">
                     <c:url var="goBack" value="${ loc }">
                        <c:param name="title" value="${ param.title }"/>
                           <c:param name="page" value="${ pageInfo.currentPage-1 }" />
                     </c:url>
                  </c:if>
      
                  <a href="${ goBack }" class="btn prew"><</a>
      
                  <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                     <c:url var="goNum" value="${ loc }">
                        <c:param name="title" value="${ param.title }"/>
                           <c:param name="page" value="${ p }" />
                     </c:url>
                     <c:if test="${ pageInfo.currentPage eq  p }">
                           <a href="${ goNum }" class="num selected">${ p }</a>
                     </c:if>
                     <c:if test="${ pageInfo.currentPage ne  p }">
                           <a href="${ goNum }" class="num">${ p }</a>
                     </c:if>
                  </c:forEach>
      
                  <c:if test="${ pageInfo.currentPage <= pageInfo.endPage}">
                     <c:url var="goNext" value="${ loc }">
                        <c:param name="title" value="${ param.title }"/>
                           <c:param name="page" value="${ pageInfo.currentPage+1 }" />
                     </c:url>
                  </c:if>
      
                  <a href="${ goNext }" class="btn next">></a>
      
                  <c:url var="goLast" value="${ loc }">
                     <c:param name="title" value="${ param.title }"/>
                     <c:param name="page" value="${ pageInfo.endPage }" />
                  </c:url>
                  <a href="${ goLast }" class="btn last">>></a>
               </div>
             <br>
             <br>
			</div>
		</div>
	</div>

	<jsp:include page="../commons/footer.jsp" />

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

	<script>
		window.onload = () =>{
			const input = document.querySelector("input");
			const select = document.getElementsByClassName("card");
			const btn = document.getElementById('searchBtn');
			for(const num of select){
				num.addEventListener('click',function(){
					const boardNo = this.children[1].children[0].innerText.split(' ')[1];
					location.href="pictureDetail.at?boardNo=" + boardNo + "&page=" + ${ pageInfo.currentPage };
				})
			}
			
			if(document.getElementById('searchType').value == 'title'){
				const inputPlace = document.getElementById('inputPlace');
				input.addEventListener('keydown',function(e){
					if(e.key == 'Enter'){
						location.href="searchGalary.at?title=" + input.value;
					}
				})
				
				btn.addEventListener('click',function(){
					if(input.value != ''){
						location.href="searchGalary.at?title=" + input.value; 
					}
				}) 
			}
			
			
			if(window.location.href.split('/')[4][0] == 'm'){
				const a = document.getElementById('forSearchPagingT');
				a.style.display = 'none';
				const c = document.getElementById('forSearchPagingD');
				c.style.display = 'none';
				const b = document.getElementById('noSearchPaging');
				b.style.display = 'inline-block';
				
			}
			
			if(window.location.href.split('/')[4][0] == 's'){
				const b = document.getElementById('noSearchPaging');
				b.style.display = 'none';
				
				
				if(window.location.href.split('/')[4].split('?')[1][0] == 'd'){
					const a = document.getElementById('forSearchPagingT');
					a.style.display = 'none';
					const c = document.getElementById('forSearchPagingD');
					c.style.display = 'inline-block';
				}
				
				if(window.location.href.split('/')[4].split('?')[1][0] == 't'){
					const a = document.getElementById('forSearchPagingT');
					a.style.display = 'inline-block';
					const c = document.getElementById('forSearchPagingD');
					c.style.display = 'none';
				}
				
			}
			
		}
			
	 	const getSearchType = () =>{
	 		const input = document.querySelector("input");
			const btn = document.getElementById('searchBtn');
			const searchType = document.getElementById('searchType').value;
			
			if(searchType == 'title'){
				input.setAttribute("type", "text");
				input.setAttribute("name", "title");
				input.setAttribute("id", "searchTitle");
				input.addEventListener('keydown',function(e){
					if(e.key == 'Enter'){
						location.href="searchGalary.at?title=" + input.value;
					}
				})
				
				btn.addEventListener('click',function(){
					if(input.value != ''){
						location.href="searchGalary.at?title=" + input.value; 
					}
				})
			}
			
			if(searchType == 'date'){
				input.setAttribute("type", "date");
				input.setAttribute("name", "date");
				input.setAttribute("id", "searchDate");
				input.addEventListener('keydown',function(e){
					if(e.key == 'Enter'){
						location.href="searchGalary.at?date=" + input.value;
					}
				})
				
				btn.addEventListener('click',function(){
					if(input.value != ''){
						location.href="searchGalary.at?date=" + input.value; 
					}
				})
			}
		}
	</script>
</body>
</html>