package com.kh.dog.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reservation;
import com.kh.dog.member.model.vo.Dog;

@Repository
public class ManagerDAO {

	public ArrayList<Reservation> selectResList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("managerMapper.selectResList", null, rowBounds);
	}

	public void deleteRes(SqlSessionTemplate sqlSession, String[] deleteRnos) {
		sqlSession.update("managerMapper.deleteRes", deleteRnos);
	}

	public ArrayList<Reservation> searchResList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("managerMapper.searchResList", map, rowBounds);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.getListCount");
	}

	public int searchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("managerMapper.searchListCount", map);
	}

	public Reservation selectRes(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("managerMapper.selectRes", rno);
	}

	public ArrayList<Dog> selectDogList(SqlSessionTemplate sqlSession, String[] dnos) {
		return (ArrayList)sqlSession.selectList("managerMapper.selectDogList", dnos);
	}
	
	
}
