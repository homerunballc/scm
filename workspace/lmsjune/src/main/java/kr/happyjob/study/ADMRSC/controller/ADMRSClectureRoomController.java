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
import kr.happyjob.study.ADMRSC.service.RMGService;

@Controller
@RequestMapping("/ADMRSC/")
public class ADMRSClectureRoomController {
	
	@Autowired
	RMGService rmgService;
	
	// Set logger
	// 로그 : 프로그램 개발이나 운영 시 발생하는 문제점을 추적 하거나 운영 상태를 모니터링 하는 정보를 기록하는 것
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	// 강의실관리 초기화면
	@RequestMapping("/RMG.do")
	public String RMG(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		// logger.info 사용목적 : 관리자(유지 보수자) 관점에서 정보 활용으로 유용
		logger.info("+ Start " + className + ".RMG");
		
		logger.info("+ end " + className + ".RMG");
          
		return "/ADMRSC/RMG";
	}
	
	// 강의실관리 리스트 조회
	@RequestMapping("/roomInfo.do")
	public String roomInfo(Model model, @RequestParam Map<String, Object> paramMap, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".roomInfo");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); 	// 현재페이지
	    int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));			// 페이지 사이즈
	    int pageIndex = (currentPage - 1) * pageSize;								// 페이지 시작 row번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 강의실 목록 조회
		List<RoomInfo> RMGList = rmgService.RMGList(paramMap);
		model.addAttribute("roomList", RMGList);
		
		// 강의실관리 목록 카운트 조회
		int totalCount = rmgService.countListRMG(paramMap);
		model.addAttribute("totalCntRMG", totalCount);
				
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageRMG",currentPage);
				
		logger.info("+ End " + className + ".roomInfo");
	    
	    return "/ADMRSC/RMGList";
	}	

	// 강의실목록 단건 조회
	@RequestMapping("selectRMG.do")
	@ResponseBody
	public Map<String, Object> selectRMG (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectRMG");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 강의실목록 단건 조회
		RoomInfo roomInfo = rmgService.selectRMG(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("roomInfo", roomInfo);
		
		logger.info("+ End " + className + ".selectRMG");
		
		return resultMap;
	}
	
	// 강의실 저장(추가,수정)
	@RequestMapping("saveRMG.do")
	//Map 형태 redirect안할때 씀 즉 값만 바꾸겠다.라는 이야기
	@ResponseBody
	public Map<String, Object> saveRMG(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveRMG");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		
		// 사용자 정보 설정
		// paramMap.put("fst_rgst_sst_id", session.getAttribute("loginId"));
		// paramMap.put("fnl_mdfr_sst_id", session.getAttribute("loginId"));
		if ("I".equals(action)) {
			// 강의실 신규 등록
			rmgService.insertRMG(paramMap);
		} else if("U".equals(action)) {
			// 강의실 수정 저장
			rmgService.updateRMG(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveRMG");
		
		return resultMap;
	}
	
		
	// 강의실 삭제
	@RequestMapping("deleteRMG.do")
	@ResponseBody
	public Map<String, Object> deleteRMG(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteRMG");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		// 그룹코드 삭제
		rmgService.deleteRMG(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteRMG");
		
		return resultMap;
	}
	
	

	
}
