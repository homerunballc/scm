package kr.happyjob.study.ADMRSC.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMRSC.model.TeacherInfo;

public interface TMGDao {
	
	// 강사관리 리스트 조회
	public List<TeacherInfo> TMGList(Map<String, Object> paramMap) throws Exception;

	// 강사관리 리스트 카운트 조회
	public int countListTMG(Map<String, Object> paramMap);

	// 강사관리 리스트 단건 조회
	public TeacherInfo selectTMG(Map<String, Object> paramMap);

	// 강사정보 추가
	public int insertTMG(Map<String, Object> paramMap);

	// 강사정보 수정
	public int updateTMG(Map<String, Object> paramMap);
	
	// 강사정보 삭제
	public int deleteTMG(Map<String, Object> paramMap);

}
