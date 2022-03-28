package com.nexacro.sample.service;


import java.util.List;
import java.util.Map;


import com.nexacro.sample.vo.DetailCDVO;



public interface AdService {
	
	List<Map<String,Object>> selectAdList(Map<String, Object> searchMap);
	void updatecfcom(String comfcom, String confcomf);
	void MCG(Map<String,Object> MCG, String action);
	Map<String,Object> modelview( String accno);
}
