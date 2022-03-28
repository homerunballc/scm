package kr.happyjob.study.TCHSUP.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.ADMMNG.model.AdminLectureInfo;
import kr.happyjob.study.TCHSUP.model.LectureInfo;

public interface LectureService {
	
	public void addLecture(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	public List<LectureInfo> lecList();
	
	public AdminLectureInfo planDetail(int lec_no) throws Exception;
	

}
