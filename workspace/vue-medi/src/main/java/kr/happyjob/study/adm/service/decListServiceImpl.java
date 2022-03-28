package kr.happyjob.study.adm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.adm.dao.decListDao;
import kr.happyjob.study.system.model.decListModel;

@Service
public class decListServiceImpl implements decListService{
	@Autowired
	decListDao declistdao;
	
	
	@Override
	public List<decListModel> decList(Map<String, Object> paramMap) {
		
		List<decListModel> decList = declistdao.decList(paramMap); 
		return decList;
	}

	@Override
	public int decListcount(Map<String, Object> paramMap) {
		int decListcount = declistdao.decListcount(paramMap);
	      
	      return decListcount;
	}

	@Override
	public decListModel modellist(Map<String, Object> paramMap) {
		decListModel modellist = declistdao.modellist(paramMap);
		return modellist;
	}

	@Override
	public void minsert(Map<String, Object> paramMap) {
		declistdao.minsert(paramMap);
	}

	@Override
	public void mupdate(Map<String, Object> paramMap) {
		declistdao.mupdate(paramMap);
	}

	@Override
	public void mdelect(Map<String, Object> paramMap) {
		declistdao.mdelect(paramMap);
	}

	@Override
	public void cupdate(Map<String, Object> paramMap) {
		declistdao.cupdate(paramMap);
	}

	
	
	
	@Override
	public decListModel oneselect(Map<String, Object> paramMap) {
		decListModel oneselect = declistdao.oneselect(paramMap);
		return oneselect;
	}
	
	
	
	
	

}
