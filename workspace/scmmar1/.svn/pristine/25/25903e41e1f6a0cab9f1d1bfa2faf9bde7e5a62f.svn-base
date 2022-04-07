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

import kr.happyjob.study.scm.model.dailyOrderHistoryModel;
import kr.happyjob.study.scm.model.oneshipModel;
import kr.happyjob.study.scm.model.shippingDirectionModel;
import kr.happyjob.study.scm.model.warehouseModel;
import kr.happyjob.study.scm.service.shippingDirectionService;


@Controller
@RequestMapping("/scm/")
public class shippingDirectionController {
	
	@Autowired
	shippingDirectionService shippingdirectionservice;
	
	@RequestMapping("shippingDirection.do")
	public String InitStart() throws Exception{
		return"scm/shippingDirection";
	}

	@RequestMapping("listshippingDirection.do")
	public String listship(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
	      int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
	      int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
	      int pageIndex = (currentPage-1)*pageSize;
	      
	      paramMap.put("pageIndex", pageIndex);	
	      paramMap.put("pageSize", pageSize);
	      int total = shippingdirectionservice.total(paramMap);
	      
	      List<shippingDirectionModel> listship = shippingdirectionservice.listship(paramMap);
	      
	      model.addAttribute("total",total);
	      model.addAttribute("listship",listship);
	      
		return "scm/shippingDirectionlist";
	}  
	
	@RequestMapping("oneshippingDirection.do")
	@ResponseBody
	public Map<String,Object> gouppcodelistvue(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	   HttpServletResponse response, HttpSession session) throws Exception{
		 
		oneshipModel onesip = shippingdirectionservice.onesip(paramMap);
		 
		 Map<String,Object> returnmap = new HashMap<String,Object>();
		 
		 returnmap.put("onesip", onesip); 
		 
		 
	      return returnmap;
		 
	 }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
