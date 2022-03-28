package com.nexacro.sample.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nexacro.sample.service.AdService;
import com.nexacro.sample.service.AdminService;
import com.nexacro.sample.service.impl.ibatis.AdDAO;
import com.nexacro.sample.service.impl.ibatis.AdminDAO;
import com.nexacro.sample.vo.DetailCDVO;
import com.nexacro.uiadapter17.spring.core.data.DataSetRowTypeAccessor;
import com.nexacro17.xapi.data.DataSet;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("adService")
public class AdServicelmpl extends EgovAbstractServiceImpl implements AdService  {
	private Logger logger = LoggerFactory.getLogger(UiAdapterSampleServiceImpl.class);
	int size;
	int dataRowType;
	// size 두개 사용해서 전역으로 선언함;
	@Resource(name = "adDAO")
	private AdDAO adDAO;
	
	@Override
	public List<Map<String, Object>> selectAdList(Map<String, Object> searchMap) {
		return adDAO.selectAdList(searchMap);
	}
	@Override
	public void updatecfcom(String comfcom, String comfcomf) {
		
		if( "0".equals(comfcom) ){
			adDAO.updatecfcom0(comfcom,comfcomf);
		}else if( "1".equals(comfcom) ){
			adDAO.updatecfcom1(comfcom,comfcomf);
		}else {
			adDAO.updatecfcom2(comfcom,comfcomf);
		}
	}
	
	@Override
	public void MCG(Map<String, Object> MCG,String action) {
		if("I".equals(action)){
		adDAO.MCinsert(MCG);
		}else if ("U".equals(action)){
			adDAO.MCupdatet(MCG);
		}
	}
	@Override
	public Map<String, Object> modelview(String accno) {
		return adDAO.modelview(accno);
	}

	

	
	
	
	
	
	
	
	

}// AdminServiceImpl
