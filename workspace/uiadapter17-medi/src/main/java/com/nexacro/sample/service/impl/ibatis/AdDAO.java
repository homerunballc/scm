package com.nexacro.sample.service.impl.ibatis;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.nexacro.sample.vo.DetailCDVO;
import com.nexacro.spring.dao.ibatis.NexacroIbatisAbstractDAO;

@Repository("adDAO")
public class AdDAO extends NexacroIbatisAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdList(Map<String, Object> searchMap) {
		return (List<Map<String, Object>>) list("nexacroAd.selectAdList",searchMap);
	}

	public void updatecfcom0(String comfcom, String comfcomf){
		update ("nexacroAd,comfcom0",comfcomf);
		return;
	}
	public void updatecfcom1(String comfcom,String comfcomf){
		update ("nexacroAd,comfcom1",comfcomf);
		return;
	}
	public void updatecfcom2(String comfcom,String comfcomf){
		update ("nexacroAd,comfcom2",comfcomf);
		return;
	}

	
	
	public void MCinsert(Map<String,Object> MCinsert){
		insert ("nexacroMC,insert",MCinsert);
		return;
	}
	public void MCupdatet(Map<String, Object> MCupdate){
		update ("nexacroMC,update",MCupdate);
		return;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> modelview(String accno){
		return (Map<String,Object>) select ("nexacroMC,select",accno);
		
	}
	
}
