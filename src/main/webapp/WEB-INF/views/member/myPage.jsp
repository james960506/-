<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 페이지</title>
<style>
body {
   margin: 0;
   padding: 0;
   background-color: white;
}

.마이페이지 {
   max-width: 800px;
   margin: 50px auto;
   padding: 20px;
   border-radius: 15px;
   box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

h2 {
   color: #333;
   text-align: center;
   padding: 17px 0;
   margin: 0;
   background-color: #fff080;
   border-radius: 10px;
}

table {
   width: 100%;
   border-collapse: collapse;
   margin-top: 20px;
}

th, td {
   padding: 12px;
   border: 1px solid #ddd;
   text-align: center !important;
}

th {
   background-color: #ffef99;
}

tr:nth-child(even) {
   background-color: #f9f9f9;
}

tr:hover {
   background-color: #f1f1f1;
}
.sidebar {
	text-align: left;
	position: fixed;
	top: 50%;
	transform: translateY(-50%);
	left: 30px;
	height: 400px;
	width: 250px !important;
	padding-top: 10px;
	background-color: #fff9c4;
	border-radius: 8px;
	border-right: 1px solid #dee2e6;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>

</head>
<body>

   <jsp:include page="../commons/side.jsp" />
   <jsp:include page="../commons/Nav.jsp" />

   <div id="settingForHeader"></div>
   <div class="마이페이지">
      <h2>내 프로필</h2>
      <table>
         <tr>
            <td>ID</td>
            <td>${ m.userId }</td>
         </tr>
         <tr>
            <td>이름</td>
            <td>${ m.uName }</td>
         </tr>
         <tr>
            <td>전화번호</td>
            <td>${ m.phone }</td>
         </tr>
         <tr>
            <td>생일</td>
            <td>${ m.birth }</td>
         </tr>
         <tr>
            <td>주소</td>
            <td>${ fn:split(m.address, '@')[0] }${ fn:split(m.address, '@')[1] }
               ${ fn:split(m.address, '@')[2] } ${ fn:split(m.address, '@')[3] }</td>
         </tr>
         <tr>
            <td>가입날짜</td>
            <td>${ m.joinDate }</td>
         </tr>
         <tr>
            <td>Email</td>
            <td>${ m.email }</td>
         </tr>
      </table>
      <br>
      <h2>강아지 정보</h2>
      <table>
         <c:if test="${!empty d}">
            <tr>
               <th>이름</th>
               <th>크기</th>
               <th>견종</th>
            </tr>
            <c:forEach items="${ d }" var="d">
               <tr>
                  <td>${ d.dogName }</td>
                  <td>${ d.dogSize }</td>
                  <td>${ d.breed }</td>
               </tr>
            </c:forEach>
         </c:if>
         <c:if test="${ empty d }">
            <tr>
               <td colspan="8" rowspan="3"><h1>등록된 강아지 정보가 없습니다</h1></td>
            </tr>
            <tr></tr>
            <tr></tr>
         </c:if>
      </table>
   </div>

   <div id="forFooterSetting"></div>

   <jsp:include page="../commons/footer.jsp" />
</body>
</html>