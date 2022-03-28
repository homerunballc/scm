package kr.happyjob.study.ADMMNG.model;

public class ClassInfo{
	
	//수강번호
	private int class_no;
	//강의번호
	private int lec_no;
	//강의이름
	private String lec_name;
	
	private String lec_start; //강의시작일
	
	private String lec_end; //강의종료일
	//학번
	private int stu_no;
	//학생이름
	private String name;
	//부서
	private String dep;
	//응시여부
	private char   class_ox;
	//정답수
	private int    class_cnt;
	//과락여부
	private char   class_pass;
	//수강생아이디
	private String loginID;
	public int getClass_no() {
		return class_no;
	}
	public int getLec_no() {
		return lec_no;
	}
	public String getLec_name() {
		return lec_name;
	}
	public String getLec_start() {
		return lec_start;
	}
	public String getLec_end() {
		return lec_end;
	}
	public int getStu_no() {
		return stu_no;
	}
	public String getName() {
		return name;
	}
	public String getDep() {
		return dep;
	}
	public char getClass_ox() {
		return class_ox;
	}
	public int getClass_cnt() {
		return class_cnt;
	}
	public char getClass_pass() {
		return class_pass;
	}
	public String getLoginID() {
		return loginID;
	}
	private void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	private void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	private void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	private void setLec_start(String lec_start) {
		this.lec_start = lec_start;
	}
	private void setLec_end(String lec_end) {
		this.lec_end = lec_end;
	}
	private void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	private void setName(String name) {
		this.name = name;
	}
	private void setDep(String dep) {
		this.dep = dep;
	}
	private void setClass_ox(char class_ox) {
		this.class_ox = class_ox;
	}
	private void setClass_cnt(int class_cnt) {
		this.class_cnt = class_cnt;
	}
	private void setClass_pass(char class_pass) {
		this.class_pass = class_pass;
	}
	private void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	
	@Override
	public String toString() {
		return "ClassInfo [class_no=" + class_no + ", lec_no=" + lec_no + ", lec_name=" + lec_name + ", lec_start="
				+ lec_start + ", lec_end=" + lec_end + ", stu_no=" + stu_no + ", name=" + name + ", dep=" + dep
				+ ", class_ox=" + class_ox + ", class_cnt=" + class_cnt + ", class_pass=" + class_pass + ", loginID="
				+ loginID + "]";
	}
	
	
}
