<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/member/child.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
   label{color: gray;}
   
</style>
</head>
<body>
   <div class="title">반려견 정보 추가</div>
   <div class="info">소형 / 중형(5.1kg~15kg) / 대형(15.1~28kg) / 초대형(28.1kg~)</div>
   <div><hr></div>
   
   <table>
      <thead class="thead">
         <tr>
            <td><input type="text" name="dogName" id="dogName" placeholder="강아지 이름" style="width:150px;"></td>
            <td>
               <select id="dogSize" name="dogSize">
                  <option value="소형견" selected>소형</option>
                  <option value="중형견">중형</option>
                  <option value="대형견">대형</option>
                  <option value="초대형견">초대형</option>
               </select>
            </td>
            <td><input type="text" id="breed" name="breed" placeholder="견종" style="width:200px;"></td>
            <td><button onclick="newRegister();" required id="plus_info">추가</button></td>
         </tr>
      </thead>
      <tbody class="tbody"></tbody>   
      <tfoot class="tfoot"></tfoot>
   </table>

   <hr>

   <div id="info_List"></div>
   <div id="info_List2"></div>
   
   <input type="button" onclick="window.close()" value="창닫기" id="window_c">
   <button type="submit" id="finish" onclick="insertDog()">저장</button>

   
   <script>
      // 기존 배열 불러오는것 - controller에 묶인 dogArr불러옴
      ex_dogArr = [];
      window.onload = () =>{
         const tbody = document.querySelector("tfoot");
          <c:forEach items="${ list }" var="d">
             ex_dogArr.unshift({dogName : "${d.dogName}",
                         dogSize : "${d.dogSize}",
                         breed : "${d.breed}"});
             var tr = document.createElement("tr");
             var nameTd = document.createElement('td');
             nameTd.innerText = "${d.dogName}";
             var sizeTd = document.createElement("td");
             sizeTd.innerText = "${d.dogSize}";
             var breedTd = document.createElement("td");
             breedTd.innerText = "${d.breed}";
             
             tr.append(nameTd);
             tr.append(sizeTd);
             tr.append(breedTd)
             
             tbody.append(tr);
             
             var delBttn = document.createElement("td");
             var delText = document.createTextNode("삭제");
             delBttn.setAttribute("class","del");
             delBttn.appendChild(delText);
             tr.appendChild(delBttn);
         </c:forEach>
      
          // 6단계 삭제 기능 작성
          var removeBttns = document.querySelectorAll(".del");
          for(i=0;i<removeBttns.length;i++){
              removeBttns[i].addEventListener("click", function(){
                  if(this.parentNode.parentNode){      // 현재 노드(this)의 부모노드의 부모노드가 있을 경우 실행
                     let td = this.previousSibling.previousSibling.previousSibling.innerText;
                     this.parentNode.parentNode.removeChild(this.parentNode);
                     ex_dogArr.forEach((item, index)=>{
                        if(item.dogName == td){
                           ex_dogArr.splice(index, 1);
                        }
                     });
                    console.log(ex_dogArr);
                  }
              });
          }
      }
      
      dogArr = [];    // 입력한 반려견정보(이름, 견종, 크기)를 담을 배열                                       
      function newRegister(){
         let arr = new Array();
         const tbody = document.querySelector("tbody");
         // insertDog
         const dogName = document.getElementById("dogName");
         const dogSize = document.getElementById("dogSize");
         const breed = document.getElementById("breed");
         if(dogName.value.trim() == "" || breed.value.trim() == ""){
            alert("반려견 정보를 입력해 주세요");
         }else{
            const dogObj = {   
                  dogName : dogName.value,
                  dogSize : dogSize.value,
                  breed : breed.value
            };
            dogArr.unshift(dogObj);            // DB에 마지막부터 저장된다
            
            // 입력한 반려견 정보를 리스트에 출력
             var tr = document.createElement('tr');
             var nameTd = document.createElement('td');
             nameTd.innerText = dogName.value;   // 반려견 이름
             var sizeTd = document.createElement("td");
             sizeTd.innerText = dogSize.value;   // 크기
             var breedTd = document.createElement("td");
             breedTd.innerText = breed.value;   // 견종 목록 생성
             
             // tr에 입력한 값을 넣는다
             tr.append(nameTd);
             tr.append(sizeTd);
             tr.append(breedTd);
             tbody.prepend(tr);
             // 입력한 정보로 리스트를 만들고 입력칸 비워줌
             dogName.value = "";
             breed.value = "";
         
             // 리스트에서 삭제하는 버튼 생성
             var delBttn = document.createElement("td");
             var delText = document.createTextNode("삭제");
             delBttn.setAttribute("class","del");
             delBttn.appendChild(delText);
             tr.appendChild(delBttn);
         
             // 반려견 정보 삭제
             var removeBttns = document.querySelectorAll(".del");
             for(i=0;i<removeBttns.length;i++){
                 removeBttns[i].addEventListener("click", function(){
                     if(this.parentNode.parentNode){
                        let td = this.previousSibling.previousSibling.previousSibling.innerText;   
                        // tbody의 자식(tr) 삭제 / 출력된 리스트에서만 삭제된다                        
                        this.parentNode.parentNode.removeChild(this.parentNode);   
                        // 배열에서 삭제한다(td = 강아지 이름)
                         dogArr.forEach((item, index)=>{   
                           if(item.dogName == td){
                              dogArr.splice(index, 1);
                           }
                        });
                     }
                 });
             }
         }
      }
      
      const insertDog = () =>{
         let newArr = [...ex_dogArr, ...dogArr];
          $.ajax({
             anyne: true,
             url:"insertChild.me",
             type:"POST",
             data: JSON.stringify(newArr),
             contentType:"application/json",
             success: (data) =>{
                console.log(data);
             },
             error: (data) =>{
                console.log("에러"+data)
             }
          });
      }
      </script>
      
   
   
</body>
</html>