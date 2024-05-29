package com.kh.dog.main.model.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dog.main.model.vo.PageInfo;
import com.kh.dog.main.model.vo.Reservation;
import com.kh.dog.member.model.vo.Dog;

@Repository
public class ReservationDAO {
	
	
	public int checkCount(SqlSessionTemplate sqlSession, String[] searchArr) {				  // searchArr : 체크인 날짜와 체크아웃 날짜 사이의 모든 날짜 배열 
		ArrayList<Integer> list = new ArrayList<>();										  // list : 해당 날짜의 예약자수를 담음
		for (int i = 0; i < searchArr.length; i++) { 										  // searchArr의 배열을 for문을 통해 하나씩 실행한다.
			if (sqlSession.selectOne("reservationMapper.checkCount", searchArr[i]) == null) { // 결과가 null일때 : 해당날짜에 예약자가 없을때
				list.add(0); 																  // 예약자가 없기때문에 list에 0을 추가한다.
			} else {
				list.add(sqlSession.selectOne("reservationMapper.checkCount", searchArr[i])); // 예약자수 만큼 list에 추가한다.
			}
		}
		int count = 30 - Collections.max(list);												  // count : 하루 최대 예약 가능 객실 수 30에서 list에서 가장 큰수를 뺀 예약 가능 객실 수
		return count;																		  // 예약 가능 객실 수 반환
	}

	public ArrayList<Dog> selectDog(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectDog", id);
	}

	public int selectCost(SqlSessionTemplate sqlSession, String[] cboxValue) {
		int result = 0;
		
		//임시
		for (int i = 0; i < cboxValue.length; i++) {
			if(cboxValue[i].length() == 4) {
				result += (int)sqlSession.selectOne("reservationMapper.selectCostXL", cboxValue[i]);
			}else if(cboxValue[i].equals("대형견")) {
				result += (int)sqlSession.selectOne("reservationMapper.selectCostL", cboxValue[i]);
			}else {
				result += (int)sqlSession.selectOne("reservationMapper.selectCost", cboxValue[i]);
			}
		}
		
		return result;
	}

	public int selectLastRno(SqlSessionTemplate sqlSession) {
		if(sqlSession.selectOne("reservationMapper.selectLastRno") == null) {
			return 0;
		}else {
			return sqlSession.selectOne("reservationMapper.selectLastRno");
		}
	}

	public int insertRes(SqlSessionTemplate sqlSession, Reservation res) {
		return sqlSession.insert("reservationMapper.insertRes", res);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("reservationMapper.getListCount", id);
	}

	public ArrayList<Reservation> selectMyResList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMyResList", id, rowBounds);
	}

	public Reservation selectMyRes(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("reservationMapper.selectMyRes", rno);
	}

	public ArrayList<Dog> selectDogList(SqlSessionTemplate sqlSession, String[] dnos) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectDogList", dnos);
	}
	
	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("reservationMapper.getSearchListCount", map);
	}

	public ArrayList<Reservation> searchResDate(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("reservationMapper.searchResDate", map, rowBounds);
	}

	public void updateStatus(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.update("reservationMapper.updateStatus",map);
	}

}
