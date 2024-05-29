package com.kh.dog.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.dog.common.Pagination;
import com.kh.dog.exception.RequestException;
import com.kh.dog.main.model.service.RequestService;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Request;
import com.kh.dog.member.model.vo.Member;


/**
 * Handles requests for the application home page.
 */
@Controller
public class RequestController {
   
   @Autowired
   private JavaMailSender mailSender;

   
   @Autowired
   private RequestService rService;
   
   @RequestMapping("requestMain.do")
   public String homeView(Model model, HttpSession session) {
      Member m = (Member)session.getAttribute("loginUser");
      model.addAttribute("loginUser", m);
      return "home";
   }
   
   
   @RequestMapping("counselRequest.do")
   public String requestView(Model model, HttpSession session) {
      Member m = (Member)session.getAttribute("loginUser");
      
      
      if(m!=null) {
         model.addAttribute("loginUser", m);
         return "counselRequest";
      }else {
         model.addAttribute("msg", "로그인 후 이용해주세요");
         return "counselRequest";
      }
      
      
      
   }
   
   @RequestMapping("insertRequest.do")
   public String insertRequest(@ModelAttribute Request r, Model model, @RequestParam("day") String day, @RequestParam("time") String time, HttpSession session) {
      String id = ((Member)session.getAttribute("loginUser")).getUserId();
      
      String requestTime = null;
      
      if(day != null) {
         requestTime = day + "/" + time;
      }
      
      r.setRequestTime(requestTime);
      r.setUserId(id);
      
      
      int result = rService.insertRequest(r);
      
      if(result > 0) {
         return "redirect:myRequest.do";
      }else {
         throw new RequestException("상담신청 도중 오류가 발생했습니다.");
      }
      
   }
   
