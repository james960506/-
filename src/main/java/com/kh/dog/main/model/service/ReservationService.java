package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reservation;
import com.kh.dog.member.model.vo.Dog;

public interface ReservationService {

	int checkCount(String[] searchArr);

	ArrayList<Dog> selectDog(String id);

	int selectCost(String[] cboxValue);

	int selectLastRno();

	int insertRes(Reservation res);

	int getListCount(String id);

	ArrayList<Reservation> selectMyResList(PageInfo pi, String id);

	Reservation selectMyRes(int rno);

	ArrayList<Dog> selectDogList(String[] dnos);

	ArrayList<Reservation> searchResDate(PageInfo pi, HashMap<String, Object> map);

	int getSearchListCount(HashMap<String, Object> map);

	void updateStatus(HashMap<String, String> map);
}
