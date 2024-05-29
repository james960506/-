package com.kh.dog.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dog.common.Pagination;
import com.kh.dog.exception.BoardException;
import com.kh.dog.main.model.service.BoardService;
import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reply;
import com.kh.dog.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	@RequestMapping("list.go")
	public String selectBoardList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		String kind = "후기";
		int listCount = bService.getListCount(kind);
		/* model.addAttribute("loginUser", ); */

		int currentPage = page;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = bService.selectBoardList(pi, kind);

		if (list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("count", listCount);

			return "listReview";

		} else {
			throw new BoardException("게시글 조회 실패");
		}

	}

	@RequestMapping("write.go")
	public String boardWrite(HttpSession session) {

		return "write";
	}

	@RequestMapping("insertBoard.go")
	public String insertBoard(@ModelAttribute Board b, Model model) {

		b.setUserId(((Member) model.getAttribute("loginUser")).getUserId());
		int result = bService.insertBoard(b);

		if (result > 0) {
			return "redirect:list.go";
		} else {
			throw new BoardException("게시글 등록 실패");
		}

	}

	@RequestMapping("selectBoard.go")
	public ModelAndView selectBoard(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page,
			HttpSession session, ModelAndView mv) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String id = null;
		if (loginUser != null) {
			id = loginUser.getUserId();
		}
		Board b = bService.selectBoard(boardNo, id);

		ArrayList<Reply> list = bService.selectReply(boardNo);

		int likeCount = bService.updateViewLike(boardNo);
		
		System.out.println("con " + likeCount);
		
		if (b != null) {
			mv.addObject("b", b);
			mv.addObject("page", page);
			mv.addObject("id", id);
			mv.addObject("list", list);
			mv.addObject("likeCount", likeCount);
			mv.setViewName("view");

			return mv;
		} else {
			throw new BoardException("게시글 상세보기를 실패함");
		}
	}

	@RequestMapping("list2.go")
	public String list2Board(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		String kind = "질의응답";

		int list2Count = bService.getlist2Count(kind);

		int currentPage = page;

		PageInfo pi = Pagination.getPageInfo(currentPage, list2Count, 10);
		ArrayList<Board> list = bService.selectBoardList2(pi, kind);

		if (list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("count", list2Count);

			return "listAnswer";

		} else {
			throw new BoardException("게시글 조회 실패");
		}

	}

	@RequestMapping("list3.go")
	public String list3Board(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		String kind = "자유";

		int list3Count = bService.getlist3Count(kind);

		int currentPage = page;

		PageInfo pi = Pagination.getPageInfo(currentPage, list3Count, 10);
		ArrayList<Board> list = bService.selectBoardList2(pi, kind);

		if (list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("count", list3Count);

			return "listBoast";

		} else {
			throw new BoardException("게시글 조회 실패");
		}

	}

	@RequestMapping("selectBoard3.go")
	public ModelAndView selectBoard3(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page,
			ModelAndView mv, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		String id = null;
		if (loginUser != null) {
			id = loginUser.getUserId();
		}

		Board b = bService.selectBoard3(boardNo, id);
		
		ArrayList<Reply> list = bService.selectReply(boardNo);
		
		int likeCount = bService.updateViewLike(boardNo);

		if (b != null) {
			mv.addObject("b", b);
			mv.addObject("page", page);
			mv.addObject("id", id);
			mv.addObject("list", list);
			mv.addObject("likeCount", likeCount);
			mv.setViewName("view");

			return mv;
		} else {
			throw new BoardException("게시글 상세조회에 실패함");
		}

	}

	@RequestMapping("selectBoard2.go")
	public ModelAndView selectBoard2(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page,
			ModelAndView mv, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		String id = null;
		if (loginUser != null) {
			id = loginUser.getUserId();
		}

		Board b = bService.selectBoard2(boardNo, id);
		ArrayList<Reply> list = bService.selectReply(boardNo);
		int likeCount = bService.updateViewLike(boardNo);

		if (b != null) {
			mv.addObject("b", b);
			mv.addObject("page", page);
			mv.addObject("id", id);
			mv.addObject("likeCount", likeCount);
			mv.addObject("list", list);
			mv.setViewName("view");

			return mv;
		} else {
			throw new BoardException("게시글 상세조회에 실패함");
		}

	}

	@RequestMapping("listDelete.go")
	public String deleteBoard(@RequestParam("boardNo") int bNo) {

		int result = bService.deleteBoard(bNo);

		if (result > 0) {
			return "redirect:list.go";
		} else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");
		}

	}

	@RequestMapping("updateForm.go")
	public String updateBoard(@RequestParam("boardNo") int boardNo, @RequestParam("page") int page, Model model) {

		Board b = bService.selectBoard(boardNo, null);
		model.addAttribute("b", b);
		model.addAttribute("page", page);

		return "edit";
	}

	@RequestMapping("updateBoard.go")
	public String updateBoard(@ModelAttribute Board b, Model model, @RequestParam("page") int page,
			@RequestParam("boardNo") int boardNo) {

		int result = bService.updateBoard(b);

		if (result > 0) {
			model.addAttribute("boardNo", b.getBoardNo());
			model.addAttribute("page", page);
			return "redirect:selectBoard.go";
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다");
		}

	}

	@RequestMapping("insertReply.go")
	@ResponseBody //화면 이동 없이 데이터만 전송함
	public String insertReply(@ModelAttribute Reply r) {
		int result = bService.insertReply(r);

		ArrayList<Reply> list = bService.selectReply(r.getRefBoardNo());
		//jsp에서 ajax를 사용했기때문에 객체를 넘기려면 JSON을 사용함.
		
			JSONArray jArr = new JSONArray(); //객체를 담는 역할인 JSONArray 생성 
			for (Reply reply : list) { //list를 Reply에 넣음
				JSONObject json = new JSONObject(); // 제네릭 역할을 하는 JSONObject생성 
				                                    //map(key-value)처럼 사용가능함.
				json.put("replyNo", reply.getReplyNo());
				json.put("replyContent", reply.getReplyContent());
				json.put("refBoardNo", reply.getRefBoardNo());
				json.put("replyWriter", reply.getReplyWriter());
				json.put("replyCreateDate", reply.getReplyCreateDate());
				json.put("replyStatus", reply.getReplyStatus());
	
				jArr.put(json);//JSONArray에 reply가 담긴 json을 넣음.
				
			}
		      return jArr.toString();//reply의 정보가 담긴 jArr을 화면에 보냄.
    }

	@RequestMapping("deleteReply.go")
	public String deleteReply(@RequestParam("replyNo") int replyNo, @RequestParam("boardNo") int boardNo,
			@RequestParam("page") int page) {

		int result = bService.deleteReply(replyNo);

		if (result > 0) {
			return "redirect:selectBoard.go?boardNo=" + boardNo + "&page=" + page;
		} else {
			throw new BoardException("댓글 삭제에 실패하였습니다.");
		}
	}
	
	
	  @RequestMapping("searchBoard.go")
      public String searchBoard(@RequestParam("select") String select,
			                    @RequestParam("keyword") String keyword, Model model,
			                    @RequestParam(value = "page", defaultValue = "1") int page) {
	  
	  
	  int result = bService.searchBoardCount(select,keyword);
	  
	  int currentPage = page;
	  PageInfo pi = Pagination.getPageInfo(currentPage, result, 10);
	  ArrayList<Board> list = bService.searchBoardList(pi,select,keyword);
	  
	 if(list != null) {
		 model.addAttribute("result", result);
		 model.addAttribute("pi", pi);
		 model.addAttribute("list", list);
		 model.addAttribute("select", select);
		 model.addAttribute("keyword", keyword);
	 }
	  
	  return "searchPage";
	  
	  }
	  
	  
	  @RequestMapping("mypageinfo.go")
	  public String mypage () {
		  return "mypageinfo";
	  }
	  
	  @RequestMapping("myWriter.go")
	  public String myWriter(@RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model) {
		 
		  Member loginUser = (Member) session.getAttribute("loginUser");
			String id = null;
			if (loginUser != null) {
				id = loginUser.getUserId();
			}
		  
		  int listCount = bService.mypageListCount(id);
			/* model.addAttribute("loginUser", ); */

			int currentPage = page;

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
			ArrayList<Board> list = bService.mypageList(pi, id);
			System.out.println(list);

			if (list != null) {
				model.addAttribute("pi", pi);
				model.addAttribute("list", list);

				return "myPageList";

			} else {
				throw new BoardException("게시글 조회 실패");
			}
	  }
	  
	  @RequestMapping("selectBoard4.go")
	  public ModelAndView selectBoard4 (@RequestParam("boardNo") int boardNo, @RequestParam("page") int page,
				ModelAndView mv, HttpSession session) {

			Member loginUser = (Member) session.getAttribute("loginUser");
			String id = null;
			
			if (loginUser != null) {
				id = loginUser.getUserId();
			}
             System.out.println(boardNo);
			Board b = bService.selectBoard4(boardNo, id);
			int likeCount = bService.updateViewLike(boardNo);
			
			ArrayList<Reply> list = bService.selectReply(boardNo);

			if (b != null) {
				mv.addObject("b", b);
				mv.addObject("page", page);
				mv.addObject("id", id);
				mv.addObject("list", list);
				mv.addObject("likeCount", likeCount);
				mv.setViewName("view");

				return mv;
			} else {
				throw new BoardException("게시글 상세조회에 실패함");
			}
	  }
	  
	  
	  @ResponseBody
		@RequestMapping(value="updateLike.go", method=RequestMethod.POST)
		public String updateLike(@RequestParam(value = "id", required = false) String id, @RequestParam("boardNo") int boardNo, @RequestParam("check") String forHeartCheck,   Model model){
		  System.out.println(boardNo);
		  
		  HashMap<String, Object> hs = new HashMap<String, Object>();
			hs.put("id", id);
			hs.put("boardNo", boardNo);
			int result = 0;
			
			if(forHeartCheck.equals("forHeartCheck")) {
				result = bService.updateLike(hs, forHeartCheck);
				if(result > 0) {
					return "check";
				}else {
					return "uncheck";
				}
			}else {
				result = bService.updateLike(hs, forHeartCheck);
			}
			
			if(result == 1) { //update
				return "insert";
			}else { // delete
				return "delete";
			}
		}
	  
	  @ResponseBody
		@RequestMapping(value="updateViewLike.go", method=RequestMethod.POST)
		public int updateViewLike(@RequestParam("boardNo") int boardNo) {
			int result = bService.updateViewLike(boardNo);
			return result;
		}
	  
	 
	 

}
