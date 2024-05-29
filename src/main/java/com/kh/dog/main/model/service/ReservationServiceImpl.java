package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dog.main.model.dao.ReservationDAO;
import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reservation;
import com.kh.dog.member.model.vo.Dog;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	ReservationDAO rDao;

	@Override
	public int checkCount(String[] searchArr) {
		return rDao.checkCount(sqlSession, searchArr);
	}

	@Override
	public ArrayList<Dog> selectDog(String id) {
		return rDao.selectDog(sqlSession, id);
	}

	@Override
	public int selectCost(String[] cboxValue) {
		return rDao.selectCost(sqlSession, cboxValue);
	}

	@Override
	public int selectLastRno() {
		return rDao.selectLastRno(sqlSession);
	}

	@Override
	public int insertRes(Reservation res) {
		return rDao.insertRes(sqlSession, res);
	}

	@Override
	public int getListCount(String id) {
		return rDao.getListCount(sqlSession, id);
	}

	@Override
	public ArrayList<Reservation> selectMyResList(PageInfo pi, String id) {
		return rDao.selectMyResList(sqlSession, pi, id);
	}

	@Override
	public Reservation selectMyRes(int rno) {
		return rDao.selectMyRes(sqlSession, rno);
	}

	@Override
	public ArrayList<Dog> selectDogList(String[] dnos) {
		return rDao.selectDogList(sqlSession, dnos);
	}

	@Override
	public ArrayList<Reservation> searchResDate(PageInfo pi, HashMap<String, Object> map) {
		return rDao.searchResDate(sqlSession, pi, map);
	}

	@Override
	public int getSearchListCount(HashMap<String, Object> map) {
		return rDao.getSearchListCount(sqlSession, map);
	}

	@Override
	public void updateStatus(HashMap<String, String> map) {
		rDao.updateStatus(sqlSession, map);
	}

		


}
