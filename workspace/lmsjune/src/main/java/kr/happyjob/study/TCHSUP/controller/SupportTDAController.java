package kr.happyjob.study.TCHSUP.controller;

import java.io.File;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.ADMMNG.dao.ComnADMMNGDao;
import kr.happyjob.study.ADMMNG.model.AdminLectureInfo;
import kr.happyjob.study.TCHSUP.model.LectureInfo;
import kr.happyjob.study.TCHSUP.service.LectureService;

@RequestMapping("/TCH/")
@Controller
public class SupportTDAController {
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	LectureService lectureService;
	
	@Autowired
	ComnADMMNGDao ComnADMMNGService;
	
	//강의목록 & 강의계획서 상세보기(LPN) lecturePlan.do
	@RequestMapping("/LPN.do")
	public String lecturePlan(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		return "TCHMNG/LPN";
		//return "supportD/lecturePlan";
	}
	//강의계획서상세보기
	@RequestMapping("/planDetail.do")
	public String planDetail(Model model, @RequestParam ("lec_no") int lec_no, 
																  HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		AdminLectureInfo lectureInfo  = lectureService.planDetail(lec_no);
		
		model.addAttribute("lec_info", lectureInfo);
		
		return "TCHMNG/planDetail";
	}
	
	@RequestMapping("/downloadfile.do")
	public void downloadfile(Model model, @RequestParam("lec_no") int lec_no, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
				
			AdminLectureInfo lectureInfo = lectureService.planDetail(lec_no);
			
			System.out.println("---------" + lectureInfo.getLec_start() + "~" + lectureInfo.getLec_end() + "-----");
			System.out.println("======"+lectureInfo.getLec_name()+"======");
			
			
			String file = lectureInfo.getLec_pp();
			byte fileByte[] = FileUtils.readFileToByteArray(new File(file));
			
			response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(file,"UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    response.getOutputStream().write(fileByte);
		     
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		    
		    logger.info("+ End" + className + ".downloadfile");
			
			}
	
	
	//공지사항 TOC
	@RequestMapping("/notice.do")
	public String initNotice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		model.addAttribute("writer", session.getAttribute("loginId"));

		System.out.println("writer : " + session.getAttribute("loginId"));

		return "TCHMNG/TOC";
	}
	
	// 강의등록
	@RequestMapping("/addLecturePro.do")
	@ResponseBody
	public Map<String, Object>  addLecPro(Model model, @RequestParam Map<String, Object> paramMap,
											HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	
		logger.info("+ Start " + className + ".addLecPro");
		logger.info("   - paramMap : " + paramMap);
	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		lectureService.addLecture(paramMap, request);
		
		logger.info("+ End " + className + ".addLecPro");
		
		return resultMap;
	}
	
	//강의목록조회 훔쳐옴..
	@RequestMapping("/listLec.do")
	public String listComnGrpCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listLec");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 강의 목록 조회
		List<AdminLectureInfo> listAdminLectureInfo = ComnADMMNGService.listAdminLectureInfo(paramMap);
		model.addAttribute("listAdminLectureInfo", listAdminLectureInfo);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = ComnADMMNGService.countListAdminLectureInfo(paramMap);
		model.addAttribute("totalCntLectureInfo", totalCount);
		logger.info("+ totalCntLectureInfo " + totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageLectureInfo",currentPage);
		
		logger.info("+ End " + className + ".listAdminLectureInfo");
		

		return "/TCHMNG/lecList";
	}
	
	//학습자료관리 TDA  원래 /documentMgt.do
	@RequestMapping("/TDA.do")
	public String lectureList(Model model, @RequestParam Map<String, Object> paramMap,
										 HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		return "TCHMNG/TDA";
	}
	
	//수강인원, 강의목록, 강의등록  LIS
	@RequestMapping("/lectureMgt.do")
	public String lectureMgt() {
		
		return "TCHMNG/LIS";
	}
	
	//
	@RequestMapping("/surveyResult.do")
	public String surveyResult() {
		
		return "TCHMNG/lecturePlan";
	}
	
	@RequestMapping("/homeworkMgt.do")
	public String homeworkMgt() {
		
		return "TCHMNG/lecturePlan";
	}
	
	//시험결과조회 TER
	@RequestMapping("/examResult.do")
	public String examResult() {
		
		return "TCHMNG/TER";
	}
	
	//평가관리 
	@RequestMapping("/evaluationMgt.do")
	public String evaluMgt() {
		
		return "TCHMNG/lecturePlan";
	}
	
	//QNA
	@RequestMapping("/qna.do")
	public String qna() {
		
		return "TCHMNG/QNA";
	}
}
