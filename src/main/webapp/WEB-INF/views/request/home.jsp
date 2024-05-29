<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gothic+A1:wght@600&family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
<link href="resources/css/sohwa/userPage.css" rel="stylesheet" type="text/css">

<style>
    
   #wrapped{
      min-height:1000px;
   }
</style>
</head>
<body>
   
   <c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
   
<!-- ============================================header======================================================= -->


<jsp:include page="../commons/Nav.jsp"/>
   
<!-- ===================================================body======================================================= -->
   <div id="wrapped">
      
      <div id="logoDiv" class="splash-container">
         <div class="splash-text">
            <h5>카테고리 >> 상담신청</h5>
            <h1>상담신청</h1>
         </div>
      </div><br>
      
      <div id="imageDiv1">
         <span class="slideshow-container1">
                    <div class="Slidesbackground">
                          <div class="mySlides fade">
                             <img src="resources/image/pexels-tina-nord-7324407.jpg" class="slideshow-image">
                         </div>
                          <div class="mySlides fade">
                              <img src="resources/image/pexels-samson-katt-5257636.jpg" class="slideshow-image">
                          </div>
                          <div class="mySlides fade">
                              <img src="resources/image/pexels-samson-katt-5257634.jpg" class="slideshow-image">
                          </div>
                          <div class="mySlides fade">
                              <img src="resources/image/pexels-samson-katt-5257634.jpg" class="slideshow-image">
                          </div>
                          <div class="mySlides fade">
                              <img src="resources/image/pexels-samson-katt-5257595.jpg" class="slideshow-image">
                          </div>
                    </div>
                </span>
         </div>
      
      
      <div id="leftDiv">
         
         <br><br>
         
         <div id="leftTopDiv">
            
            <h2 style="text-align: left;" >상담 안내</h2>
            <p style="font-size: 15px;">어떤 서비스를 받아야 할 지 고민이신가요? <br>
            상담 신청해 주시면 전문 플래너가 영업일 기준 1~2일 이내로 전화 드립니다.</p>
            <hr><br>
            
            
            <div class="accordion" id="accordionPanelsStayOpenExample">
               
                 <div class="accordion-item">
                   <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                            #1 전화 상담
                        </button>
                   </h2>
                   <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
                        <div class="accordion-body">
                          첫 번째로, 전문 플래너가 이용하실 서비스의 스케줄을 확인 후, 전화로 연락을 드립니다.<br>
                          (호텔 예약의 경우, 따로 방문상담 하실 필요없이 전화상담으로만 진행 가능하십니다.<br>
                          이용가격 문의 같은 경우 아래 버튼을 클릭해주시면 이용료 안내 페이지로 넘어가게 됩니다.)<br>
                          <button type="submit" class="btn btn-outline-warning" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" onclick="location.href='${ contextPath }/insertRes.re'">이용료 보러가기</button>
                        </div>
                     </div>
                 </div>
                 
                 <div class="accordion-item">
                   <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo" >
                          #2 방문 상담
                        </button>
                   </h2>
                   <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
                        <div class="accordion-body">
                          방문일정이 잡힌 후, 보호자님과 함께 방문하는 반려견은 수석트레이너를 통해<br>
                          전문상담 및 간단한 훈련을 받게 됩니다.
                        </div>
                   </div>
                 </div>
                 
                 <div class="accordion-item">
                   <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                            #3 서비스 이용
                        </button>
                   </h2>
                   <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
                        <div class="accordion-body">
                          그 이후, 보호자님의 결정에 따라 입학여부를 결정하신 뒤 일정에 맞춰<br>
                          서비스를 이용해주시면 됩니다. 
                        </div>
                   </div>
                 </div>
                 
            </div>
            <br><br>
            <div style="text-align: center;"><button type="button" id="applyButton" class="btn btn-warning">GO TO APPLY</button></div>
            
         </div>
         
         
         <br><br><br><br>
         
         
         
         
         
         
         
         
         
      </div>
      
      
      
      <div id="rightDiv">
         
         <br><br>
         
         
         <h2 style="text-align: left;">실시간 신청 내역</h2>
         <p style="font-size: 15px;">실시간으로 신청이 올라오는 내역을 확인하실 수 있습니다.<br>
                              망설이지 말고, 편하게 신청하시면 친절하게 안내해드리겠습니다.</p>
         <hr><br><br>
         <div id="reUpdate">
            <div class="card mb-3" style="max-width: 600px; max-height:550px;">
                 <div class="row g-0">
                        <img src="resources/image/인절미 여러마리 하얀배경.jpg" class="img-fluid rounded-start" style="width:600px; height:200px;">
                      <div class="col-md-8" style="height:400px; width:600px; overflow: hidden;">
                      
                         <div style="height:330px; width:600px; overflow:hidden;">
                            <div class="card-body">
                                <h5 class="card-title">실시간 신청 내역</h5><hr>
                                <div>
                                 <table class="table">
                                    <thead>
                                       <tr>
                                          <th width="100px">작성자</th>
                                          <th width="200px">작성일자</th>
                                          <th width="200px">상담유형</th>
                                       </tr>
                                    </thead>
                                    <tbody></tbody>
                                 </table>
                              </div>
                              </div>
                         </div>
                           
                           
                      </div>
                 </div>
            </div>
            
                           
         </div>
         
      </div>
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      <jsp:include page="../commons/footer.jsp"/>
   </div>
