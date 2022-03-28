package kr.happyjob.study.ADMRSC.model;

import java.sql.Date;

public class TeacherInfo {
	
	// tb_userInfo : 사용자 정보
	private String loginID;		// 강사 ID
	private String t_no;		// 강사 번호
	private String pw;			// 비밀번호
	private String user_type;	// 사용자타입
	private String t_name;		// 강사 이름
	private String stu_ph;		// 연락처
	private String email;		// 이메일
	private String dep;			// 소속
	private int age;			// 나이
	private String gender;		// 성별
	private String hp;			// 핸드폰번호
	private String zip; 		// 우편번호
	private String addr;		// 주소
	private String addr_dtl;	// 상세주소
	private Date joinDate;		// 가입일
	
	
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getStu_ph() {
		return stu_ph;
	}
	public void setStu_ph(String stu_ph) {
		this.stu_ph = stu_ph;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_dtl() {
		return addr_dtl;
	}
	public void setAddr_dtl(String addr_dtl) {
		this.addr_dtl = addr_dtl;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
	
	  
	
}
