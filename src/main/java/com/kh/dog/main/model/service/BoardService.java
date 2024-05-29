package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reply;

public interface BoardService {
	int getListCount(String kind);

	ArrayList<Board> selectBoardList(PageInfo pi, String kind);

	int insertBoard(Board b);

	Board selectBoard(int boardNo, String id);

	int getlist2Count(String kind);

	ArrayList<Board> selectBoardList2(PageInfo pi, String kind);

	int getlist3Count(String kind);

	Board selectBoard3(int boardNo, String id);

	Board selectBoard2(int boardNo, String id);

	int deleteBoard(int bNo);

	int updateBoard(Board b);

	ArrayList<Reply> selectReply(int boardNo);
	
	int insertReply(Reply r);

	int deleteReply(int replyNo);

	int searchBoardCount(String select, String keyword);

	ArrayList<Board> searchBoardList(PageInfo pi, String select, String keyword);

	ArrayList<Board> mypageList(PageInfo pi,String id);

	Board selectBoard4(int boardNo, String id);

	int mypageListCount(String id);

	int updateLike(HashMap<String, Object> hs, String forHeartCheck);

	int updateViewLike(Integer boardNo);

	

}



