package kr.happyjob.study.ADMMNG.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.ADMMNG.model.AdminLectureInfo;

@Service
public class ComnADMMNGServiceImpl implements ComnADMMNGService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	ComnADMMNGService ComnADMMNGDao;

	/** 강의 목록 조회 */
	public List<AdminLectureInfo> listAdminLectureInfo(Map<String, Object> paramMap) throws Exception {
		
		List<AdminLectureInfo> listAdminLectureInfo = ComnADMMNGDao.listAdminLectureInfo(paramMap);
		return listAdminLectureInfo;
	}
	
	/** 강의 목록 카운트 조회 */
	public int countListAdminLectureInfo(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = ComnADMMNGDao.countListAdminLectureInfo(paramMap);
		
		return totalCount;
	}
	
	/** 강의 조회 */
	public AdminLectureInfo selectAdminLectureInfo(Map<String, Object> paramMap) throws Exception{
	
		AdminLectureInfo adminLectureInfo = ComnADMMNGDao.selectAdminLectureInfo(paramMap);
		
		return adminLectureInfo;
	}
	
	/** 강의 저장 */
	public int insertAdminLectureInfo(Map<String, Object> paramMap) throws Exception{
		
		int ret = ComnADMMNGDao.insertAdminLectureInfo(paramMap);
		
		return ret;
	}
	
	/** 강의 수정 */
	public int updateAdminLectureInfo(Map<String, Object> paramMap) throws Exception{
		
		int ret = ComnADMMNGDao.updateAdminLectureInfo(paramMap);
		
		return ret;
	}
	
	/** 강의 삭제 */
	public int deleteAdminLectureInfo(Map<String, Object> paramMap) throws Exception{
		
		int ret = ComnADMMNGDao.deleteAdminLectureInfo(paramMap);
		
		return ret;
	}
	
}
