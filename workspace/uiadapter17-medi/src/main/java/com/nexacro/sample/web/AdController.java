package com.nexacro.sample.web;


import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nexacro.sample.service.AdService;
import com.nexacro.sample.service.AdminService;
import com.nexacro.sample.vo.DetailCDVO;
import com.nexacro.uiadapter17.spring.core.annotation.ParamDataSet;
import com.nexacro.uiadapter17.spring.core.annotation.ParamVariable;
import com.nexacro.uiadapter17.spring.core.data.NexacroResult;

@Controller
public class AdController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	@Resource(name = "adService")
	private AdService adService;

	@Resource
	private Validator validator;
	// 유효성 검사?

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		dataBinder.setValidator(this.validator);
	};
	

	/*********************************************AdList**************************************************************/
	@RequestMapping(value = "/ADList.do")
	public NexacroResult ADList(@ParamDataSet(name = "search_m", required = false) Map<String, Object> searchMap){
		List<Map<String, Object>> list = adService.selectAdList(searchMap);
		NexacroResult result = new NexacroResult();
		result.addDataSet("datasetlist", list);
		return result;
	}
	
	@RequestMapping(value = "/cfcom.do")
	public NexacroResult cfcom(@ParamVariable(name = "confirmcom",required = false) String cfcom, 
			@ParamVariable(name = "confirmcomf",required = false) String cfcomf){
		adService.updatecfcom(cfcom,cfcomf);
		//System.out.println("-------------" + cfcom); System.out.println(";;;;;;;;;;;;;;;" + cfcomf);
		NexacroResult result = new NexacroResult();
		return result;
	}
	
	// 데이터 저장 (정보 입력)
	@RequestMapping(value="/MCinsert.do")
	public NexacroResult MCinsert(@ParamDataSet(name="MC_dataset",required = false) Map<String,Object> MCG,
			@ParamVariable(name="action",required = false) String action	){
		System.out.println("-------------" + action + MCG);
		adService.MCG(MCG,action);
		NexacroResult result = new NexacroResult();
		return result;
	}
	
	// 데이터 정보 가지고 오기
	@RequestMapping(value="/modelview.do")
	public NexacroResult modelview(@ParamVariable(name="accno",required = false)String accno){
		System.out.println("accno -------------" + accno);
		NexacroResult result = new NexacroResult();
		result.addDataSet("MC_dataset", adService.modelview(accno));
		return result;
		
	}
	
	
	



}
