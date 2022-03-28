package kr.happyjob.study.system.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.system.model.comcombo;

public interface SelectComboDao {

	/** 과정 목록 조회 */
	public List<comcombo> selectcourselist(Map<String, Object> paramMap) throws Exception;
	
	/** 강의실 목록 조회 */
	public List<comcombo> selectroomlist(Map<String, Object> paramMap) throws Exception;
		
	/** 교수 몯록 조회 */
	public List<comcombo> selecttealist(Map<String, Object> paramMap) throws Exception;	
	
}