   @RequestMapping("updateList.do")
   public void updateList(HttpServletResponse response) {
      
      ArrayList<Request> list = rService.updateList();
      GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
      Gson gson = gb.create();
      
      response.setContentType("application/json; charset=UTF-8");
      
      try {
         gson.toJson(list, response.getWriter());
      } catch (JsonIOException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
   }
   
   
   @RequestMapping("myRequest.do")
   public String selectMyList(@RequestParam(value="page", defaultValue="1") int page, Model model, HttpSession session) {
      
      String id = ((Member)session.getAttribute("loginUser")).getUserId();
      
      int listCount = rService.getListCount(id);
         
      int currentPage = page;
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
      
      ArrayList<Request> list = rService.selectMyList(pi, id);
      
      
      if(list != null) {
         model.addAttribute("pi", pi);
         model.addAttribute("list", list);
         return "userMyPage";
      }else{
         throw new RequestException("내 상담내역 조회를 실패하였습니다.");
      }
      
   }
   

   
   
   @RequestMapping("userDeleteRequest.do")
   public String userDeleteRequest(@RequestParam("requestNo") int requestNo) {
      int result = rService.userDeleteRequest(requestNo);
      
      
      if(result > 0) {
         return "redirect:myRequest.do";
      }else {
         throw new RequestException("상담내역 삭제에 실패하였습니다.");
      }
      
   }
   
   
   @RequestMapping("userUpdateRequest.do")
   public String userUpdateRequest(@RequestParam("requestNo") int requestNo, Model model){
      
      Request r = rService.selectRequest(requestNo);
      r.setRequestNo(requestNo);
      model.addAttribute("r", r);
      return "updateRequest";
   }
   
   
   @RequestMapping("updateRequest.do")
   public String updateRequest(@ModelAttribute Request r, @RequestParam("day") String day, @RequestParam("time") String time) {
      String requestTime = null;
      if(day != null) {
         requestTime = day + "/" + time;
      }
      r.setRequestTime(requestTime);
      System.out.println(r);
      
      int result = rService.updateRequest(r);
      
      if(result > 0) {
         return "redirect:myRequest.do";
      }else {
         throw new RequestException("상담내역 수정에 실패하였습니다.");
      }
   }
   
   
   
   @RequestMapping("adminDetail.do")
   public String adminDetail(@RequestParam("requestNo") int requestNo, Model model) {
      Request r = rService.selectAdminDetail(requestNo);
      
      if(r != null) {
         model.addAttribute("r", r);
         return "adminDetail";
      }else {
         throw new RequestException("상담내역 조회에 실패하였습니다.");
      }
      
   }
   
   
   
   @RequestMapping("acceptRequest.do")
    public String acceptRequest(@RequestParam("requestNo") int requestNo) throws Exception{
      Request r = rService.selectRequest(requestNo);
      rService.acceptRequest(requestNo);
         
           String subject = "멍놀먹자 상담신청 결과";
           String content = "고객님이 요청하신 날짜로 상담예약이 성공하셨습니다! 잊지말고 방문해주세요:)";
           String from = "gah_yn@naver.com";
           
           try {
               MimeMessage mail = mailSender.createMimeMessage();
               MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
               
               mailHelper.setFrom(from);

               mailHelper.setTo(r.getEmail());
               mailHelper.setSubject(subject);
               mailHelper.setText(content, true);
               
               
               mailSender.send(mail);
               
           } catch(Exception e) {
               e.printStackTrace();
           }
        
           return "redirect:adminList.do";
       }

   
   
   @RequestMapping("refuseRequest.do")
    public String refuseRequest(@RequestParam("requestNo") int requestNo) throws Exception{
      Request r = rService.selectRequest(requestNo);
      rService.refuseRequest(requestNo);
         
           String subject = "멍놀먹자 상담신청 결과";
           String content = "고객님이 요청하신 날짜는 이미 다른 고객님의 상담신청이 예약되어있습니다. 다른 날짜에 다시 신청해주시면 감사하겠습니다!";
           String from = "gah_yn@naver.com";
           
           try {
               MimeMessage mail = mailSender.createMimeMessage();
               MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
               
               mailHelper.setFrom(from);

               mailHelper.setTo(r.getEmail());
               mailHelper.setSubject(subject);
               mailHelper.setText(content, true);
               
               
               mailSender.send(mail);
               
           } catch(Exception e) {
               e.printStackTrace();
           }
        
           return "redirect:adminList.do";
       }
   

   @RequestMapping(value="deleteList.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   public void deleteList(HttpServletResponse response, @RequestParam("checkBoxArr") List<String> checkBoxArr) {
      
      GsonBuilder gb = new GsonBuilder();
      Gson gson = gb.create();
      response.setContentType("application/json; charset=UTF-8");
      
      try {
         gson.toJson(checkBoxArr, response.getWriter());
//         System.out.println(checkBoxArr);
      } catch (JsonIOException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
   }
   
   
   @RequestMapping("adminList.do")
   public String adminListView(@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="adminStatus", defaultValue="A") String adminStatus, Model model) {
      
      int listCount = rService.getAdminList(adminStatus);
      
      int currentPage = page;
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
      
      ArrayList<Request> list = rService.selectAdminList(pi, adminStatus);
      
      
      if(list != null) {
        model.addAttribute("page", page);
         model.addAttribute("pi", pi);
         model.addAttribute("list", list);
         model.addAttribute("adminStatus", adminStatus);
         return "adminList";
      }else{
         throw new RequestException("내 상담내역 조회를 실패하였습니다.");
      }
      
   }
   
   @ResponseBody
   @RequestMapping(value="deleteList.do", method=RequestMethod.POST)
    public String deleteList(@RequestBody List<Integer> checkBoxArr) {
        // checkBoxArr에는 선택된 체크박스의 값들이 들어 있습니다.
        // 예를 들어, 선택된 체크박스의 ID값 등을 사용하여 해당 데이터를 삭제합니다.
//        for (String checkBoxValue : checkBoxArr) {
//            // 여기서 checkBoxValue를 사용하여 데이터를 삭제하는 로직을 구현합니다.
//            // 예: 데이터베이스에서 해당 ID값을 이용해 데이터 삭제
//            rService.deleteDataById(checkBoxValue);
//        }
      rService.deleteCheck(checkBoxArr);
        // 삭제 작업 완료 후 클라이언트에게 성공 메시지를 반환합니다.
        return "삭제가 완료되었습니다.";
    }
   
   
   
   
   


   
}