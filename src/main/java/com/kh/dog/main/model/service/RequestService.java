package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Request;

public interface RequestService {

	int insertRequest(Request r);

	ArrayList<Request> updateList();

	ArrayList<Request> selectMyList(PageInfo pi, String id);

	int getListCount(String id);

	int getAdminList(String adminStatus);

	ArrayList<Request> selectAdminList(PageInfo pi, String adminStatus);

	int userDeleteRequest(int requestNo);

	Request selectRequest(int requestNo);

	int updateRequest(Request r);

	Request selectAdminDetail(int requestNo);

	int acceptRequest(int requestNo);

	void refuseRequest(int requestNo);

	int deleteCheck(List<Integer> checkBoxArr);



}	