<!-- =============================================footer================================================ -->


   
<!-- ================================script===================================== -->
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
   
   <script>
      var slideIndex = 0;
       showSlides();

       function showSlides() {
           var i;
           var slides = document.getElementsByClassName("mySlides");
       
           for (i = 0; i < slides.length; i++) {
               slides[i].style.display = "none";
           }
             slideIndex++;
           if (slideIndex > slides.length) {
               slideIndex = 1
           }
           slides[slideIndex - 1].style.display = "block";
    
           setTimeout(showSlides, 3000); // 2초마다 이미지가 체인지
          }
         
      </script>
      
      
      <script>
         document.addEventListener('DOMContentLoaded', () => {
          const splashText = document.querySelector('.splash-text');

           setTimeout(() => {
             splashText.style.opacity = '1';
             splashText.style.transform = 'translateY(0)';
             createSmoke(splashText);
           }, 500);

           function createSmoke(container) {
             const smoke = document.createElement('div');
             smoke.classList.add('smoke');
             container.appendChild(smoke);

             const x = container.clientWidth / 2;
             const y = container.clientHeight / 2;

             smoke.style.left = `${x}px`;
             smoke.style.top = `${y}px`;

             setTimeout(() => {
                  smoke.remove();
             }, 1000);
           }
      })
      
      
      
      document.getElementById('applyButton').addEventListener('click', ()=>{
         const userId = '${loginUser.userId}'
         if(userId.trim()==""){
            alert('로그인 후 이용하실 수 있습니다.');
            location.href='${ contextPath }/loginView.me';
         }else{
              location.href='${ contextPath }/counselRequest.do';
         }

      })
      
      
      
      
      
      
      
      const updateList = () => {
          $.ajax({
              url: '${contextPath}/updateList.do',
              success: (data) => {
                  const tbody = document.querySelector('tbody');
                  const visibleRows = 5; // 표시할 행의 개수
                  const rotationInterval = 1000; // 순환 간격 (밀리초)
      
                  let currentIndex = 0;
      
                  const rotateRows = () => {
                      // 테이블에 5개의 행 추가
                      for (let i = 0; i < visibleRows; i++) {
                          const r = data[currentIndex];
                          if (!r) break; // 데이터가 없으면 종료
      
                          const tr = createTableRow(r);
                          tbody.appendChild(tr);
                          fadeIn(tr); // 페이드 인 애니메이션 적용
                          currentIndex = (currentIndex + 1) % data.length; // 인덱스 업데이트
                      }
      
                      // 첫 번째 행 삭제 (행을 위로 이동하는 효과)
                      if (tbody.children.length > visibleRows) {
                          fadeOutAndRemove(tbody.children[0]); // 페이드 아웃 및 삭제 애니메이션 적용
                      }
                  };
      
                  const createTableRow = (r) => {
                      const tr = document.createElement('tr');
                      const writerTd = document.createElement('td');
                      writerTd.innerText = r.userName;
      
                      const requestTime = document.createElement('td');
                      requestTime.innerText = r.requestTime;
      
                      const typeTd = document.createElement('td');
                      typeTd.innerText = (r.consultingType == 'A') ? "유치원 입학상담" : "호텔 예약상담";
      
                      tr.appendChild(writerTd);
                      tr.appendChild(requestTime);
                      tr.appendChild(typeTd);
      
                      return tr;
                  };
      
                  // fadeIn 애니메이션 함수
                  const fadeIn = (element) => {
                      element.style.opacity = '0'; // 초기에 투명도를 0으로 설정하여 페이드 인 효과 적용
                      element.style.transition = 'opacity 1s ease-in-out'; // CSS transition을 사용하여 애니메이션 적용
                      setTimeout(() => {
                          element.style.opacity = '1';
                      }, 10); // setTimeout을 사용하여 효과적으로 애니메이션 트리거
                  };
      
                  // fadeOutAndRemove 애니메이션 함수
                  const fadeOutAndRemove = (element) => {
                      element.style.opacity = '0'; // 페이드 아웃 효과 적용
                      element.style.transition = 'opacity 1s ease-in-out'; // CSS transition을 사용하여 애니메이션 적용
                      setTimeout(() => {
                          element.remove(); // 일정 시간 후에 요소 삭제
                      }, 1000); // 1초 후 삭제 (페이드 아웃과 동일한 시간 설정)
                  };
      
                  // 초기 5개의 행 표시
                  rotateRows();
      
                  // 1초마다 5개의 행 순환
                  setInterval(() => {
                      rotateRows();
                  }, rotationInterval);
              },
              error: (data) => console.log(data)
          });
      };
      
      window.onload = () => {
          updateList();
      };
      
      
      
      
      
      
      
            
      </script>
      
      
</body>
</html>