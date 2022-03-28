package kr.happyjob.study.ADMMNG.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMMNG.model.ClassInfo;

public interface SCHDao {
	
	/** 수강 목록 카운트 조회 */
	public List<ClassInfo> listClassInfo(Map<String, Object> paramMap);
	
	/** 수강 목록 카운트 조회 */
	public int countListClassInfo(Map<String, Object> paramMap);
	
	/** 수강 단건 조회 */
	public ClassInfo selectClassInfo(Map<String, Object> paramMap);
	
	/** 수강 저장 */
	public int insertClassInfo(Map<String, Object> paramMap);
	
	/** 수강 수정 */
	public int updateClassInfo(Map<String, Object> paramMap);
	
	/** 수강 삭제 */
	public int deleteClassInfo(Map<String, Object> paramMap);
	
}
