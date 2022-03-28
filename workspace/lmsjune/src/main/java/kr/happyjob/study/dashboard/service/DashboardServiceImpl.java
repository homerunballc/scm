package kr.happyjob.study.dashboard.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.common.comnUtils.ComnUtil;
import kr.happyjob.study.common.comnUtils.FileUtilCho;
import kr.happyjob.study.dashboard.dao.DashboardDao;
import kr.happyjob.study.dashboard.model.DashboardModel;
import kr.happyjob.study.dashboard.model.LectureModel;
import kr.happyjob.study.login.dao.LoginDao;

@Service
public class DashboardServiceImpl implements DashboardService {
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());
   
   // Get class name for logger
   private final String className = this.getClass().toString();
   
   @Autowired
   DashboardDao dashboardDao;
	   
   @Value("${fileUpload.rootPath}")
   private String rootPath;
   
   @Value("${fileUpload.lectiredirPath}")
   private String lectiredirPath;
   
   
   @Override
   public DashboardModel goChart(Map<String, Object> paramMap) throws Exception {
      
	   DashboardModel goChart = dashboardDao.goChart(paramMap);
      
      return goChart;
   }
   
	@Override
	public int cntEngineer(Map<String, Object> paramMap) throws Exception {
		int cntEngineer = dashboardDao.cntEngineer(paramMap);
		return cntEngineer;
	}
	
	@Override
	public int cntCompany(Map<String, Object> paramMap) throws Exception {
		int cntCompany = dashboardDao.cntCompany(paramMap);
		return cntCompany;
	}
	
	@Override
	public int cntProject(Map<String, Object> paramMap) throws Exception {
		int cntProject = dashboardDao.cntProject(paramMap);
		return cntProject;
	}

	@Override
	public List<LectureModel> listlec(Map<String, Object> paramMap) throws Exception {
		System.out.println("Service listlec ");
		
		List<LectureModel> listlecture = dashboardDao.listlec(paramMap);
		return listlecture;
	}
	
	@Override
	public int listleccnt(Map<String, Object> paramMap) throws Exception {
		int cntlecture = dashboardDao.listleccnt(paramMap);
		return cntlecture;
	}
	
	@Override
	public LectureModel selectlec(Map<String, Object> paramMap) throws Exception {
		LectureModel selectlec = dashboardDao.selectlec(paramMap);
		return selectlec;
	}
	
	@Override
	public void lectureSave(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		String action = (String) paramMap.get("action");
		int maxlecno = 0;
		if("I".equals(action)) {
			maxlecno = dashboardDao.selectMaxlecno();
			paramMap.put("lecno",maxlecno);
		}
		
		// 파일 저장
		String itemFilePath = lectiredirPath + File.separator + paramMap.get("lecno") + File.separator ; // 업로드 실제 경로 조립 (무나열생성)
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, rootPath, itemFilePath);
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리

		fileInfo.put("file_lloc", "/lecfile/"+fileInfo.get("file_nm"));
		
		
		
		Map<String, Object> deletfileMap = new HashMap<String, Object>();
		
		if("U".equals(action)|| "D".equals(action)){
			LectureModel lectureModel = dashboardDao.selectlec(paramMap); 
			
			
			if(!"".equals(ComnUtil.NVL(lectureModel.getLec_pp()))) {	
				File file = new File(lectureModel.getLec_pp());
				if (file.exists()) file.delete();				
			}
		}
		
		paramMap.put("file", fileInfo);
		
		if("I".equals(action)){
			dashboardDao.insertlec(paramMap);
		} else if("U".equals(action)){
			dashboardDao.updatelec(paramMap);
		} else if("D".equals(action)){
			dashboardDao.deletelec(paramMap);
		}
		
    }
		
	@Override
	public void applySave(Map<String, Object> paramMap) throws Exception {
		dashboardDao.applySave(paramMap);		
    }
	
	@Override
	public void canapplySave(Map<String, Object> paramMap) throws Exception {
		dashboardDao.canapplySave(paramMap);		
    }	
}