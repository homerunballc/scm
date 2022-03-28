package kr.happyjob.study.ADMMNG.model;

//관리자강의정보
public class TSTLectureInfo {
	
	private int lec_no; //강의번호
	private String lec_name; //강의명
	private int test_no; //시험번호
	private int lec_state; //강의상태
	private int cnt_cla_no; //시험대상자 수
	private int cnt_cla_y; // 응시자 수
	private int cnt_cla_n; // 미응시자 수
	
	public int getLec_no() {
		return lec_no;
	}
	public String getLec_name() {
		return lec_name;
	}
	public int getTest_no() {
		return test_no;
	}
	public int getLec_state() {
		return lec_state;
	}
	public int getCnt_cla_no() {
		return cnt_cla_no;
	}
	public int getCnt_cla_y() {
		return cnt_cla_y;
	}
	public int getCnt_cla_n() {
		return cnt_cla_n;
	}
	
	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}
	public void setLec_state(int lec_state) {
		this.lec_state = lec_state;
	}
	public void setCnt_cla_no(int cnt_cla_no) {
		this.cnt_cla_no = cnt_cla_no;
	}
	public void setCnt_cla_y(int cnt_cla_y) {
		this.cnt_cla_y = cnt_cla_y;
	}
	public void setCnt_cla_n(int cnt_cla_n) {
		this.cnt_cla_n = cnt_cla_n;
	}
	
	@Override
	public String toString() {
		return "TSTLectureInfo [lec_no=" + lec_no + ", lec_name=" + lec_name + ", test_no=" + test_no + ", lec_state="
				+ lec_state + ", cnt_cla_no=" + cnt_cla_no + ", cnt_cla_y=" + cnt_cla_y + ", cnt_cla_n=" + cnt_cla_n
				+ "]";
	}
	
}
