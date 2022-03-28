package kr.happyjob.study.ADMRSC.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.happyjob.study.ADMRSC.model.RoomInfo;
import kr.happyjob.study.ADMRSC.model.TeacherInfo;
import kr.happyjob.study.ADMRSC.service.TMGService;

@Controller
@RequestMapping("/ADMRSC/")
public class ADMRSCteacherController {
	
	@Autowired
	TMGService tmgService;
	
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@RequestMapping("/TMG.do")
	public String TMG(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		
		logger.info("+ Start " + className + ".TMG");

		logger.info("+ end " + className + ".TMG");

		return "/ADMRSC/TMG";
	}
	
	// 강사관리 리스트 조회
		@RequestMapping("/teacherInfo.do")
		public String teacherInfo(Model model, @RequestParam Map<String, Object> paramMap, 
				HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".teacherInfo");
			logger.info("   - paramMap : " + paramMap);
			
			int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); 	// 현재페이지
		    int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));			// 페이지 사이즈
		    int pageIndex = (currentPage - 1) * pageSize;								// 페이지 시작 row번호
			
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			// 강의실 목록 조회
			List<TeacherInfo> TMGList = tmgService.TMGList(paramMap);
			model.addAttribute("teacherList", TMGList);
			
			// 강의실관리 목록 카운트 조회
			int totalCount = tmgService.countListTMG(paramMap);
			model.addAttribute("totalCntTMG", totalCount);
					
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPageTMG",currentPage);
					
			logger.info("+ End " + className + ".teacherInfo");
		    
		    return "/ADMRSC/TMGList";
		}	
	
	// 강사목록 단건 조회
	@RequestMapping("selectTMG.do")
	@ResponseBody
	public Map<String, Object> selectTMG (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectTMG");
		logger.info("   - paramMap : " + paramMap);
			String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 강의실목록 단건 조회
		TeacherInfo teacherInfo = tmgService.selectTMG(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("teacherInfo", teacherInfo);
		
		logger.info("+ End " + className + ".selectTMG");
			
		return resultMap;
	}		

	// 강사 저장(추가, 수정)
	@RequestMapping("saveTMG.do")
	//Map 형태 redirect안할때 씀 즉 값만 바꾸겠다.라는 이야기
	@ResponseBody
	public Map<String, Object> saveTMG(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveTMG");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		
		// 사용자 정보 설정
		// paramMap.put("fst_rgst_sst_id", session.getAttribute("loginId"));
		// paramMap.put("fnl_mdfr_sst_id", session.getAttribute("loginId"));
		if ("I".equals(action)) {
			// 강사 신규 등록
			tmgService.insertTMG(paramMap);
		} else if("U".equals(action)) {
			// 강사 수정 저장
			tmgService.updateTMG(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveTMG");
		
		return resultMap;
	}
	
	// 강사 삭제
		@RequestMapping("deleteTMG.do")
		@ResponseBody
		public Map<String, Object> deleteTMG(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".deleteTMG");
			logger.info("   - paramMap : " + paramMap);

			String result = "SUCCESS";
			String resultMsg = "삭제 되었습니다.";
			
			// 강사 삭제
			tmgService.deleteTMG(paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			
			logger.info("+ End " + className + ".deleteTMG");
			
			return resultMap;
		}
}
