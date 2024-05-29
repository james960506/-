package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Picture;
import com.kh.dog.main.model.vo.Reply;

public interface GalaryService {

	//갤러리 게시판 글넣기
	int insertBoard(Board b);

	//갤러리 게시판 사진넣기
	int insertPicture(ArrayList<Picture> pictureList, String status);

	//갤러리 게시판 모든 글 가져오기
	ArrayList<Board> selectGalaryBoardList(PageInfo pageInfo, String type);

	//갤러리 게시판 모든 글에 맞는 사진 들고 오기
	ArrayList<Picture> selectGalaryPictureList(PageInfo pageInfo, Integer boardNo);

	//갤러리게시판 갯수 가져오기
	int pagingListCount(String type);

	//갤러리 게시판 클릭한 글 정보가져오기
	Board selectGalaryBoard(int boardNo, String id);

	//갤러리 게시판 검색한 글에 대해서 가져오기
	ArrayList<Board> searchPictureGalaryList(HashMap<String, String> hs, PageInfo pageInfo);

	//갤러리 게시판 글 삭제
	int deleteGalary(int boardNo, ArrayList<String> deleteList);

	//갤러리 게시판 글 업데이트
	int updateGalaryBoard(Board board);
	
	//썸네일 업데이트
	void updateThumbNail(Picture picture);

	int updateLike(HashMap<String, Object> hs, String forHeartCheck);

	int updateViewLike(int boardNo);

	ArrayList<Reply> replyList(int boardNo);

	int insertGalaryReplyEnroll(HashMap<String, Object> hm);

	int deleteGalaryReply(HashMap<String, Object> hm);


	
	
}
