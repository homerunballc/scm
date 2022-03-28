package kr.happyjob.study.ADMMNG.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMMNG.model.ProbInfo;


public interface TPRDao {
	
	/** 문제 목록 조회 */
	public List<ProbInfo> listProbInfo(Map<String, Object> paramMap);
	
	/** 문제 목록 카운트 조회 */
	public int countListProbInfo(Map<String, Object> paramMap);
	
	/** 문제 단건 조회 */
	public ProbInfo selectProb(Map<String, Object> paramMap);
	
	/** 문제 저장 */
	public int insertProb(Map<String, Object> paramMap);
	
	/** 문제 수정 */
	public int updateProb(Map<String, Object> paramMap);
	
	/** 문제 삭제 */
	public int deleteProb(Map<String, Object> paramMap);
	
}
