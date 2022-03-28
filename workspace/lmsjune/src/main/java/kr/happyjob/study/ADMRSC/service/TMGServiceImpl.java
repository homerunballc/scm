package kr.happyjob.study.ADMRSC.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.ADMRSC.model.TeacherInfo;
import kr.happyjob.study.ADMRSC.dao.TMGDao;

@Service
public class TMGServiceImpl implements TMGService {

	@Autowired
	private TMGDao tmgDao;
	
	// 강사관리 리스트 조회
	@Override
	public List<TeacherInfo> TMGList(Map<String, Object> paramMap) throws Exception {
		List<TeacherInfo> TMGList = tmgDao.TMGList(paramMap);
		return TMGList;
	}

	// 강사관리 리스트 카운트 조회
	@Override
	public int countListTMG(Map<String, Object> paramMap) throws Exception {
		int totalCount = tmgDao.countListTMG(paramMap);
		return totalCount;
	}

	// 강사관리 리스트 단건 조회
	@Override
	public TeacherInfo selectTMG(Map<String, Object> paramMap) throws Exception {
		TeacherInfo teacherInfo = tmgDao.selectTMG(paramMap);
		return teacherInfo;
	}

	// 강사정보 추가
	@Override
	public int insertTMG(Map<String, Object> paramMap) throws Exception {
		int ret = tmgDao.insertTMG(paramMap);
		return ret;
	}

	// 강사정보 수정
	@Override
	public int updateTMG(Map<String, Object> paramMap) throws Exception {
		int ret = tmgDao.updateTMG(paramMap);
		return ret;
	}

	// 강사정보 삭제
	@Override
	public int deleteTMG(Map<String, Object> paramMap) throws Exception {
		int ret = tmgDao.deleteTMG(paramMap);
		return ret;
	}

}
