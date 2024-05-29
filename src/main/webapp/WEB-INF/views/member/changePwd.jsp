<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="resources/css/member/changePwd.css" rel="stylesheet" type="text/css">
</head>
<body>
   <form class="form" action="changePwd.me" method="POST">
        <div class="logo">
            <img src="resources/image/logo.png">
         </div>
         <div class="title"><label>비밀번호 변경</label></div>
       
          <table class="table">
            <tr><td>
               <input type="hidden" value="${m.userId }" name="userId">
               <input type="password" placeholder="새 비밀번호" name="pwd" id="pwd" autofocus>
            </td></tr>
            <tr><td><input type="password" placeholder="비밀번호 확인" name="pwd2" id="pwd2" autofocus onblur="focusOut();"></td></tr>
            <tr><td><button type="submit" id="changePwd">비밀번호 변경</button> </td></tr>
      </table>
   </form>
   
   <script>
      window.onload = () =>{
         let msg = "${msg}";
         if(msg != ""){
            alert(msg);
         }
         msg = "";
      }
   </script>
   
      <script>
       <!-- 비밀번호 확인 + 정규식 -->
       checkId = false;
       checkPwd = false;
      function focusOut(){
         let pwd = document.getElementById("pwd");
           let pwd2 = document.getElementById("pwd2");
          let pwdcheck = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#%^&*])[A-Za-z\d!@#%^&*]{8,}$/;
          console.log(pwd2.value == pwd.value);
         if(pwd2.value.trim() == ''){      // 비밀번호 입력안하고
         
         } else if(pwd2.value != pwd.value || !pwdcheck.test(pwd.value)) {   
            pwd.style.borderColor = 'red';
            pwd2.style.borderColor = 'red';
            alert('비밀번호는 영대소문자,숫자, 특수문자로 구성된 8글자 이상으로 조합하시오.')
            checkPwd = false;
         } else if(pwd2.value == pwd.value && pwdcheck.test(pwd.value)){                                       
            pwd.style.borderColor = 'green';
            pwd2.style.borderColor = 'green';
            checkPwd = true;
         } 
      }
   
      <!-- 버튼 클릭 시 아이디 비밀번호 체크 후 넘어감 -->
      const checkForm = ()=>{
         if(checkId == true && checkPwd == true){
            location.href='myInfo.me'
         } else {
            return false;
         }
      }

   </script>
   
   
</body>
</html>