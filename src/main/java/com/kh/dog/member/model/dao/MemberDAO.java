package com.kh.dog.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.member.model.vo.Dog;
import com.kh.dog.member.model.vo.Member;

@Repository		// dao역할을 하는 객체 생성
public class MemberDAO {
	// memberServiceImpl에서 넘어옴
	
	// 회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);	// memberMapper에 insertMember, m 보낸다
	}
	// 로그인
	public Member login(SqlSessionTemplate sqlSession, Member m) {
		 return sqlSession.selectOne("memberMapper.login", m);	// 넘기는 데이터 m
	}
	// 아이디 중복
	public int checkId(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.checkId", userId);
	}
	// 회원관리 + 페이징
	public ArrayList<Member> memberAdmin(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1 )* pi.getBoardLimit(), 
											 pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.memberAdmin", map, rowBounds);
	}
	// 조건 검색
	public int getListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.getListCount", map);
	}
	// 회원관리 상세조회
	public Member selectMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectMember", userId);
	}
	// 내 정보 수정
	public ArrayList<HashMap<String, Object>> myInfo(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.myInfo", userId);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	// 아이디 찾기
	public Member selectFindId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectFindId", m);
	}
	// 회원 탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMem", userId);
	}
	// 비밀번호 찾기
	public int selectFindPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectFindPwd", m);
	}
	// 회원 관리 선택 삭제
	public void selectDelete(SqlSessionTemplate sqlSession, String[] deleteIds) {
		sqlSession.update("memberMapper.deleteMember", deleteIds);	
	}
	// 반려견 정보 추가
	public void insertDog(SqlSessionTemplate sqlSession, ArrayList<Map<String, Object>> dogArr) {
		sqlSession.insert("memberMapper.insertDog", dogArr);
	}
	// 비밀번호 변경
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePwd", m);
	}
	// 반려견 삭제
	public void deleteDog(SqlSessionTemplate sqlSession, String userId) {
		sqlSession.delete("memberMapper.deleteDog", userId);
	}
	
	
	
	
	



	
	
	
	
	
}