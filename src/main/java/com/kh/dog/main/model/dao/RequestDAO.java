package com.kh.dog.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Request;

@Repository
public class RequestDAO {

	public int insertRequest(SqlSessionTemplate session, Request r) {
		System.out.println(r);
		return session.insert("requestMapper.insertRequest", r);
	}

	public ArrayList<Request> updateList(SqlSessionTemplate session) {
		return (ArrayList)session.selectList("requestMapper.updateList");
	}

	public ArrayList<Request> selectMyList(SqlSessionTemplate session, String id, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)session.selectList("requestMapper.selectMyList", id, rowBounds);
	}

	public int getListCount(SqlSessionTemplate session, String id) {
		return session.selectOne("requestMapper.getListCount", id);
	}

	public int getAdminList(SqlSessionTemplate session, String adminStatus) {
		if(adminStatus.equals("A")) {
			return session.selectOne("requestMapper.getAllAdminList");
			
		}else {
			return session.selectOne("requestMapper.getAdminList", adminStatus);
		}
		
	}

	public ArrayList<Request> selectAdminList(SqlSessionTemplate session, PageInfo pi, String adminStatus) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(adminStatus.equals("A")) {
			return (ArrayList)session.selectList("requestMapper.selectAdminAllList", null, rowBounds);
		}else {
			return (ArrayList)session.selectList("requestMapper.selectAdminList", adminStatus, rowBounds);
		}
		
	}

	public int userDeleteRequest(SqlSessionTemplate session, int requestNo) {
		return session.update("requestMapper.userDeleteRequest", requestNo);
	}

	public Request selectRequest(SqlSessionTemplate session, int requestNo) {
		return session.selectOne("requestMapper.selectRequest", requestNo);
	}

	public int updateRequest(SqlSessionTemplate session, Request r) {
		return session.update("requestMapper.updateRequest", r);
	}

	public Request selectAdminDetail(SqlSessionTemplate session, int requestNo) {
		return session.selectOne("requestMapper.selectAdminDetail", requestNo);
	}

	public int acceptRequest(SqlSessionTemplate session, int requestNo) {
		return session.update("requestMapper.acceptRequest", requestNo);
	}

	public void refuseRequest(SqlSessionTemplate session, int requestNo) {
		session.update("requestMapper.refuseRequest", requestNo);
		
	}

	public int deleteCheck(SqlSessionTemplate session, List<Integer> checkBoxArr) {
		return session.update("requestMapper.deleteCheck", checkBoxArr);
	}


	
	
	
}
