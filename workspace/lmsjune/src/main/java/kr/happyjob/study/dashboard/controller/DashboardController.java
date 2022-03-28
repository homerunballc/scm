package kr.happyjob.study.dashboard.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.dashboard.model.DashboardModel;
import kr.happyjob.study.dashboard.model.LectureModel;
import kr.happyjob.study.dashboard.service.DashboardService;
import kr.happyjob.study.system.model.NoticeModel;
import kr.happyjob.study.system.service.NoticeService;

@Controller
public class DashboardController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	DashboardService dashboardService;
	
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@RequestMapping("/dashboard/dashboard.do")
	public String initDashboard(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		
		logger.info("+ Start " + className + ".initDashboard");
		/* ############## set input data################# */
		paramMap.put("loginId", session.getAttribute("loginId")); // 제목
		paramMap.put("userType", session.getAttribute("userType")); // 오피스 구분 //
																	// 코드
		paramMap.put("reg_date", session.getAttribute("reg_date")); // 등록 일자
		logger.info("   - paramMap : " + paramMap);

		String returnType = "/dashboard/dashboardMgr";

		logger.info("+ end " + className + ".initDashboard");

		return returnType;
	}

	// 공지사항 리스트 출력
	@RequestMapping("/inf/listinf.do")
	public String noticeList(Model model, @RequestParam Map<String, Object> paramMap, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("   - paramMap : " + paramMap);
//		String title = (String) paramMap.get("title");
		
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재페이지
	    int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
	    int pageIndex = (currentPage - 1) * pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
//		paramMap.put("title", title);
		
		// 공지사항 목록 조회
		List<NoticeModel> noticeList = noticeService.noticeList(paramMap);
		model.addAttribute("notice", noticeList);
		
		// 목록 수 추출해서 보내기
		int noticeCnt = noticeService.noticeCnt(paramMap);
		
	    model.addAttribute("noticeCnt", noticeCnt);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("currentPage",currentPage);
	    
	    return "system/noticeList";
	}
	
	// 공지사항 상세 조회
	@RequestMapping("detailNotice.do")
	@ResponseBody
	public Map<String,Object> detailNotice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".detailNotice");
		  logger.info("   - paramMap : " + paramMap);
		  
		String result="";
		
		// 선택된 게시판 1건 조회 
		NoticeModel detailNotice = noticeService.noticeDetail(paramMap);
		
		if(detailNotice != null) {
			result = "SUCCESS";  // 성공시 찍습니다. 
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", result); // success 용어 담기 
		resultMap.put("result", detailNotice); // 리턴 값 해쉬에 담기 
		//resultMap.put("resultComments", comments);
		System.out.println(detailNotice);
		
		logger.info("+ End " + className + ".detailNotice");
	    
	    return resultMap;
	}
	
	
	// 강의 조회
	@RequestMapping("/dashboard/listlec.do")
	@ResponseBody
	public Map<String,Object> listlec(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listlec");
		logger.info("   - paramMap : " + paramMap);
		  
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재페이지
	    int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
	    int pageIndex = (currentPage - 1) * pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("usertype", session.getAttribute("userType"));
		paramMap.put("loginid", session.getAttribute("loginId"));
		
		String result="";
		
		
		List<LectureModel> lectureModel = dashboardService.listlec(paramMap);
		
		int lecCnt = dashboardService.listleccnt(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", result); // success 용어 담기 
		resultMap.put("leclist", lectureModel); // 리턴 값 해쉬에 담기 
		resultMap.put("totalcnt", lecCnt);
		
		
		logger.info("+ End " + className + ".listlec");
	    
	    return resultMap;
	}	
	
	
	// 강의 조회
	@RequestMapping("/dashboard/selectlec.do")
	@ResponseBody
	public Map<String,Object> selectlec(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectlec");
		logger.info("   - paramMap : " + paramMap);
		  
		LectureModel lectureModel = dashboardService.selectlec(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("lecinfo", lectureModel); // 리턴 값 해쉬에 담기 
		
		logger.info("+ End " + className + ".selectlec");
	    
	    return resultMap;
	}
	
	
	// 강의 저장
	@RequestMapping("/dashboard/lectureSave.do")
	@ResponseBody
	public Map<String,Object> lectureSave(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".lectureSave");
		logger.info("   - paramMap : " + paramMap);
		  
		String action = (String) paramMap.get("action");
		String resultMsg = "";
		
		if("I".equals(action)){
			resultMsg = "SUCCESS";
		} else if("U".equals(action)){
			resultMsg = "UPDATE";
		} else if("D".equals(action)){
			resultMsg = "DELETE";
		}	
				
		dashboardService.lectureSave(paramMap,request);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg); // 리턴 값 해쉬에 담기 
		
		logger.info("+ End " + className + ".lectureSave");
	    
	    return resultMap;
	}
	
	
	
	@RequestMapping("/dashboard/downloadfile.do")
	public void downloadfile(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".downloadfile");
		logger.info("   - paramMap : " + paramMap);
		
		LectureModel lectureModel = dashboardService.selectlec(paramMap);
		
		String file = lectureModel.getLec_pp();
		byte fileByte[] = FileUtils.readFileToByteArray(new File(file));
		
		response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(file,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();

		logger.info("+ End " + className + ".downloadfile");
	}
	
	
	
	@RequestMapping("/dashboard/applylec.do")
	@ResponseBody
	public Map<String,Object> applylec(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".applylec");
		logger.info("   - paramMap : " + paramMap);
		  
		String result = "SUCCESS";
		String resultMsg = "정상 신청 되었습니다.";
		
		paramMap.put("loginid", session.getAttribute("loginId"));
						
		dashboardService.applySave(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result); // 리턴 값 해쉬에 담기 
		resultMap.put("resultMsg", resultMsg); // 리턴 값 해쉬에 담기 
		
		logger.info("+ End " + className + ".applylec");
	    
	    return resultMap;
	}	
	
	@RequestMapping("/dashboard/canapplylec.do")
	@ResponseBody
	public Map<String,Object> canapplylec(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".canapplylec");
		logger.info("   - paramMap : " + paramMap);
		  
		String result = "SUCCESS";
		String resultMsg = "정상 취소 되었습니다.";
		
		paramMap.put("loginid", session.getAttribute("loginId"));
						
		dashboardService.canapplySave(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result); // 리턴 값 해쉬에 담기 
		resultMap.put("resultMsg", resultMsg); // 리턴 값 해쉬에 담기 
		
		logger.info("+ End " + className + ".canapplylec");
	    
	    return resultMap;
	}	
	
	//간이 차트
	@RequestMapping("/dashboard/goChart.do")
	@ResponseBody
	public Map<String,Object> goChart(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		  logger.info("+ Start " + className + ".goChart");
		  logger.info("   - paramMap : " + paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();	
		//List<DashboardModel> goChart = dashboardService.goChart(paramMap);
		//model.addAttribute("goChart", goChart);

		// 값 가져오기
		int cntEngineer = dashboardService.cntEngineer(paramMap);
		int cntCompany = dashboardService.cntCompany(paramMap); 
		int cntProject = dashboardService.cntProject(paramMap);
//		int cntApplicant = dashboardService.cntApplicant(paramMap);
		
		resultMap.put("cntEngineer", cntEngineer);
		resultMap.put("cntCompany", cntCompany);
		resultMap.put("cntProject", cntProject);
//		resultMap.put("cntApplicant", cntApplicant);
		
		logger.info("+ End " + className + ".goChart");
	    
	    return resultMap;
	}

}
