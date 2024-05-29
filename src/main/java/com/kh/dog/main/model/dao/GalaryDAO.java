package com.kh.dog.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Picture;
import com.kh.dog.main.model.vo.Reply;

public interface GalaryDAO {

	int insertBoard(SqlSession sqlSession, Board b);

	int insertPicture(SqlSession sqlSession, ArrayList<Picture> pictureList, String status);

	ArrayList<Board> selectGalaryBoardList(SqlSession sqlSession, PageInfo pageInfo, String type);

	ArrayList<Picture> selectGalaryPictureList(SqlSession sqlSession, PageInfo pageInfo, Integer boardNo);

	int pagingListCount(SqlSession sqlSession, String type);

	Board selectBoard(SqlSession sqlSession, int boardNo, String id);

	ArrayList<Board> searchPictureGalaryList(SqlSession sqlSession, HashMap<String, String> hs, PageInfo pageInfo);

	int deleteGalary(SqlSession sqlSession, int boardNo, ArrayList<String> deleteList);

	int updateGalaryBoard(SqlSession sqlSession, Board board);

	void updateThumbNail(SqlSession sqlSession, Picture picture);

	int updateLike(SqlSession sqlSession, HashMap<String, Object> hs, String forHeartCheck);

	int updateViewLike(SqlSession sqlSession, int boardNo);

	ArrayList<Reply> replyList(SqlSession sqlSession, int boardNo);

	int insertGalaryReplyEnroll(SqlSession sqlSession, HashMap<String, Object> hm);

	int deleteGalaryReply(SqlSession sqlSession, HashMap<String, Object> hm);

}
