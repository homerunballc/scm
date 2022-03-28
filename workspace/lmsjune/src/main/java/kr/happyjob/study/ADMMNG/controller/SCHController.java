package kr.happyjob.study.ADMMNG.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.ADMMNG.dao.SCHDao;
import kr.happyjob.study.ADMMNG.model.ClassInfo;

@Controller
@RequestMapping("/ADMMNG/")
public class SCHController {
	
	
	@Autowired
	SCHDao SCHService;
		
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	/**
	 *  문제 목록 조회
	 */
	@RequestMapping("listClass.do")
	public String listClass(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listClass");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 문제 목록 조회
		List<ClassInfo> listClassInfo = SCHService.listClassInfo(paramMap);
		model.addAttribute("listClassInfo", listClassInfo);
		
		// 문제 목록 카운트 조회
		int totalCount = SCHService.countListClassInfo(paramMap);
		model.addAttribute("totalCntClassInfo", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageClassInfo",currentPage);
		
		logger.info("+ End " + className + ".listClass");

		return "/ADMMNG/SCHList";
	}
	
	/**
	 *  문제 단건 조회
	 */
	@RequestMapping("selectClass.do")
	@ResponseBody
	public Map<String, Object> selectClass (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectClass");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 문제 단건 조회
		ClassInfo classInfo = SCHService.selectClassInfo(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("ClassModel", classInfo);
		
		logger.info("+ End " + className + ".selectClass");
		
		return resultMap;
	}
	
	
	/**
	 *  문제 저장
	 */
	@RequestMapping("saveClass.do")
	@ResponseBody
	public Map<String, Object> saveClass(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveClass");
		logger.info("   - paramMap : " + paramMap);

		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		if ("I".equals(action)) {
			// 문제 신규 저장
			SCHService.insertClassInfo(paramMap);
		} else if("U".equals(action)) {
			// 문제 수정 저장
			SCHService.updateClassInfo(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveClass");
		
		return resultMap;
	}
	
		
	/**
	 *  문제 삭제
	 */
	@RequestMapping("deleteClass.do")
	@ResponseBody
	public Map<String, Object> deleteClass(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteClass");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		// 문제 삭제
		SCHService.deleteClassInfo(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteClass");
		
		return resultMap;
	}

}
