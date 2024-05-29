<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath"
	 scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>td:hover{cursor: pointer;}</style>
<link rel="stylesheet" href="resources/css/ming/noticeList.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Nanum+Myeongjo&family=Noto+Serif+TC:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<jsp:include page="../commons/Nav.jsp"/>
		<div class="board_wrap">
	        <div class="board_title">
	            <strong>공지사항</strong>
	            <p>공지사항을 빠르고 정확하게 안내드립니다.</p>
	        </div>
	        <div class="board_list_wrap">
	            <div class="board_list">
			    	<div class="top">
			         	<div class="num" >번호</div>
	                    <div class="title" >제목</div>
	                    <div class="writer" >글쓴이</div>
	                    <div class="date" >작성일</div>
	                    <div class="count">조회</div>
	                </div>
		        	<tbody>
		        	<c:forEach items="${list}" var="n">
			      		 <div class="list-select">
			             	<div class="num">${n.noticeNo }</div>
			                <div class="title">${n.noticeTitle }</div>
			                <div class="writer">${n.userId }</div>
			                <div class="date">${n.noticeModifyDate }</div>
			                <div class="count">${n.noticeCount }</div>
	              		</div>
		           </c:forEach>
	            	</tbody>
	            </div>
		     </div>
		     <div class="search">
		     	<form action="search.bo" method="POST" class="form">
		     		<select name="searchType">
						<option value="search">검색기준</option>
		     			<option value="userId" name="userId"
		     				<c:if test="${searchType eq 'userId' }">selected</c:if>>글쓴이</option>
		     			<option value="noticeTitle" name="noticeTitle"
		     				<c:if test="${searchType eq 'noticeTitle' }">selected</c:if>>제목</option>
		     		</select>
		     		<input type="text" name="keyword">
					<button type="button" id="searchMem">검색</button>
		     	</form>
	            <div class="board_page">
		            <c:url var="fristPage" value="${loc }">
		            	<c:param name="page" value="${pi.startPage }"/>
		            </c:url>
		                <a href="${ fristPage}" class="btn frist"><<</a>
		            <c:if test="${ pi.currentPage > 1 }">           
	               <c:url var="goBack" value="${ loc }">
	                    <c:param name="page" value="${pi.currentPage -1 }"/>
	                 </c:url>
	              </c:if>
	              <a href="${goBack}" class="btn prew"><</a>
	              
		          <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:url var="pageNum" value="${loc }">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<c:if test="${pi.currentPage eq p }">
						<a href="${ pageNum }" class="num selected" >${ p }</a>
					</c:if>
					<c:if test="${!(pi.currentPage eq p )}">
						<a href="${ pageNum }" class="num" >${ p }</a>
					</c:if>
					</c:forEach>
					 <c:if test="${ pi.currentPage < pi.endPage }">
	               		<c:url var="goNext" value="${loc}">
	                 		<c:param name="page" value="${pi.currentPage +1 }"/>
	              		</c:url>
	           		</c:if>
	            	<a href="${ goNext }" class="btn next">></a>
	
		            <c:url var="endPage" value="${loc }">
		            	<c:param name="page" value="${pi.endPage }"/>
		            </c:url>
		                <a href="${ endPage}" class="btn last">>></a>
	            </div>
	            <%-- <c:if test="${loginUser.isAdmin == 'Y'}"> --%>
		            <div class="bt_wrap">
	                    <button  onclick="location.href='${ contextPath }/writeNotice.bo" id="sub-btn" class="on">등록</button>   
	               </div>
		                <!-- <a href="edit.html">수정</a> -->
		        <%-- </c:if> --%>
	        </div>
	    </div>
	
	`	<script>
			document.getElementById('searchMem').onclick = function() {
				let searchType = document.getElementsByName("searchType")[0].value;
				let keyword = document.getElementsByName("keyword")[0].value;
				
				console.log(searchType);
				console.log(keyword);
				
				location.href = 'search.bo?searchType=' + searchType + '&keyword=' + keyword;
			}
			
			window.onload = ()=> {
				const btn = document.getElementById('sub-btn');
				btn.addEventListener('click', ()=>{
					location.href='${ contextPath }/writeNotice.bo';
				})
	    	   
	    	   const parentDivs = document.getElementsByClassName('list-select');
	    	   for (const parentDiv of parentDivs) {
	    		   parentDiv.addEventListener('click', function (){
	    			   const divs = parentDiv.children;
	    			   const noticeNo = divs[0].innerText;
	    			   console.log(noticeNo);
	    			   location.href='${contextPath}/selectNotice.bo?noticeNo=' + noticeNo + "&page=" +${pi.currentPage};
	    		   })
	    	       
	    	   }
	    		   
	    	  
	    	}
		</script>
		<jsp:include page="../commons/footer.jsp"/>
</body>
</html>