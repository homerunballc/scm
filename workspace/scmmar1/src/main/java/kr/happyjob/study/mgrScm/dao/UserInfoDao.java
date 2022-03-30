package kr.happyjob.study.mgrScm.dao;

import kr.happyjob.study.mgrScm.model.User;

public interface UserInfoDao {
	
	User getUserByUserID(String userID);

}
