package kr.happyjob.study.TCHSUP.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMMNG.model.AdminLectureInfo;
import kr.happyjob.study.TCHSUP.model.LectureInfo;

public interface LectureSupDao {

	public void addLecture(Map<String, Object> paramMap) throws Exception;
	
	public List<LectureInfo> lecList();
	
	public int selectMaxlecno() throws Exception;
	
	public AdminLectureInfo planDetail(int lec_no) throws Exception;
	
}
