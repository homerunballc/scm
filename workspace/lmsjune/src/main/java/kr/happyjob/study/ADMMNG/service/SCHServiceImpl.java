package kr.happyjob.study.ADMMNG.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.ADMMNG.model.ClassInfo;
import kr.happyjob.study.ADMMNG.dao.SCHDao;

@Service
public class SCHServiceImpl implements SCHService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	SCHDao SCHDao;
		
	/** 수강 목록 조회 */
	public List<ClassInfo> listClassInfo(Map<String, Object> paramMap) throws Exception {
		
		List<ClassInfo> listClassInfo = SCHDao.listClassInfo(paramMap);
		return listClassInfo;
	}
	
	/** 수강 목록 카운트 조회 */
	public int countListClassInfo(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = SCHDao.countListClassInfo(paramMap);
		return totalCount;		
	}
	
	/** 수강 단건 조회 */
	public ClassInfo selectClassInfo(Map<String, Object> paramMap)throws Exception {
		
		ClassInfo classinfo = SCHDao.selectClassInfo(paramMap);
		return classinfo;
	}
	
	/** 수강 저장 */
	public int insertClassInfo(Map<String, Object> paramMap)throws Exception {
		
		int ret = SCHDao.insertClassInfo(paramMap);
		return ret;
	}
	
	/** 수강 수정 */
	public int updateClassInfo(Map<String, Object> paramMap)throws Exception {
		
		int ret = SCHDao.updateClassInfo(paramMap);
		return ret;
	}
	
	/** 수강 삭제 */
	public int deleteClassInfo(Map<String, Object> paramMap)throws Exception {
		
		int ret = SCHDao.deleteClassInfo(paramMap);
		return ret;
	}
	
}
