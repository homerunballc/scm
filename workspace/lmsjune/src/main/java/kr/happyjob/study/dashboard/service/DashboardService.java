package kr.happyjob.study.dashboard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.dashboard.model.DashboardModel;
import kr.happyjob.study.dashboard.model.LectureModel;
import kr.happyjob.study.system.model.UserMgmtModel;

public interface DashboardService {
	
	public DashboardModel goChart(Map<String, Object> paramMap) throws Exception;
	
	// 엔지니어 수 조회
	public int cntEngineer(Map<String, Object> paramMap)throws Exception ;
	// 기업 수 조회
	public int cntCompany(Map<String, Object> paramMap)throws Exception ;
	// 프로젝트 수 조회
	public int cntProject(Map<String, Object> paramMap)throws Exception ;
		
	public List<LectureModel> listlec(Map<String, Object> paramMap) throws Exception;
	
	public int listleccnt(Map<String, Object> paramMap) throws Exception;
	
	public LectureModel selectlec(Map<String, Object> paramMap) throws Exception;
	
	public void lectureSave(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	public void applySave(Map<String, Object> paramMap) throws Exception;
	
	public void canapplySave(Map<String, Object> paramMap) throws Exception;
}
