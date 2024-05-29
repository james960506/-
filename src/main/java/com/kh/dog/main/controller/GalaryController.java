package com.kh.dog.main.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.dog.common.Pagination;
import com.kh.dog.exception.GalaryException;
import com.kh.dog.main.model.service.GalaryService;
import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Picture;
import com.kh.dog.main.model.vo.Reply;
import com.kh.dog.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class GalaryController {
	
	@Autowired
	private GalaryService pService;
	
	//갤러리 게시판으로 이동
	@RequestMapping("moveToAttmList.at")
	public String moveToAttmList(@RequestParam(value="page", defaultValue = "1") int page, Model model) {
		Member loginUser = (Member)model.getAttribute("loginUser");
		int currentPage = page;
		int countList = pService.pagingListCount("galary");
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, countList, 9);
		ArrayList<Picture> pList = new ArrayList<Picture>();
		
		ArrayList<Board> bList = pService.selectGalaryBoardList(pageInfo,"galary");
		for(int i = 0; i < bList.size(); i++) {
			 pList.addAll(pService.selectGalaryPictureList(pageInfo, bList.get(i).getBoardNo()));
		}
		if(bList != null && pList != null) {
			model.addAttribute("bList", bList).addAttribute("pList", pList).addAttribute("pageInfo", pageInfo).addAttribute("totalNum", countList).addAttribute("loginUser", loginUser);
			return "showUserPage";
		}else {
			throw new GalaryException("게시글 불러오기에 실패하였습니다");
		}
	}
	
	//작성 페이지로 이동
	@RequestMapping("write.at")
	public String moveToWrite() {
		return "writeGalaryBoard";
	}

	
	//작성한 board와 picture을 넣는 메소드
	@RequestMapping("insertGalary.at")
	public String insertGalary(@ModelAttribute Board b,@RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest request, Model model, Member m) {
		String id = ((Member)model.getAttribute("loginUser")).getUserId();
		b.setUserId(id);
		
		ArrayList<Picture> pictureList = new ArrayList<Picture>();
		
		for(int i = 0; i < files.size(); i++) {
			MultipartFile uploadFile = files.get(i);
			
			if(!uploadFile.getOriginalFilename().equals("")) {
				
				String[] fileInfo =  fileUpload(request, uploadFile);
				if(fileInfo[1] != null) {
					Picture p = new Picture();
					p.setFileName(uploadFile.getOriginalFilename());
					p.setFileRename(fileInfo[1]);
					p.setFileLocation(fileInfo[0]);
					
					pictureList.add(p);
				}
			}
		}
		
		for(int i = 0; i < pictureList.size(); i++) {
			Picture p = pictureList.get(i);
			if(i == 0) {
				p.setThumbnail("Y");
			}else {
				p.setThumbnail("N");
			}
		}
		
		int boardInsertCheck = 0;
		int pictureInsertCheck = 0;
		
		if(!pictureList.isEmpty()) {
			b.setKind("galary");
			boardInsertCheck = pService.insertBoard(b);
			for(int i = 0; i < pictureList.size(); i++) {
				pictureList.get(i).setBoardNo(b.getBoardNo());
			}
			String status = "new";
			pictureInsertCheck = pService.insertPicture(pictureList, status);
			
		}
		
		if(boardInsertCheck + pictureInsertCheck == pictureList.size() +1) {
			return "redirect:moveToAttmList.at";
		}else {
			for(int i = 0; i < pictureList.size(); i++) {
				deleteFiles(pictureList.get(i).getFileRename(), request);
			}
			throw new GalaryException("게시글 업데이트에 실패하였습니다");
		}
	}
	
	
	private void deleteFiles(String fileRename, HttpServletRequest request) {
		String saveLocation = request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles";
		File pictureFile = new File(saveLocation + "\\" + fileRename);
		if(pictureFile.exists()) {
			pictureFile.delete();
		}
	}

	
	//파일 서버에 등록
	public String[] fileUpload(HttpServletRequest request, MultipartFile uploadFile){
		String root = request.getSession().getServletContext().getRealPath("resources");
		String saveLocation = root + "\\uploadFiles";
		
		File folder = new File(saveLocation);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat uploadTime = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		String fileName = uploadFile.getOriginalFilename();
		String fileRename = uploadTime.format(time) + fileName + fileName.substring(fileName.lastIndexOf("."));
		
		String renameLocation = folder + "\\" + fileRename;
		try {
			uploadFile.transferTo(new File(renameLocation));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String[] fileInfo = {saveLocation, fileRename};
		return fileInfo;
	}
	
	
	//갤러리 상세 페이지로 이동
	@RequestMapping("pictureDetail.at")
	public String moveToPictureDetail(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page, Model model) {
		ArrayList<Reply> rList = new ArrayList<>();
		String id = null;
		
		if((Member)model.getAttribute("loginUser") != null) {
			id = ((Member)model.getAttribute("loginUser")).getUserId();
		}
		
		
		int likeCount = pService.updateViewLike(boardNo);
		
		rList = pService.replyList(boardNo);
		
		
		Board board = pService.selectGalaryBoard(boardNo, id);
		ArrayList<Picture> pList = pService.selectGalaryPictureList(null,boardNo);
		
		if(board != null && pList != null) {
			if(id != null) {
				model.addAttribute("board", board).addAttribute("pList", pList).addAttribute("page", page).addAttribute("id", id).addAttribute("likeCount", likeCount).addAttribute("rList", rList);
			}else {
				model.addAttribute("board", board).addAttribute("pList", pList).addAttribute("page", page).addAttribute("likeCount", likeCount).addAttribute("rList", rList);
			}
			return "galaryDetail";
		} else {
			throw new GalaryException("게시글 불러오기에 실패했습니다");
		}
	}
	
	//갤러리 게시판 리스트에서 검색하는것
	@RequestMapping("searchGalary.at")
	public String searchPictureGalaryList(@RequestParam(value="title", required = false) String title,@RequestParam(value="date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") String date, Model model, @RequestParam(value="page", defaultValue = "1") int page) {
		HashMap<String, String> hs = new HashMap<>();
		ArrayList<Picture> pList = new ArrayList<>();
		int countList = pService.pagingListCount("galary");
		int currentPage = page;
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, countList, 9);
		
		
		if(title != null) {
			String searchTitle = "%" + title + "%";
			hs.put("title", searchTitle);
			
			ArrayList<Board> bList =  pService.searchPictureGalaryList(hs, null);
			pageInfo = Pagination.getPageInfo(currentPage, bList.size(), 9);
			bList =  pService.searchPictureGalaryList(hs, pageInfo);
			
			for(int i = 0; i < bList.size(); i++) {
				pList.addAll(pService.selectGalaryPictureList(pageInfo, bList.get(i).getBoardNo()));
			}
			
			model.addAttribute("bList", bList).addAttribute("pList", pList).addAttribute("pageInfo", pageInfo).addAttribute("totalNum", countList);
			
			return "showUserPage"; // redirect:
		}else if(date != null) {
			String[] sArr = date.split("-");
			String searchDate = sArr[0].substring(2) + "/" + sArr[1] + "/" + sArr[2];
			hs.put("date", searchDate);
			
			
			ArrayList<Board> bList =  pService.searchPictureGalaryList(hs,null);
			pageInfo = Pagination.getPageInfo(currentPage, bList.size(), 9);
			bList =  pService.searchPictureGalaryList(hs, pageInfo);
			
			for(int i = 0; i < bList.size(); i++) {
				pList.addAll(pService.selectGalaryPictureList(pageInfo, bList.get(i).getBoardNo()));
			}
			
			model.addAttribute("bList", bList).addAttribute("pList", pList).addAttribute("pageInfo", pageInfo).addAttribute("totalNum", countList);
			
			return "showUserPage";
		}else {
			throw new GalaryException("게시글 조회에 실패하였습니다");
		}
	}
	
	//갤러리 게시판 수정페이지 이동
	@RequestMapping("moveToUpdateGalary.at")
	public String updateGalary(@ModelAttribute Board board, @RequestParam(value="file", required=false) ArrayList<String> fileRenames ,Model model ) {
		model.addAttribute("board", board).addAttribute("fileRenames", fileRenames);
		return "galaryEdit";
	}
	
	
	//갤러리 게시판 수정
	@RequestMapping("updateGalaryEnroll.at")
	public String updateGalaryEnroll(@ModelAttribute Board board,@RequestParam(value="file", required=false) ArrayList<MultipartFile> files, @RequestParam(value="deleteFile", required=false) String[] deleteFiles, HttpServletRequest request) {
		int result1 = 0; // 사진 추가
		int result2 = 0; // 사진 상태 삭제('N')
		int result3 = 0; // 게시판 내용 수정
		
		ArrayList<Picture> pList = new ArrayList<Picture>();
		ArrayList<String> deleteList = new ArrayList<String>();
		
		
		//새로 사진 추가
		if(files != null) {
			for(int i = 0; i < files.size(); i++) {
				MultipartFile uploadFile = files.get(i);
				
				if(!uploadFile.getOriginalFilename().equals("")) {
					
					String[] fileInfo =  fileUpload(request, uploadFile);
					if(fileInfo[1] != null) {
						Picture p = new Picture();
						p.setFileName(uploadFile.getOriginalFilename());
						p.setFileRename(fileInfo[1]);
						p.setFileLocation(fileInfo[0]);
						
						pList.add(p);
					}
				}
			}
			
			if(!pList.isEmpty()) {
				for(int i = 0; i < pList.size(); i++) {
					pList.get(i).setBoardNo(board.getBoardNo());
				}
				String status = "update";
				result1 = pService.insertPicture(pList, status);
			}
		}
		//
		
		
		//삭제 선택한 파일들 삭제 (상태 'N')
		for(int i = 0; i < deleteFiles.length; i++) {
			if(!deleteFiles[i].equals("")) {
				deleteList.add(deleteFiles[i]);
			}
		}
		
		
		if(deleteList != null) {
			result2 = pService.deleteGalary(board.getBoardNo(), deleteList);
		}
		//
		
		//게시글 내용 수정
		result3 = pService.updateGalaryBoard(board);
		
		boolean isThumbNailExist = false;
		
		ArrayList<Picture> thumbNailCheck = new ArrayList<>();
		thumbNailCheck = pService.selectGalaryPictureList(null, board.getBoardNo());
		
		for(int i = 0; i < thumbNailCheck.size(); i++) {
			if(thumbNailCheck.get(i).getThumbnail().equals("Y")) {
				isThumbNailExist = true;
			}
		}
		
		
		if(isThumbNailExist == false) {
			thumbNailCheck.get(0).setThumbnail("Y");
			pService.updateThumbNail(thumbNailCheck.get(0));
				
		}
		
		if(result1 + result2 + result3 >= 1) {
			return "redirect:moveToAttmList.at";
		}else {
			throw new GalaryException("게시글 수정에 실패하였습니다");
		}
	}
	
	
	//갤러리 게시판 삭제
	@RequestMapping("deleteGalary.at")
	public String deleteGalary(@RequestParam("boardNo") int boardNo) {
		int result = pService.deleteGalary(boardNo, null);
		
		if(result >= 2) {
			return "redirect:moveToAttmList.at";
		} else {
			throw new GalaryException("게시글 삭제에 실패하였습니다");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="updateLike.at", method=RequestMethod.POST)
	public String updateLike(@RequestParam(value = "id", required = false) String id, @RequestParam("boardNo") int boardNo, @RequestParam("check") String forHeartCheck,   Model model){
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("id", id);
		hs.put("boardNo", boardNo);
		int result = 0;
		
		if(forHeartCheck.equals("forHeartCheck")) {
			result = pService.updateLike(hs, forHeartCheck);
			if(result > 0) {
				return "check";
			}else {
				return "uncheck";
			}
		}else {
			result = pService.updateLike(hs, forHeartCheck);
		}
		
		if(result == 1) { //update
			return "insert";
		}else { // delete
			return "delete";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="updateViewLike.at", method=RequestMethod.POST)
	public int updateViewLike(@RequestParam("boardNo") int boardNo) {
		int result = pService.updateViewLike(boardNo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="enrollReply.at", produces = "application/json; charset=UTF-8")
	public String enrollReply(@RequestParam(value="id", required = false) String id, @RequestParam("replyContent") String replyContent, @RequestParam("boardNo") int boardNo) {
		HashMap<String , Object> hm = new HashMap<String, Object>();
		ArrayList<Reply> rList = new ArrayList<>();
		JSONArray jArr = new JSONArray();
		
		hm.put("id",id);
		hm.put("replyContent",replyContent);
		hm.put("boardNo",boardNo);
		
		if(id != null) {
			int result = pService.insertGalaryReplyEnroll(hm);
			
			if(result > 0) {
				rList = pService.replyList(boardNo);
			}
			
			for(Reply reply: rList) {
				JSONObject json = new JSONObject();
				json.put("replyNo", reply.getReplyNo());
				json.put("replyContent", reply.getReplyContent());
				json.put("refBoardNo", reply.getRefBoardNo());
				json.put("replyWriter", reply.getReplyWriter());
				json.put("replyCreateDate", reply.getReplyCreateDate());
				json.put("replyStatus", reply.getReplyStatus());
				
				jArr.put(json);
			}
		}
		return jArr.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReply.at", produces = "application/json; charset=UTF-8")
	public String deleteReply(@RequestParam(value="id", required = false) String id, @RequestParam("boardNo") int boardNo, @RequestParam("replyNo") int replyNo) {
		HashMap<String , Object> hm = new HashMap<String, Object>();
		ArrayList<Reply> rList = new ArrayList<>();
		JSONArray jArr = new JSONArray();
		
		hm.put("id",id);
		hm.put("replyNo",replyNo);
		hm.put("boardNo",boardNo);
		
		if(id != null) {
			int result = pService.deleteGalaryReply(hm);
			if(result > 0) {
				rList = pService.replyList(boardNo);
			}
			
			for(Reply reply: rList) {
				JSONObject json = new JSONObject();
				json.put("replyNo", reply.getReplyNo());
				json.put("replyContent", reply.getReplyContent());
				json.put("refBoardNo", reply.getRefBoardNo());
				json.put("replyWriter", reply.getReplyWriter());
				json.put("replyCreateDate", reply.getReplyCreateDate());
				json.put("replyStatus", reply.getReplyStatus());
				
				jArr.put(json);
			}
		}
		return jArr.toString();
	}

}


