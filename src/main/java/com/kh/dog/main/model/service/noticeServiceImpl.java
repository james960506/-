package com.kh.dog.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dog.main.model.dao.NoticeDAO;
import com.kh.dog.main.model.vo.Notice;
import com.kh.dog.main.model.vo.PageInfo;

@Service
public class noticeServiceImpl implements noticeService {
	
	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return nDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi, int i) {
		
		return nDAO.selectNoticeList(sqlSession,pi,i);
	}

	

	@Override
	public Notice selectBoard(int noticeNo, String id) {
		Notice n = nDAO.selectNotice(sqlSession, noticeNo);
		if(n != null) {
			if(!n.getUserId().equals(id)) {
				int result = nDAO.updateCount(sqlSession, noticeNo);
				
				if(result > 0) {
					n.setNoticeCount(n.getNoticeCount() + 1);
				}
			}
		}
		return n;
	}

	@Override
	public ArrayList<Notice> selectDetailNoticeList(Integer noticeNo) {
		return nDAO.selectDetailNoticeList(sqlSession, noticeNo);
	}


	@Override
	public int insertNotice(Notice n) {
		return nDAO.insertNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return nDAO.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int deleteAttm(String delRename) {
		return nDAO.delteAttm(sqlSession, delRename);
	}

	@Override
	public int updateAttm(String fileName, int noticeNo, String OriginalFilename) {
		return nDAO.updateAttm(sqlSession, fileName, noticeNo, OriginalFilename);
	}

	@Override
	public int updateNotice(Notice n) {
		return nDAO.updateNotice(sqlSession, n);
	}

	@Override
	public int searchList(HashMap<String, String> map) {
		return nDAO.searchList(sqlSession, map);
	}

	@Override
	public ArrayList<Notice> searchtNoticeList(PageInfo pi, HashMap<String, String> map) {
		return nDAO.searchtNoticeList(sqlSession,pi,map);
	}





	

}
