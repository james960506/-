package com.kh.dog.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dog.main.model.vo.Notice;
import com.kh.dog.main.model.vo.PageInfo;

@Repository
public class NoticeDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1 )* pi.getBoardLimit(), 
										pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", i, rowBounds );
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}


	public int updateCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.updateCount", noticeNo);
	}

	public ArrayList<Notice> selectDetailNoticeList(SqlSessionTemplate sqlSession, Integer noticeNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectDetailNoticeList", noticeNo);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}

	public int delteAttm(SqlSessionTemplate sqlSession, String delRename) {
		return sqlSession.update("noticeMapper.delteAttm", delRename);
	}

	public int updateAttm(SqlSessionTemplate sqlSession, String fileName, int noticeNo, String OriginalFilename) {
		Map<String, Object> params = new HashMap<>();
		params.put("fileName", fileName);
		params.put("noticeNo", noticeNo);
		params.put("OriginalFilename", OriginalFilename);

		return sqlSession.update("noticeMapper.updateAttm",params);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int searchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("noticeMapper.searchList", map);
	}

	public ArrayList<Notice> searchtNoticeList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1 )* pi.getBoardLimit(), 
												pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.searchtNoticeList", map,rowBounds);
	}


}
