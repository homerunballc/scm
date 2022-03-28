package kr.happyjob.study.ADMRSC.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ADMRSC.model.RoomInfo;

public interface RMGService {

	// 강의실관리 리스트 조회
	public List<RoomInfo> RMGList(Map<String, Object> paramMap) throws Exception ;
	
	// 강의실관리 리스트 카운트 조회
	public int countListRMG(Map<String, Object> paramMap) throws Exception;

	// 강의실관리 리스트 단건 조회
	public RoomInfo selectRMG(Map<String, Object> paramMap) throws Exception;

	// 강의실 추가
	public int insertRMG(Map<String, Object> paramMap) throws Exception;

	// 강의실 수정
	public int updateRMG(Map<String, Object> paramMap) throws Exception;

	// 강의실 삭제
	public int deleteRMG(Map<String, Object> paramMap) throws Exception;

	
}
