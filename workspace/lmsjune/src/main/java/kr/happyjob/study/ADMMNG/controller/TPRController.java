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

import kr.happyjob.study.ADMMNG.dao.TPRDao;
import kr.happyjob.study.ADMMNG.model.ProbInfo;

@Controller
@RequestMapping("/ADMMNG/")
public class TPRController {
	
	
	@Autowired
	TPRDao TPRService;
		
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	/**
	 *  문제 목록 조회
	 */
	@RequestMapping("listProb.do")
	public String listProb(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listProb");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 문제 목록 조회
		List<ProbInfo> listProbInfo = TPRService.listProbInfo(paramMap);
		model.addAttribute("listProbInfo", listProbInfo);
		
		// 문제 목록 카운트 조회
		int totalCount = TPRService.countListProbInfo(paramMap);
		model.addAttribute("totalCntProbInfo", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageProbInfo",currentPage);
		
		logger.info("+ End " + className + ".listProb");

		return "/ADMMNG/TPRList";
	}
	
	/**
	 *  문제 단건 조회
	 */
	@RequestMapping("selectProb.do")
	@ResponseBody
	public Map<String, Object> selectProb (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectProb");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 문제 단건 조회
		ProbInfo probInfo = TPRService.selectProb(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("ProbModel", probInfo);
		
		logger.info("+ End " + className + ".selectProb");
		
		return resultMap;
	}
	
	
	/**
	 *  문제 저장
	 */
	@RequestMapping("saveProb.do")
	@ResponseBody
	public Map<String, Object> saveProb(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveProb");
		logger.info("   - paramMap : " + paramMap);

		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		if ("I".equals(action)) {
			// 문제 신규 저장
			TPRService.insertProb(paramMap);
		} else if("U".equals(action)) {
			// 문제 수정 저장
			TPRService.updateProb(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveProb");
		
		return resultMap;
	}
	
		
	/**
	 *  문제 삭제
	 */
	@RequestMapping("deleteProb.do")
	@ResponseBody
	public Map<String, Object> deleteProb(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteProb");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		// 문제 삭제
		TPRService.deleteProb(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteProb");
		
		return resultMap;
	}

}
