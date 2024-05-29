<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/sohwa/adminList.css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="../commons/manager_header.jsp"></jsp:include>
    <div class="board_wrap">
        <div class="board_title">
            <strong style="font-size:30px;">상담신청 상세</strong>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <input type="hidden" value="${r.requestNo }">
                <div class="info">
                   <dl>
                      <dt style="font-size:20px;">요구 시간</dt>
                      <dd><input type="text" readonly="readonly" value="${r.requestTime }"></dd>
                   </dl>
                    <dl>
                        <dt style="font-size:20px;" class="name">신청자 성함</dt>
                        <dd><input type="text" readonly="readonly" style="width:200px;" value="${r.userName }"></dd>
                    </dl>
                    <dl>
                        <dt style="font-size:20px;">상담 유형</dt>
                        <dd><input type="text" readonly="readonly" value="${r.consultingType=='A' ? '유치원 입학 상담' : '호텔 예약 상담'}"></dd>
                    </dl>
                    <dl>
                        <dt style="font-size:20px; width:150px;">신청자 이메일</dt>
                        <dd><input type="text" readonly="readonly" style="width:380px;" value="${r.email }"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea readonly="readonly">${r.dogInfo }</textarea>
                </div>
            </div>
            <c:if test="${r.adminStatus eq 'Q' || r.adminStatus eq 'A'}">
               <div class="bt_wrap">
                   <button id="acceptButton" >승낙</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <button id="refuseButton" style="background-color:black; color:white;">거절</button>
               </div>
            </c:if>
        </div>
    </div>
     <jsp:include page="../commons/manager_footer.jsp"></jsp:include>
    <script>
       window.onload=()=>{
          const acceptButton = document.getElementById('acceptButton');
          const refuseButton = document.getElementById('refuseButton');
          const val = document.querySelector('input[type="hidden"]').value;
          
          acceptButton.addEventListener('click', ()=>{
             const form = document.createElement('form');
             form.method = 'POST';
             form.action = 'acceptRequest.do';
                         
             const input = document.createElement('input');
             input.type = 'hidden';
             input.name = 'requestNo';
             input.value = val;
                         
             form.appendChild(input);
             document.body.appendChild(form);
                      
             form.submit();
          });
          
          refuseButton.addEventListener('click', ()=>{
             const form = document.createElement('form');
             form.method = 'POST';
             form.action = 'refuseRequest.do';
                         
             const input = document.createElement('input');
             input.type = 'hidden';
             input.name = 'requestNo';
             input.value = val;
                         
             form.appendChild(input);
             document.body.appendChild(form);
                      
             form.submit();
          })
          
          
       }
    </script>

</body>
</html>