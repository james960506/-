package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dog.main.model.dao.GalaryDAO;
import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Picture;
import com.kh.dog.main.model.vo.Reply;

@Service
public class GalaryServiceImpl implements GalaryService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private GalaryDAO dao;

	@Override
	public int insertBoard(Board b) {
		return dao.insertBoard(sqlSession, b);
	}

	@Override
	public int insertPicture(ArrayList<Picture> pictureList, String status) {
		return dao.insertPicture(sqlSession, pictureList, status);
	}

	@Override
	public ArrayList<Board> selectGalaryBoardList(PageInfo pageInfo, String type) {
		return dao.selectGalaryBoardList(sqlSession, pageInfo, type);
	}

	@Override
	public ArrayList<Picture> selectGalaryPictureList(PageInfo pageInfo, Integer boardNo) {
		return dao.selectGalaryPictureList(sqlSession, pageInfo, boardNo);
	}

	@Override
	public int pagingListCount(String type) {
		return dao.pagingListCount(sqlSession, type);
	}

	@Override
	public Board selectGalaryBoard(int boardNo, String id) {
		return dao.selectBoard(sqlSession, boardNo, id);
	}

	@Override
	public ArrayList<Board> searchPictureGalaryList(HashMap<String, String> hs, PageInfo pageInfo) {
		return dao.searchPictureGalaryList(sqlSession, hs, pageInfo);
	}

	@Override
	public int deleteGalary(int boardNo, ArrayList<String> deleteList) {
		return dao.deleteGalary(sqlSession, boardNo, deleteList);
	}

	@Override
	public int updateGalaryBoard(Board board) {
		return dao.updateGalaryBoard(sqlSession, board);
	}

	@Override
	public void updateThumbNail(Picture picture) {
		dao.updateThumbNail(sqlSession, picture);
	}


	@Override
	public int updateLike(HashMap<String, Object> hs, String forHeartCheck) {
		return dao.updateLike(sqlSession, hs, forHeartCheck);
	}

	@Override
	public int updateViewLike(int boardNo) {
		return dao.updateViewLike(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Reply> replyList(int boardNo) {
		return dao.replyList(sqlSession, boardNo);
	}

	@Override
	public int insertGalaryReplyEnroll(HashMap<String, Object> hm) {
		return dao.insertGalaryReplyEnroll(sqlSession, hm);
	}

	@Override
	public int deleteGalaryReply(HashMap<String, Object> hm) {
		return dao.deleteGalaryReply(sqlSession, hm);
	}


}
