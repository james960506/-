package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dog.main.model.dao.BoardDAO;
import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;


	@Override
	public int getListCount(String kind) {
		return bDAO.getlistCount(sqlSession,kind);
	}


	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, String kind) {
		return bDAO.selectBoardList(sqlSession,pi,kind);
	}


	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession,b);
	}


	@Override
	public Board selectBoard(int boardNo, String id) {
		Board b = bDAO.selectBoard(sqlSession, boardNo);
		if(b != null) {
			if(id != null && !b.getUserId().equals(id)) {
				int result = bDAO.updateCount(sqlSession,boardNo);
				if(result > 0) {
					b.setBoardView(b.getBoardView() + 1);
				}
			}
		}
		
		return b ;
	}


	@Override
	public int getlist2Count(String kind) {
		return bDAO.getlist2Count(sqlSession,kind);
	}


	@Override
	public ArrayList<Board> selectBoardList2(PageInfo pi, String kind) {
		return bDAO.selectBoardList2(sqlSession,pi,kind);
	}


	@Override
	public int getlist3Count(String kind) {
		return bDAO.getlist3Count(sqlSession,kind);
	}


	@Override
	public Board selectBoard3(int boardNo, String id) {
		 
		Board b = bDAO.selectBoard3(sqlSession, boardNo);
		
		if(b != null) {
			if(id != null && !b.getUserId().equals(id)) {
				int result = bDAO.updateCount(sqlSession,boardNo);
				if(result > 0) {
					b.setBoardView(b.getBoardView() + 1);
				}
			}
		}

       return b;
		
	}


	@Override
	public Board selectBoard2(int boardNo, String id) {
		
        Board b = bDAO.selectBoard3(sqlSession, boardNo);
		
		if(b != null) {
			if(id != null && !b.getUserId().equals(id)) {
				int result = bDAO.updateCount(sqlSession,boardNo);
				if(result > 0) {
					b.setBoardView(b.getBoardView() + 1);
				}
			}
		}

		return b;
	}


	@Override
	public int deleteBoard(int bNo) {
		return bDAO.deleteBoard(sqlSession,bNo);
	}


	@Override
	public int updateBoard(Board b) {
		return bDAO.updateBoard(sqlSession,b);
	}


	@Override
	public ArrayList<Reply> selectReply(int boardNo) {
		return bDAO.selectReply(sqlSession, boardNo) ;
	}
	
	@Override
	public int insertReply(Reply r) {
		return bDAO.insertReply(sqlSession,r);
	}

	@Override
	public int deleteReply(int replyNo) {
		return bDAO.deleteReply(sqlSession,replyNo);
	}


	  @Override 
	  public int searchBoardCount(String select, String keyword) {
	  
	   HashMap<String,String> map = new HashMap<>(); map.put("keyword", keyword);
	   map.put("select", select);
	  
	  return bDAO.searchBoardCount(sqlSession,map); 
	  }


	@Override
	public ArrayList<Board> searchBoardList(PageInfo pi, String select, String keyword) {
		
		HashMap<String,String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("select",select);
		
		return bDAO.searchBoardList(sqlSession,pi,map);
	}


	@Override
	public ArrayList<Board> mypageList(PageInfo pi,String id) {
		return bDAO.myPageList(sqlSession,pi,id);
	}


	@Override
	public Board selectBoard4(int boardNo, String id) {
		Board b = bDAO.selectBoard4(sqlSession, boardNo);
		System.out.println(b);
		
		return b;
		
		
	}


	@Override
	public int mypageListCount(String id) {
		return bDAO.selectmypageListCount(sqlSession,id);
	}


	@Override
	public int updateLike(HashMap<String, Object> hs, String forHeartCheck) {
		return bDAO.updateLike(sqlSession,hs,forHeartCheck);
	}


	@Override
	public int updateViewLike(Integer boardNo) {
		return bDAO.updateViewLike(sqlSession,boardNo);
	}


	
	 
	
	





}
