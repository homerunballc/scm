package kr.happyjob.study.mgrScm.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.mgrScm.dao.UserInfoDao;
import kr.happyjob.study.mgrScm.model.User;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	
	private SqlSessionTemplate sst;
	
	public UserInfoServiceImpl() {
	
	}
	
	@Autowired
	public UserInfoServiceImpl(SqlSessionTemplate sst) {
	
		this.sst = sst;
	}
	
	
	public User getUserInfo(String userID){
		return sst.getMapper(UserInfoDao.class).getUserByUserID(userID);
	}
	
	

}
