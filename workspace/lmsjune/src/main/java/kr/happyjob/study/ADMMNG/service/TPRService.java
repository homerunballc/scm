package kr.happyjob.study.ADMMNG.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMMNG.model.ProbInfo;

public interface TPRService {
	
	/** 강의 목록 조회 */
	public List<ProbInfo> listProbInfo(Map<String, Object> paramMap) throws Exception;
	
	public int countListProbInfo(Map<String, Object> paramMap) throws Exception;
	
	/** 문제 단건 조회 */
	public ProbInfo selectProb(Map<String, Object> paramMap) throws Exception;
	
	/** 문제 저장 */
	public int insertProb(Map<String, Object> paramMap) throws Exception;
	
	/** 문제 수정 */
	public int updateProb(Map<String, Object> paramMap) throws Exception;
	
	/** 문제 삭제 */
	public int deleteProb(Map<String, Object> paramMap) throws Exception;
}
