package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.dog.main.model.vo.Notice;
import com.kh.dog.main.model.vo.PageInfo;

public interface noticeService {

	int getListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi, int i);


	Notice selectBoard(int noticeNo, String id);

	ArrayList<Notice> selectDetailNoticeList(Integer noticeNo);

	int insertNotice(Notice n);

	int deleteNotice(int noticeNo);

	int deleteAttm(String delRename);

	int updateAttm(String fileName, int noticeNo , String OriginalFilename);

	int updateNotice(Notice n);

	int searchList(HashMap<String, String> map);

	ArrayList<Notice> searchtNoticeList(PageInfo pi, HashMap<String, String> map);









}
