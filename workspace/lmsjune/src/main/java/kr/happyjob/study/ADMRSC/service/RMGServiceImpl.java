package kr.happyjob.study.ADMRSC.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.ADMRSC.model.RoomInfo;
import kr.happyjob.study.ADMRSC.dao.RMGDao;

@Service
public class RMGServiceImpl implements RMGService {

	@Autowired
	private RMGDao rmgDao;
	
	// 강의실관리 리스트 조회
	@Override
	public List<RoomInfo> RMGList(Map<String, Object> paramMap) throws Exception {
		List<RoomInfo> RMGList = rmgDao.RMGList(paramMap);
		return RMGList;
	}

	// 강의실관리 리스트 카운트 조회
	@Override
	public int countListRMG(Map<String, Object> paramMap) throws Exception {
		int totalCount = rmgDao.countListRMG(paramMap);
		return totalCount;
	}

	// 강의실관리 리스트 단건 조회
	@Override
	public RoomInfo selectRMG(Map<String, Object> paramMap) throws Exception {
		RoomInfo roomInfo = rmgDao.selectRMG(paramMap);
		return roomInfo;
	}

	// 강의실 추가
	@Override
	public int insertRMG(Map<String, Object> paramMap) throws Exception {
		int ret = rmgDao.insertRMG(paramMap);
		return ret;
	}

	// 강의실 수정
	@Override
	public int updateRMG(Map<String, Object> paramMap) throws Exception {
		int ret = rmgDao.updateRMG(paramMap);
		return ret;
	}

	// 강의실 삭제
	@Override
	public int deleteRMG(Map<String, Object> paramMap) throws Exception {
		int ret = rmgDao.deleteRMG(paramMap);
		return ret;
	}

}
