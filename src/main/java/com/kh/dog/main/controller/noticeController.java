package com.kh.dog.main.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dog.common.Pagination;
import com.kh.dog.exception.BoardException;
import com.kh.dog.main.model.service.noticeService;
import com.kh.dog.main.model.vo.Notice;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.member.model.vo.Member;

@Controller
public class noticeController {

	@Autowired
	private noticeService nService;

	@RequestMapping("map.bo")
	public String map() {
		return "map";
	}

	@RequestMapping("notice.bo")
	public String boardList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		int listCount = nService.getListCount();
		int currentPage = page;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Notice> list = nService.selectNoticeList(pi, 1);
		
		
		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			
			return "noticeList";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다.");
		}

	}

	@RequestMapping("writeNotice.bo")
	public String wirteBoard() {
		return "noticeWrite";
	}

	@RequestMapping("inserNotice.bo")
	public String insertNotice(@ModelAttribute Notice n, HttpServletRequest request,
			@RequestParam(value = "file") MultipartFile file) {

		String id = ((Member) request.getSession().getAttribute("loginUser")).getUserId();

		n.setUserId(id);
		n.setNoticeCount(0);

		if (file.getSize() == 0) {
			n.setNoticeOriginalName("");
			n.setNoticeRenameName("");
			n.setNoticeAttmPath("");
		} else {
			String[] fileName = saveFile(file, request);
			n.setNoticeOriginalName(file.getOriginalFilename());
			n.setNoticeRenameName(fileName[1]);
			n.setNoticeAttmPath(fileName[0]);
		}

		int result = nService.insertNotice(n);

		return "redirect:notice.bo";
	}

	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\mingFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(time) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;

		return returnArr;
	}

	public void deleteFile(String fileName, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resiurces") + "\\mingFiles";
		File f = new File(savePath + "\\" + fileName);
		if (f.exists()) {
			f.delete();
		}
	}
	
	//상세 보기
	@RequestMapping("selectNotice.bo")
	public String selectNotice(@RequestParam(value = "noticeNo") int noticeNo, @RequestParam("page") int page,
			HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String id = null;

		if (loginUser != null) {
			id = loginUser.getUserId();
		}

		Notice n = nService.selectBoard(noticeNo, id);
		ArrayList<Notice> list = nService.selectDetailNoticeList((Integer) noticeNo);

		if (n != null) {
			model.addAttribute("n", n);
			model.addAttribute("page", page);
			model.addAttribute("list", list);

			return "noticeDetail";
		} else {
			throw new BoardException("게시글 상세보기를 실패하였습니다.");
		}
	}


	@RequestMapping("updateForm.bo")
	public String updateForm(@RequestParam("noticeNo") int noticeNo, Model model, @RequestParam("page") int page) {
		Notice n = nService.selectBoard(noticeNo, null);
		ArrayList<Notice> list = nService.selectDetailNoticeList(noticeNo);
		model.addAttribute("n", n);
		model.addAttribute("page", page);
		model.addAttribute("list", list);

		return "noticeEdit";
	}


		// 게시글 수정
	  @RequestMapping("updateNotice.bo")
	  public String updateNotice(@ModelAttribute Notice n, @RequestParam("page") int page, @RequestParam(value = "deleteAttm", defaultValue="1") String deleteAttm,
			  						@RequestParam(value="file") MultipartFile file, HttpServletRequest request, Model model) {
	  
		  
		  int updateAttmResult= 0;// 업데이트할 경우
		  int deleteAttmResult = 0; //삭제할 경우
		  int result =0; // 기존할 경우
		 
		  //파일 선택 먼저 확인
		  if(file.getSize() != 0 ) { //파일이 있을때
			  String[] fileName = saveFile(file,request);
			  n.setNoticeOriginalName(file.getOriginalFilename());
			  n.setNoticeRenameName(fileName[1]); 
			  n.setNoticeAttmPath(fileName[0]);
			  n.setNoticeNo(n.getNoticeNo());
			  updateAttmResult = nService.updateAttm(fileName[1], n.getNoticeNo(), file.getOriginalFilename());
			  
		  
		  }	else if(file.getSize() == 0) { // 파일이 없을때
			  if(!deleteAttm.equals("none")) { //delete on이면 파일 완전 삭제
				  String delRename = "";
			      delRename = deleteAttm.split("/")[0];
			      deleteAttmResult = nService.deleteAttm(delRename);
			      if (deleteAttmResult > 0) {
			    	  deleteFile(delRename, request);
			      }	
			 
			  }
		  }
			result = nService.updateNotice(n);
			model.addAttribute("n",n);
			model.addAttribute("page",page);

		  
		  //내용바꾸기
		  
		  if(result+ deleteAttmResult+updateAttmResult>0) {
			  
			  return "redirect:selectNotice.bo?noticeNo=" + n.getNoticeNo() + "&page=" + page;
		  }else {
			  throw new BoardException("게시글 상세보기를 실패하였습니다.");
		  }
		  
		    
		 }
	 

	  // 글 삭제
	@RequestMapping("delete.bo")
	public String deleteNotice(@RequestParam("noticeNo") int noticeNo) {

		int result = nService.deleteNotice(noticeNo);
		if (result > 0) {
			return "redirect:notice.bo";
		} else {
			throw new BoardException("첨부파일 게시글 삭제를 실패하였습니다.");
		}
	}
	
	// 페이징 처리 + 게시글 조건 검색
	@RequestMapping("search.bo")
	public String search(@RequestParam(value = "page", defaultValue = "1") int page,
							@RequestParam(value="searchType", defaultValue="") String searchType,
							@RequestParam(value="keyword", defaultValue="") String keyword, Model model) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		int currentPage = page;
		int listCount = nService.searchList(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Notice> list = nService.searchtNoticeList(pi, map);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "noticeList";
		} else {
			throw new BoardException("게시글 검색을 실패하였습니다.");
		}
	}
}
