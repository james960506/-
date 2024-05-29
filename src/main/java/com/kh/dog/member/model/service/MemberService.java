package com.kh.dog.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.member.model.vo.Dog;
import com.kh.dog.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member login(Member m);

	int checkId(String userId);

	Member selectMember(String userId);

	ArrayList<HashMap<String, Object>> myInfo(String userId);

	int updateMember(Member m);

	Member selectFindId(Member m);

	int deleteMember(String userId);

	int selectFindPwd(Member m);

	void selectDelete(String[] deleteIds);

	void insertDog(ArrayList<Map<String, Object>> dogArr);
	// 조건 검색
	int getListCount(HashMap<String, String> map);

	ArrayList<Member> memberAdmin(PageInfo pi, HashMap<String, String> map);
	// 비밀번호 변경
	int changePwd(Member m);

	void deleteDog(String userId);













	
	
	
	
	
	

	
}
