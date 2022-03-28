package kr.happyjob.study.adm.controller;

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

import kr.happyjob.study.adm.service.decListService;
import kr.happyjob.study.system.model.decListModel;


@Controller
@RequestMapping("/adm/")
public class decListController {
	
	@Autowired
	decListService declistservice;
	
	//화면 이동용
	@RequestMapping("decList.do")
	public String ttt(){
		return "adm/decList";
	};
	
	// pageing 및 시작시 list 가져오기
	@RequestMapping("acb.do")
	@ResponseBody
	public Map<String,Object> decList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session){
		
        int pageSize   =   Integer.parseInt( String.valueOf( paramMap.get("pageSize") ) );
        int pagenum    =  Integer.parseInt( String.valueOf( paramMap.get("pagenum") ) );
		int pageIndex = (pagenum - 1) * pageSize;
		 
		paramMap.put("pageSize", pageSize);
		paramMap.put("pagenum", pagenum);
		paramMap.put("pageIndex", pageIndex);
		
		List<decListModel> groupcodelist = declistservice.decList(paramMap);
		
		int totaldecListcount = declistservice.decListcount(paramMap);
		System.out.println("==============="+pagenum);
		Map<String,Object> returnmap = new HashMap<String,Object>();
	      returnmap.put("decList", groupcodelist); 
	      returnmap.put("totaldecListcount", totaldecListcount);
	      System.out.println("---------555------------"+totaldecListcount);
	      System.out.println("serach2 : "+ paramMap.get("searchgrouptype2"));
	      System.out.println("serach1 : "+ paramMap.get("searchgrouptype1"));
	      System.out.println("search : "+paramMap.get("search"));
	      System.out.println("vue npm : "+ paramMap.get("accno"));
	      
		return returnmap;
	}
	
	// 허가증 단일 select
	@RequestMapping("modellist.do")
	@ResponseBody
	public Map<String,Object> modellist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session){
		System.out.println("-------------no : "+paramMap.get("no"));
		System.out.println("-------------divcd : "+paramMap.get("divcd"));
		
		decListModel modellist = declistservice.modellist(paramMap);
		 Map<String,Object> returnmap = new HashMap<String,Object>();
	      returnmap.put("modellist", modellist); 

	      return returnmap;
	}
	
	// 등록,삭제,수정 기능
	@RequestMapping("cinsert.do")
	@ResponseBody
	public String cinsert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session){
		
		if("R".equals(paramMap.get("action")) ){
			 declistservice.mupdate(paramMap);
		 }else if("D".equals(paramMap.get("action")) ){
			declistservice.mdelect(paramMap);
		 }else{
			 declistservice.minsert(paramMap);
		 }
		
		
		System.out.println("--------------meditype : " + paramMap.get("meditype"));
		System.out.println("--------------modelnm : " + paramMap.get("modelnm"));
		System.out.println("-------------accno : "+paramMap.get("accno"));
		System.out.println("-------------action : "+paramMap.get("action"));
	      return "";
	}
	
	// 신고서 단일 select 
	@RequestMapping("oneselect.do")
	@ResponseBody
	public Map<String,Object> oneselect(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session){
		
		decListModel oneselect = declistservice.oneselect(paramMap);
		Map<String,Object> returnmap = new HashMap<String,Object>();
	      returnmap.put("oneselect", oneselect); 
	      System.out.println("==============" + paramMap.get("accno"));

	      return returnmap;
	}
	
	// 승인여부 수정(승인/반려/승인대기)
	@RequestMapping("comupdate.do")
	@ResponseBody
	public String cupdate(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session){
		 
		declistservice.cupdate(paramMap);
		System.out.println("-------------accno : "+paramMap.get("accno"));
		System.out.println("-------------accyn : "+paramMap.get("accyn"));
	      return "";
	}
}
