package kr.happyjob.study.ADMMNG.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.ADMMNG.model.AdminLectureInfo;
import kr.happyjob.study.ADMMNG.model.TSTLectureInfo;

@Service
public class TSTLecServiceImpl implements TSTLecService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	TSTLecService TSTLecDao;

	/** 강의 목록 조회 */
	public List<TSTLectureInfo> listTSTLectureInfo(Map<String, Object> paramMap) throws Exception{
		
		List<TSTLectureInfo> listTSTLecInfo = TSTLecDao.listTSTLectureInfo(paramMap);
		return listTSTLecInfo;
	}
	
	/** 강의 목록 카운트 조회 */
	public int countListTSTLectureInfo(Map<String, Object> paramMap) throws Exception{
		
		int totalCount = TSTLecDao.countListTSTLectureInfo(paramMap);
		return totalCount;
	}
	
}
