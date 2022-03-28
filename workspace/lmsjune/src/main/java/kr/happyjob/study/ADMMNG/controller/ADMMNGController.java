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

import kr.happyjob.study.ADMMNG.dao.ComnADMMNGDao;
import kr.happyjob.study.ADMMNG.model.AdminLectureInfo;



@Controller
@RequestMapping("/ADMMNG/")
public class ADMMNGController {
	
	@Autowired
	ComnADMMNGDao ComnADMMNGService;
		
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/**
	 * 시험대상자 관리화면
	 */
	@RequestMapping("TST.do")
	public String initTSTCtrl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".TST.do");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".TST.do");

		return "ADMMNG/TST";
	}
	/**
	 * 문제관리화면
	 */
	@RequestMapping("TPR.do")
	public String initTPRCtrl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".TPR.do");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".TPR.do");

		return "ADMMNG/TPR";
	}
	/**
	 * 수강 관리 화면
	 */
	@RequestMapping("SCH.do")
	public String initSCHCtrl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".SCH.do");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".SCH.do");

		return "ADMMNG/SCH";
	}
	/**
	 * 강의목록
	 */
	@RequestMapping("listLec.do")
	public String listComnGrpCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listLec");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		int from =	Integer.parseInt((String)paramMap.get("from"));
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 강의 목록 조회
		List<AdminLectureInfo> listAdminLectureInfo = ComnADMMNGService.listAdminLectureInfo(paramMap);
		model.addAttribute("listAdminLectureInfo", listAdminLectureInfo);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = ComnADMMNGService.countListAdminLectureInfo(paramMap);
		model.addAttribute("totalCntLectureInfo", totalCount);
		logger.info("+ totalCntLectureInfo " + totalCount);
		model.addAttribute("from", from);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageLectureInfo",currentPage);
		
		logger.info("+ End " + className + ".listAdminLectureInfo");
		

		return "/ADMMNG/lecList";
	}
	
	/**
	 *  강의 단건 조회
	 */
	@RequestMapping("selectLec.do")
	@ResponseBody
	public Map<String, Object> selectLec (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectLec");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 공통 상세 코드 단건 조회
		AdminLectureInfo adminLectureInfo = ComnADMMNGService.selectAdminLectureInfo(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("LecModel", adminLectureInfo);
		
		logger.info("+ End " + className + ".selectLec");
		
		return resultMap;
	}
	
	
	/**
	 *  강의 저장
	 */
	@RequestMapping("saveLec.do")
	@ResponseBody
	public Map<String, Object> saveLec(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveLec");
		logger.info("   - paramMap : " + paramMap);

		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 사용자 정보 설정
		paramMap.put("fst_rgst_sst_id", session.getAttribute("loginId"));
		paramMap.put("fnl_mdfr_sst_id", session.getAttribute("loginId"));
		
		if ("I".equals(action)) {
			// 강의 신규 저장
			ComnADMMNGService.insertAdminLectureInfo(paramMap);
		} else if("U".equals(action)) {
			// 강의 수정 저장
			ComnADMMNGService.updateAdminLectureInfo(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveLec");
		
		return resultMap;
	}
	
		
	/**
	 *  강의 삭제
	 */
	@RequestMapping("deleteLec.do")
	@ResponseBody
	public Map<String, Object> deleteLec(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteLec");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		// 상세코드 삭제
		ComnADMMNGService.deleteAdminLectureInfo(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteLec");
		
		return resultMap;
	}

}
