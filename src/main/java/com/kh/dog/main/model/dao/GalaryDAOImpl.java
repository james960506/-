package com.kh.dog.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Picture;
import com.kh.dog.main.model.vo.Reply;

@Repository
public class GalaryDAOImpl implements GalaryDAO{

	@Override
	public int insertBoard(SqlSession sqlSession, Board b) {
		return sqlSession.insert("galaryMapper.insertBoard", b);
	}

	@Override
	public int insertPicture(SqlSession sqlSession, ArrayList<Picture> pictureList, String status) {
		if(status.equals("new")) {
			return sqlSession.insert("galaryMapper.insertPictureNew", pictureList);
		}else {
			return sqlSession.insert("galaryMapper.insertPictureUpdate", pictureList);
		}
	}

	@Override
	public ArrayList<Board> selectGalaryBoardList(SqlSession sqlSession, PageInfo pageInfo, String type) {
		/*if(pageInfo != null) {*/
			RowBounds rowBounds = new RowBounds((pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit(), pageInfo.getBoardLimit());
			return (ArrayList)sqlSession.selectList("galaryMapper.selectGalaryBoardList", type, rowBounds);
			/*
			 * }else { return
			 * (ArrayList)sqlSession.selectList("galaryMapper.selctGalaryBoardList", type);
			 * }
			 */
		
	}

	@Override
	public ArrayList<Picture> selectGalaryPictureList(SqlSession sqlSession, PageInfo pageInfo, Integer boardNo) {
			return (ArrayList)sqlSession.selectList("galaryMapper.selectGalaryPictureList", boardNo);
			/*
			 * }else { return
			 * (ArrayList)sqlSession.selectList("galaryMapper.selectGalaryPictureList",
			 * boardNo); }
			 */
	}

	@Override
	public int pagingListCount(SqlSession sqlSession, String type) {
		return sqlSession.selectOne("galaryMapper.countList", type);
	}

	@Override
	public Board selectBoard(SqlSession sqlSession, int boardNo, String id) {
		Board b = sqlSession.selectOne("galaryMapper.selectBoard", boardNo);
		
		if(b.getUserId().equals(id)) {// 내가 쓴 글이라면 x 안올라가게
			b = sqlSession.selectOne("galaryMapper.selectBoard", boardNo);
			return b;
		}else {//내가 쓴 글이 아닐테니 조회수 + 1
			sqlSession.update("galaryMapper.updateViewCount", boardNo);
			b = sqlSession.selectOne("galaryMapper.selectBoard", boardNo);
			return b;
		}
	}

	@Override
	public ArrayList<Board> searchPictureGalaryList(SqlSession sqlSession, HashMap<String, String> hs, PageInfo pageInfo) {
		if(pageInfo == null) {
			return (ArrayList)sqlSession.selectList("galaryMapper.searchList", hs);
		}else {
			RowBounds rowBounds = new RowBounds((pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit(), pageInfo.getBoardLimit());
			return (ArrayList)sqlSession.selectList("galaryMapper.searchList", hs, rowBounds);
		}
	}

	@Override
	public int deleteGalary(SqlSession sqlSession, int boardNo, ArrayList<String> deleteFiles) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		int result1 = 0;
		int result2 = 0;
		if(deleteFiles == null) {
			result1 = sqlSession.update("galaryMapper.deleteGalaryBoard", boardNo);
			result2 = sqlSession.update("galaryMapper.deleteGalaryPicture1", boardNo);
			return (result1 + result2);
		}else {
			int count = 0;
			hs.put("boardNo", boardNo);
			hs.put("deleteFileName", deleteFiles);
			for(int i = 0;  i < deleteFiles.size(); i++) {
				result2 = sqlSession.update("galaryMapper.deleteGalaryPicture2", hs);
				if(result2 != 0) {
					count++;
				}
			}
			return count;
		}
	}

	@Override
	public int updateGalaryBoard(SqlSession sqlSession, Board board) {
		return sqlSession.update("galaryMapper.updateBoard", board);
	}

	@Override
	public void updateThumbNail(SqlSession sqlSession, Picture picture) {
		sqlSession.update("galaryMapper.updateThumbNail", picture);
	}

	@Override
	public int updateLike(SqlSession sqlSession, HashMap<String, Object> hs, String forHeartCheck) {
		int result = 0;
		
		if(forHeartCheck.equals("forHeartCheck")) {
			return sqlSession.selectOne("galaryMapper.checkLike", hs);
		}else {
			result = sqlSession.selectOne("galaryMapper.checkLike", hs);
		}
		
		int update = 0;
		if(result > 0) {
			update = sqlSession.delete("galaryMapper.deleteLike",hs)+1;
		}else {
			update = sqlSession.insert("galaryMapper.insertLike",hs);
		}
		return update;
	}

	@Override
	public int updateViewLike(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("galaryMapper.updateViewLike", boardNo);
	}

	@Override
	public ArrayList<Reply> replyList(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("galaryMapper.replyList", boardNo);
	}

	@Override
	public int insertGalaryReplyEnroll(SqlSession sqlSession, HashMap<String, Object> hm) {
		return sqlSession.insert("galaryMapper.insertGalaryReplyEnroll", hm);
	}

	@Override
	public int deleteGalaryReply(SqlSession sqlSession, HashMap<String, Object> hm) {
		return sqlSession.update("galaryMapper.deleteGalaryReply", hm);
	}
	
	
	
}
