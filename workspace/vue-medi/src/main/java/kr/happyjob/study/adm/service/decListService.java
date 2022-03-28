package kr.happyjob.study.adm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.system.model.decListModel;

public interface decListService {
	public List<decListModel> decList(Map<String, Object> paramMap);
	public int decListcount(Map<String, Object> paramMap);
	public decListModel modellist(Map<String, Object> paramMap);
	public void minsert(Map<String, Object> paramMap);
	public void mupdate(Map<String, Object> paramMap);
	public void mdelect(Map<String, Object> paramMap);
	
	public decListModel oneselect(Map<String, Object> paramMap);
	
	
	public void cupdate(Map<String, Object> paramMap);
}
