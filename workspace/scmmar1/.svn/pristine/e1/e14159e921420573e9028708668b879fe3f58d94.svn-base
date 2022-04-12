package kr.happyjob.study.scm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.scm.model.whInventoryFormModel;
import kr.happyjob.study.scm.model.whcntModel;
import kr.happyjob.study.scm.service.whInventoryFormService;

@Controller
@RequestMapping("/scm/")
public class whInventoryFormController {
	
	@Autowired
	whInventoryFormService whinventoryformservice;
	
	// 화면 이동
	@RequestMapping("whInventoryForm.do")
	public String initApproval(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
		return "scm/whInventoryForm";
	}
	
	
	@RequestMapping("whInventoryFormlist.do")
	public String whlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		List<whInventoryFormModel> whlist = whinventoryformservice.whlist(paramMap);
	      
		
		System.out.println("searchgrouptype : " + paramMap.get("searchgrouptype"));
		System.out.println("searchtext : " + paramMap.get("searchtext"));
		
		model.addAttribute("whlist",whlist);
		
		return "scm/whInventoryFormlist";
	}
	
	@RequestMapping("lay1.do")
	@ResponseBody
	public Map<String,Object> lay1(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		     HttpServletResponse response, HttpSession session) throws Exception{
		Map<String,Object> returnmap = new HashMap<String,Object>();
		String msg = "";
		try {
			whcntModel cnt = whinventoryformservice.cnt(paramMap);
			returnmap.put("cnt", cnt);
			returnmap.put("msg", msg);
			
			System.out.println("------------"+cnt.getSales_id());
		} catch (Exception e) {
			msg = "데이터가 없습니다.";
			returnmap.put("msg", msg);
			System.out.println("e : " + e);
		}
		
	    return returnmap;
	}
	
	
	
	
	
	
	
	
	
	
}
