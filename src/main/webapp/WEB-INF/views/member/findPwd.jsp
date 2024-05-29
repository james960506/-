<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="resources/css/member/findPwd.css" rel="stylesheet" type="text/css"></head>
</head>
<body>
   <form class="form" action="selectfindPwd.me" method="POST" onsubmit="return checkEmail()">
        <div class="logo">
         <img src="resources/image/logo.png">
      </div>
      <div class="title"><label>비밀번호 찾기</label></div>
       
       <table class="table">
         <tr><td><input type="text" placeholder="아이디" name="userId" id="userId" autofocus></td></tr>
         <tr>
            <td><input type="email" id="email" name="email" placeholder="이메일" >
             <input type="button" id="mail-Check-Btn" value="인증하기"></td>
         </tr>
         <tr><td><input type="text" id="EmailCheckNo" placeholder="인증번호 입력"></td></tr>
         <tr><td><input type="submit" id="deleteBtn" value="비밀번호 변경"></td></tr>
      </table>
   </form>
   
   
   <script>
      const mailCheck = document.getElementById('mailCheckNo');
      let checkE=false;
      
      function checkEmail() {
         
         if(checkE){
            return true;
         }else{
            alert("이메일 인증을 먼저 완료해주세요.");
            return false;
         }
      }
      const equals = () =>{
         if(mailCheck == code){
            location.href='changePwd.me?userid=' + userId;
         }
      }
   </script>
   
   <script>
      window.onload=()=>{
         
         let msg = "${msg}";
         if(msg != ""){
            alert(msg);
         }
         msg = "";
         
         
         let code="";
         
         console.log(checkE);
         
           /*누른경우에만  체크 해줘야 함*/
           let check_button=false;
           /*인증체크하는곳*/
           $('#mail-Check-Btn').click(function() {
               const checkInput = $('.mail-check-input');    // 인증번호 입력하는곳 
               check_button=true;
               console.log(document.getElementById('email').value);
               $.ajax({
                  type : 'get',
                   url : 'mailCheck.me',                // GET방식이라 Url 뒤에 email을 뭍힐수있다.
                   data: {Email:document.getElementById('email').value},
                   success : function (data) {
                      console.log("data : " +  data);
                       checkInput.attr('disabled',false);
                       code =data;
                       alert('인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.')
                    }         
            }); 
           }); 
           
           /* 받아온 랜덤 코드를 비교하는 부분 인증코드 input에서 포커스를 잃었을시 확인*/
           $('#EmailCheckNo').blur(function () {
               console.log(code);
               let inputCode = this.value;
               if(check_button){
                  if(inputCode == code){
                     checkE=true;
                     console.log(checkE);
                     $('#EmailCheckNo').css("borderColor", "green");
                  } else {
                     checkE=false;
                     $('#EmailCheckNo').css("borderColor", "red");
                   }
               }
           });
      }
   </script>
   
</body>
</html>