package kr.happyjob.study.system.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.system.dao.SelectComboDao;
import kr.happyjob.study.system.model.comcombo;

@Service
public class SelectComboServiceImpl implements SelectComboService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	SelectComboDao selectComboDao;
	
	/** 과정 목록 조회 */
	@Override
	public List<comcombo> selectcourselist(Map<String, Object> paramMap) throws Exception {
		logger.info("   - selectcourselist paramMap : " + paramMap);
		
		List<comcombo> listcouseCod = selectComboDao.selectcourselist(paramMap);
		
		return listcouseCod;
	}
	
	/** 강의실 몯록 조회 */
	@Override
	public List<comcombo> selectroomlist(Map<String, Object> paramMap) throws Exception {
		logger.info("   - selectroomlist paramMap : " + paramMap);
		
		List<comcombo> listroomCod = selectComboDao.selectroomlist(paramMap);
		
		return listroomCod;
	}
	
	/** 강의실 몯록 조회 */
	@Override
	public List<comcombo> selecttealist(Map<String, Object> paramMap) throws Exception {
		logger.info("   - selecttealist paramMap : " + paramMap);
		
		List<comcombo> listroomCod = selectComboDao.selecttealist(paramMap);
		
		return listroomCod;
	}	
	
}
