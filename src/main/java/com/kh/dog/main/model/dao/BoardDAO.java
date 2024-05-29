package com.kh.dog.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dog.main.model.vo.Board;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reply;

@Repository
public class BoardDAO {
	public int getlistCount(SqlSessionTemplate sqlSession, String kind) {
		return sqlSession.selectOne("boardMapper.getlistCount", kind);
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String kind) {

		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(),
				                            pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", kind, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.updateCount", boardNo);
	}

	public int getlist2Count(SqlSessionTemplate sqlSession, String kind) {
		return sqlSession.selectOne("boardMapper.getlist2Count",kind);
	}

	public ArrayList<Board> selectBoardList2(SqlSessionTemplate sqlSession, PageInfo pi, String kind) {
		
		RowBounds rowbounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(),
				                            pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardlist2", kind, rowbounds);
	}

	public int getlist3Count(SqlSessionTemplate sqlSession, String kind) {
		return sqlSession.selectOne("boardMapper.getlist3Count",kind);
	}


	public Board selectBoard3(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard3", boardNo) ;
	}

	public Board selectBoard2(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard2", boardNo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.deleteBoard",bNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard",b);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply",boardNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("boardMapper.deleteReply",replyNo);
	}

	
	  public int searchBoardCount(SqlSessionTemplate sqlSession, HashMap<String,String> map) { 
		  
		  return sqlSession.selectOne("boardMapper.searchBoardCount",map);
	  
	  }

	 
	  public ArrayList<Board> searchBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		RowBounds rowbounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(),
                              pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchBoardList", map, rowbounds);
	}

	public ArrayList<Board> myPageList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		RowBounds rowbounds = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(),
                pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.myPageList",id, rowbounds);
		
	}

	public Board selectBoard4(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard4", boardNo) ;
	}

	public int selectmypageListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("boardMapper.mypageListCount",id);
	}

	public int updateLike(SqlSession sqlSession, HashMap<String, Object> hs, String forHeartCheck) {
		int result = 0;
		
		if(forHeartCheck.equals("forHeartCheck")) {
			System.out.println(sqlSession.selectOne("boardMapper.checkLike", hs) + "dao1");
			return sqlSession.selectOne("boardMapper.checkLike", hs);
		}else {
			result = sqlSession.selectOne("boardMapper.checkLike", hs);
			System.out.println(sqlSession.selectOne("boardMapper.checkLike", hs) + "dao2");
		}
		
		
		System.out.println(sqlSession.selectOne("boardMapper.checkLike", hs) + "dao3");
		int update = 0;
		if(result > 0) {
			update = sqlSession.delete("boardMapper.deleteLike",hs)+1;
			System.out.println(update+ "dao4");
		}else {
			update = sqlSession.insert("boardMapper.insertLike",hs);
			System.out.println(update+ "dao5");
		}
		System.out.println(update+ "dao6");
		return update;
	}

	public int updateViewLike(SqlSessionTemplate sqlSession, Integer boardNo) {
		return sqlSession.selectOne("boardMapper.updateViewLike",boardNo);
	}

	
	
	

}
