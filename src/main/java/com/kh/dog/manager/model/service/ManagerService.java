package com.kh.dog.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reservation;
import com.kh.dog.member.model.vo.Dog;

public interface ManagerService {

	ArrayList<Reservation> selectResList(PageInfo pi);

	void deleteRes(String[] deleteRnos);

	ArrayList<Reservation> searchResList(HashMap<String, String> map, PageInfo pi);

	int getListCount();

	int searchListCount(HashMap<String, String> map);

	Reservation selectRes(int rno);

	ArrayList<Dog> selectDogList(String[] dnos);

}