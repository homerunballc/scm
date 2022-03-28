package kr.happyjob.study.ADMMNG.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMMNG.model.TSTLectureInfo;

public interface TSTLecService {
	
	/** 강의 목록 조회 */
	public List<TSTLectureInfo> listTSTLectureInfo(Map<String, Object> paramMap) throws Exception;
	
	/** 강의 목록 카운트 조회 */
	public int countListTSTLectureInfo(Map<String, Object> paramMap) throws Exception;
}
