package com.kh.dog.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.member.model.dao.MemberDAO;
import com.kh.dog.member.model.vo.Dog;
import com.kh.dog.member.model.vo.Member;

@Service	// 
public class MemberServiceImpl implements MemberService {
	
	@Autowired	
	private SqlSessionTemplate sqlSession;	
	// 이미 만들어져있는 클래스에는 bean태그 이용함, 그렇지 않은 경우엔 어노테이션
	// context-root에 bean태그 이용해서 Sqlsession 만들어 놨고, 프레임 워크가 객체 만들어놔서 주입받기 위해서 의존성주입(DI), DI가 이루어지기 위해서 autowired함
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	@Override
	public int checkId(String userId) {
		return mDAO.checkId(sqlSession, userId);
	}
	
	@Override
	public Member selectMember(String userId) {
		return mDAO.selectMember(sqlSession, userId);
	}

	@Override
	public ArrayList<HashMap<String, Object>> myInfo(String userId) {
		return mDAO.myInfo(sqlSession, userId);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public Member selectFindId(Member m) {
		return mDAO.selectFindId(sqlSession, m);
	}

	@Override
	public int deleteMember(String userId) {
		return mDAO.deleteMember(sqlSession, userId);
	}

	@Override
	public int selectFindPwd(Member m) {
		return mDAO.selectFindPwd(sqlSession, m);
	}

	@Override
	public void selectDelete(String[] deleteIds) {
		mDAO.selectDelete(sqlSession, deleteIds);
	}

	@Override
	public void insertDog(ArrayList<Map<String, Object>> dogArr) {
		mDAO.insertDog(sqlSession, dogArr);
	}

	// 검색
	@Override
	public int getListCount(HashMap<String, String> map) {
		return mDAO.getListCount(sqlSession,map);
	}
	
	// 회원 관리
	@Override
	public ArrayList<Member> memberAdmin(PageInfo pi, HashMap<String, String> map) {
		return mDAO.memberAdmin(sqlSession, pi, map);
	}

	// 비밀번호 변경
	@Override
	public int changePwd(Member m) {
		return mDAO.changePwd(sqlSession, m);
	}

	@Override
	public void deleteDog(String userId) {
		mDAO.deleteDog(sqlSession, userId);
	}



		
		

	








	 
	
}
