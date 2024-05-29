package com.kh.dog.main.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dog.common.Pagination;
import com.kh.dog.main.model.service.ReservationService;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reservation;
import com.kh.dog.member.model.vo.Dog;
import com.kh.dog.member.model.vo.Member;

@Controller
public class ReservationController {

	@Autowired
	ReservationService rService;

	// 예약하기
	@RequestMapping(value = "insertRes.re", method = RequestMethod.GET)
	public String insertRes(Model model, HttpSession session) {
		Integer rno = rService.selectLastRno();
		if (rno.equals(null)) {
			rno = 1;
		}
		if(session.getAttribute("loginUser") != null) {
			String id = ((Member) session.getAttribute("loginUser")).getUserId();
			ArrayList<Dog> list = rService.selectDog(id);
			model.addAttribute("dList", list);
		}
		model.addAttribute("rno", rno);
		return "reservation";
	}

	// Ajax 예약잔여수 조회
	@RequestMapping("checkCount.re")
	@ResponseBody
	public int checkCount(@RequestParam(value = "startToLast[]") String[] searchArr, Model model,
			HttpServletResponse response) {
		int count = rService.checkCount(searchArr);
		return count;
	}

	// Ajax 결제금액 조회
	@RequestMapping("selectCost.re")
	@ResponseBody
	public int selectCost(@RequestParam(value = "cboxValue[]", required = false) String[] cboxValue, Model model,
			HttpServletResponse response) {
		if (cboxValue == null) {
			return 0;
		}
		System.out.println("체크박스 " + Arrays.toString(cboxValue));
		int result = rService.selectCost(cboxValue);
		return result;
	}

	// 예약완료
	@RequestMapping("selectRes.re")
	public String comPayment(Reservation res, @RequestParam int sTLLength, Model model) {
		int result = rService.insertRes(res);
		res.setDnos(Integer.toString(res.getDnos().split("/").length));
		String[] outDateArr = res.getOutDate().toString().split("-");
		String[] inDateArr = res.getInDate().toString().split("-");
		String outDate = outDateArr[0] + "년 " + outDateArr[1] + "월 " + outDateArr[2] + "일";
		String inDate = inDateArr[0] + "년 " + inDateArr[1] + "월 " + inDateArr[2] + "일";
		model.addAttribute("outDate", outDate);
		model.addAttribute("inDate", inDate);
		model.addAttribute("res", res);
		model.addAttribute("length", sTLLength);
		return "comPayment";
	}

	// 마이페이지 - 예약 리스트
	@RequestMapping("selectMyResList.re")
	public String selectMyResList(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "startDate", required = false) Date startDate,
			@RequestParam(value = "endDate", required = false) Date endDate,
			@RequestParam(value = "value", required = false) String value, Model model, HttpSession session) {
		String id = ((Member) session.getAttribute("loginUser")).getUserId();
		int currentPage = page;
		int listCount = rService.getListCount(id);
		if (page != 1) {
			model.addAttribute(page);
			currentPage = page;
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Reservation> res = rService.selectMyResList(pi, id);
		LocalDate now = LocalDate.now();
		model.addAttribute("res", res);
		model.addAttribute("pi", pi);
		return "resList";
	}

	// 마이페이지 - 예약 검색
	@RequestMapping("searchResDate.re")
	public String searchResDate(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "startDate", required = false) Date startDate,
			@RequestParam(value = "endDate", required = false) Date endDate,
			@RequestParam(value = "value", defaultValue = "1") String value, Model model, HttpSession session) {
		String id = ((Member) session.getAttribute("loginUser")).getUserId();
		HashMap<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("value", value);
		map.put("id", id);
		int currentPage = page;
		int listCount = rService.getSearchListCount(map);
		System.out.println(listCount);
		if (page != 1) {
			model.addAttribute(page);
			currentPage = page;
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Reservation> list = rService.searchResDate(pi, map);
		System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("res", list);
		return "resList";
	}

	// 마이페이지 - 예약 상세
	@RequestMapping("selectMyRes.re")
	public String selectMyRes(@RequestParam("rno") int rno, Model model,
			@RequestParam(value = "page", defaultValue = "1") String page) {
		Reservation res = rService.selectMyRes(rno);
		String[] dnos = res.getDnos().split("/");
		ArrayList<Dog> list = rService.selectDogList(dnos);
		model.addAttribute("res", res);
		model.addAttribute("dList", list);
		model.addAttribute("page", page);
		return "resInfo";
	}

	// 마이페이지 - 예약 상세
	@RequestMapping("updateStatus.re")
	@ResponseBody
	public String updateStatus(@RequestParam("arr[]") String[] arr) {
		HashMap<String, String> map = new HashMap<>();
		map.put("rno", arr[0]);
		map.put("text", arr[1]);
		rService.updateStatus(map);
		return "1";
	}

}
