package kr.happyjob.study.TCHSUP.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.ADMMNG.model.AdminLectureInfo;
import kr.happyjob.study.TCHSUP.dao.LectureSupDao;
import kr.happyjob.study.TCHSUP.model.LectureInfo;
import kr.happyjob.study.common.comnUtils.FileUtilCho;

@Service("lectureService")
public class LectureServiceImpl implements LectureService {
	
	@Autowired
	private LectureSupDao lectureDao;
	
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	   
	 @Value("${fileUpload.lectiredirPath}")
	private String lectiredirPath;
	
	@Override
	public List<LectureInfo> lecList() {
		return lectureDao.lecList();
	}

	@Override
	public void addLecture(Map<String, Object> paramMap, HttpServletRequest request) throws Exception{
		
		String action = (String) paramMap.get("action");
		int maxlecno = 0;
		maxlecno = lectureDao.selectMaxlecno();
		paramMap.put("lecno", maxlecno);
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		//MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		//파일저장
		String itemFilePath = lectiredirPath + File.separator + paramMap.get("lecno") + File.separator ; // 업로드 실제 경로 조립 (무나열생성)
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, rootPath, itemFilePath);
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 업로드 처리

		fileInfo.put("file_lloc", "/lecfile/"+fileInfo.get("file_nm"));
		paramMap.put("file", fileInfo);
		
		lectureDao.addLecture(paramMap);
		
	}

	@Override
	public AdminLectureInfo planDetail(int lec_no) throws Exception{
		
		return lectureDao.planDetail(lec_no);
	}

	/*@Override
	public AdminLectureInfo planDetail(Map<String, Object> paramMap) throws Exception {
		AdminLectureInfo planDetail = lectureDao.planDetail(paramMap);
		return planDetail;
	}*/

}
