package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dog.main.model.dao.RequestDAO;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Request;

@Service
public class RequestServiceImpl implements RequestService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private RequestDAO rDAO;

	@Override
	public int insertRequest(Request r) {
		return rDAO.insertRequest(session, r);
	}

	@Override
	public ArrayList<Request> updateList() {
		return rDAO.updateList(session);
	}

	@Override
	public ArrayList<Request> selectMyList(PageInfo pi, String id) {
		return rDAO.selectMyList(session, id, pi);
	}

	@Override
	public int getListCount(String id) {
		return rDAO.getListCount(session, id);
	}

	@Override
	public int getAdminList(String adminStatus) {
		return rDAO.getAdminList(session, adminStatus);
	}

	@Override
	public ArrayList<Request> selectAdminList(PageInfo pi, String adminStatus) {
		return rDAO.selectAdminList(session, pi, adminStatus);
	}

	

	@Override
	public int userDeleteRequest(int requestNo) {
		return rDAO.userDeleteRequest(session, requestNo);
	}

	

	@Override
	public Request selectRequest(int requestNo) {
		return rDAO.selectRequest(session, requestNo);
	}


	@Override
	public int updateRequest(Request r) {
		return rDAO.updateRequest(session, r);
	}


	@Override
	public Request selectAdminDetail(int requestNo) {
		return rDAO.selectAdminDetail(session, requestNo);
	}


	@Override
	public int acceptRequest(int requestNo) {
		return rDAO.acceptRequest(session, requestNo);
	}

	
	@Override
	public void refuseRequest(int requestNo) {
		rDAO.refuseRequest(session, requestNo);
		
	}

	@Override
	public int deleteCheck(List<Integer> checkBoxArr) {
		return rDAO.deleteCheck(session, checkBoxArr);
	}


	

	
	
	
}
