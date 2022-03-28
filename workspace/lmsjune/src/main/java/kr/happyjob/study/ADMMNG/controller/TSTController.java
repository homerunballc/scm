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
import kr.happyjob.study.ADMMNG.dao.TSTLecDao;
import kr.happyjob.study.ADMMNG.model.ClassInfo;
import kr.happyjob.study.ADMMNG.model.TSTLectureInfo;

@Controller
@RequestMapping("/ADMMNG/")
public class TSTController {
	
	
	@Autowired
	TSTLecDao TSTService;
		
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	/**
	 *  강의 목록 조회
	 */
	@RequestMapping("listTSTlec.do")
	public String listTSTlec(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listTSTlec");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 강의 목록 조회
		List<TSTLectureInfo> listTSTLectureInfo = TSTService.listTSTLectureInfo(paramMap);
		model.addAttribute("listClassInfo", listTSTLectureInfo);
		
		// 문제 목록 카운트 조회
		int totalCount = TSTService.countListTSTLectureInfo(paramMap);
		model.addAttribute("totalCntTSTLectureInfo", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageTSTLectureInfo",currentPage);
		
		logger.info("+ End " + className + ".listTSTlec");

		return "/ADMMNG/TSTLecList";
	}
		
}
