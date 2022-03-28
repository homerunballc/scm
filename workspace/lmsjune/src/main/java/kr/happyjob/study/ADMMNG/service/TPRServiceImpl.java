package kr.happyjob.study.ADMMNG.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.ADMMNG.model.ProbInfo;

@Service
public class TPRServiceImpl implements TPRService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	TPRService TPRDao;

	/** 강의 목록 조회 */
	public List<ProbInfo> listProbInfo(Map<String, Object> paramMap) throws Exception {
		
		List<ProbInfo> listProbInfo = TPRDao.listProbInfo(paramMap);
		return listProbInfo;
	}
	
	public int countListProbInfo(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = TPRDao.countListProbInfo(paramMap);
		
		return totalCount;
	}
	
	/** 문제 단건 조회 */
	public ProbInfo selectProb(Map<String, Object> paramMap) throws Exception {
		
		ProbInfo probInfo = TPRDao.selectProb(paramMap);
		return probInfo;
	}
	
	/** 문제 저장 */
	public int insertProb(Map<String, Object> paramMap) throws Exception{
		
		int ret = TPRDao.insertProb(paramMap);
		return ret;
	}
	
	/** 문제 수정 */
	public int updateProb(Map<String, Object> paramMap) throws Exception{
		
		int ret = TPRDao.updateProb(paramMap);
		return ret;
		
	}
	
	/** 문제 삭제 */
	public int deleteProb(Map<String, Object> paramMap) throws Exception{
		
		int ret = TPRDao.deleteProb(paramMap);
		return ret;
		
	}
}
