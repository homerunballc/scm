package kr.happyjob.study.ADMMNG.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMMNG.model.ClassInfo;

public interface SCHService {
	
	/** 수강 목록 조회 */
	public List<ClassInfo> listClassInfo(Map<String, Object> paramMap) throws Exception;
	
	/** 수강 목록 카운트 조회 */
	public int countListClassInfo(Map<String, Object> paramMap) throws Exception;
	
	/** 수강 단건 조회 
	 * @throws Exception */
	public ClassInfo selectClassInfo(Map<String, Object> paramMap) throws Exception;
	
	/** 수강 저장 */
	public int insertClassInfo(Map<String, Object> paramMap) throws Exception;
	
	/** 수강 수정 */
	public int updateClassInfo(Map<String, Object> paramMap) throws Exception;
	
	/** 수강 삭제 */
	public int deleteClassInfo(Map<String, Object> paramMap) throws Exception;
		
}
