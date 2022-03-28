package kr.happyjob.study.ADMMNG.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMMNG.model.AdminLectureInfo;

public interface ComnADMMNGDao {
	
	/** 강의 목록 조회 */
	public List<AdminLectureInfo> listAdminLectureInfo(Map<String, Object> paramMap);
	
	/** 강의 목록 카운트 조회 */
	public int countListAdminLectureInfo(Map<String, Object> paramMap);
	
	/** 강의 조회 */
	public AdminLectureInfo selectAdminLectureInfo(Map<String, Object> paramMap);
	
	/** 강의 저장 */
	public int insertAdminLectureInfo(Map<String, Object> paramMap);
	
	/** 강의 수정 */
	public int updateAdminLectureInfo(Map<String, Object> paramMap);
	
	/** 강의 삭제 */
	public int deleteAdminLectureInfo(Map<String, Object> paramMap);

}
