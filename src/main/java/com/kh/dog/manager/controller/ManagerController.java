package com.kh.dog.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dog.common.Pagination;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reservation;
import com.kh.dog.manager.model.service.ManagerService;
import com.kh.dog.member.model.vo.Dog;

@Controller
public class ManagerController {
	
	@Autowired
	ManagerService mService;
	
	//예약 리스트
	@RequestMapping("selectResList.ma")
	public String selectResList(@RequestParam(value="page", defaultValue="1") int page, Model model, HttpSession session) {
		int currentPage = page;
		int listCount = mService.getListCount();
		if(page != 1) {
			model.addAttribute(page);
			currentPage = page;
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		ArrayList<Reservation> res = mService.selectResList(pi);

		model.addAttribute("res", res);
		model.addAttribute("pi", pi);
		return "reservationList";
	} 
	
	//예약삭제(체크박스)
	@RequestMapping("deleteRes.ma")
	public String deleteRes(@RequestParam String[] deleteRnos) {
		mService.deleteRes(deleteRnos);
		return "redirect:selectResList.ma";
	} 
	
	//예약 검색(이름, 아이디)
	@RequestMapping("searchRes.ma")
	public String searchRes(String keyword, String value, Model model, @RequestParam(value="page", defaultValue="1") int page) {
		System.out.println("접근");
		int currentPage = page;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("value", value);
		int listCount = mService.searchListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		ArrayList<Reservation> res = mService.searchResList(map, pi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("value", value);
		model.addAttribute("pi", pi);
		model.addAttribute("res", res);
		return "reservationList";
	} 
	
	//예약 상세검색(예약일, 체크인, 체크아웃)
	@RequestMapping("detailSearchDate.ma")
	public String detailSearchDate(String inDate, String outDate, String keyword, Model model) {
		int currentPage = 1;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("inDate", inDate);
		map.put("outDate", outDate);
		int listCount = mService.searchListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		ArrayList<Reservation> res = mService.searchResList(map, pi);
		model.addAttribute("res", res);
		return "reservationList";
	} 
	
	//예약 상세
	@RequestMapping("detailRes.ma")
	public String detailRes(@RequestParam("rno") int rno, Model model) {
		Reservation res = mService.selectRes(rno);
		String[] dnos = res.getDnos().split("/");
		ArrayList<Dog> list = mService.selectDogList(dnos); 
		res.setDnos(Integer.toString(dnos.length));
		model.addAttribute("dList", list);
		model.addAttribute("res", res);
		return "detailRes";
	}
}
