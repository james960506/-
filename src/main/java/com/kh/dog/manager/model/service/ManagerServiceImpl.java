package com.kh.dog.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reservation;
import com.kh.dog.manager.model.dao.ManagerDAO;
import com.kh.dog.member.model.vo.Dog;

@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	ManagerDAO mDao;

	@Override
	public ArrayList<Reservation> selectResList(PageInfo pi) {
		return mDao.selectResList(sqlSession, pi);
	}

	@Override
	public void deleteRes(String[] deleteRnos) {
		mDao.deleteRes(sqlSession, deleteRnos);
	}

	@Override
	public ArrayList<Reservation> searchResList(HashMap<String, String> map, PageInfo pi) {
		return mDao.searchResList(sqlSession, map, pi);
	}

	@Override
	public int getListCount() {
		return mDao.getListCount(sqlSession);
	}

	@Override
	public int searchListCount(HashMap<String, String> map) {
		return mDao.searchListCount(sqlSession, map);
	}

	@Override
	public Reservation selectRes(int rno) {
		return mDao.selectRes(sqlSession, rno);
	}

	@Override
	public ArrayList<Dog> selectDogList(String[] dnos) {
		return mDao.selectDogList(sqlSession, dnos);
	}
}
