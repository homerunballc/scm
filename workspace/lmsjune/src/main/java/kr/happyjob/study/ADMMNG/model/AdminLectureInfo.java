package kr.happyjob.study.ADMMNG.model;

//관리자강의정보
public class AdminLectureInfo {
	
	private int lec_no; //강의번호
	private String lec_name; //강의명
	private int room_no; //강의실번호
	private String room_name; //강의실이름
	private int teach_no; // 교수번호
	private String name; // 교수이름
	private int lec_cnt; //수강인원
	private String lec_start; //강의시작일
	private String lec_end; //강의종료일
	private String lec_goal; //강의목표
	private String lec_plan; //강의계획
	private String lec_file; //강의계획서 파일
	private String lec_lp; //파일논리경로
	private String lec_pp; //파일물리경로
	private String lec_filesize; //파일사이즈
	private int test_no;
	
	public int getLec_no() {
		return lec_no;
	}
	public String getLec_name() {
		return lec_name;
	}
	public int getRoom_no() {
		return room_no;
	}
	public int getTeach_no() {
		return teach_no;
	}
	public String getName() {
		return name;
	}
	public int getLec_cnt() {
		return lec_cnt;
	}
	public String getLec_start() {
		return lec_start;
	}
	public String getLec_end() {
		return lec_end;
	}
	public String getLec_goal() {
		return lec_goal;
	}
	public String getLec_plan() {
		return lec_plan;
	}
	public String getLec_file() {
		return lec_file;
	}
	public String getLec_lp() {
		return lec_lp;
	}
	public String getLec_pp() {
		return lec_pp;
	}
	public String getLec_filesize() {
		return lec_filesize;
	}
	public int getTest_no() {
		return test_no;
	}
	private void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	private void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	private void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	private void setTeach_no(int teach_no) {
		this.teach_no = teach_no;
	}
	private void setName(String name) {
		this.name = name;
	}
	private void setLec_cnt(int lec_cnt) {
		this.lec_cnt = lec_cnt;
	}
	private void setLec_start(String lec_start) {
		this.lec_start = lec_start;
	}
	private void setLec_end(String lec_end) {
		this.lec_end = lec_end;
	}
	private void setLec_goal(String lec_goal) {
		this.lec_goal = lec_goal;
	}
	private void setLec_plan(String lec_plan) {
		this.lec_plan = lec_plan;
	}
	private void setLec_file(String lec_file) {
		this.lec_file = lec_file;
	}
	private void setLec_lp(String lec_lp) {
		this.lec_lp = lec_lp;
	}
	private void setLec_pp(String lec_pp) {
		this.lec_pp = lec_pp;
	}
	private void setLec_filesize(String lec_filesize) {
		this.lec_filesize = lec_filesize;
	}
	private void setTest_no(int test_no) {
		this.test_no = test_no;
	}
	
	@Override
	public String toString() {
		return "LectureInfo [lec_no=" + lec_no + ", lec_name=" + lec_name + ", room_no=" + room_no + ", teach_no="
				+ teach_no + ", name=" + name + ", lec_cnt=" + lec_cnt + ", lec_start=" + lec_start + ", lec_end="
				+ lec_end + ", lec_goal=" + lec_goal + ", lec_plan=" + lec_plan + ", lec_file=" + lec_file + ", lec_lp="
				+ lec_lp + ", lec_pp=" + lec_pp + ", lec_filesize=" + lec_filesize + ", test_no=" + test_no + "]";
	}
	
	
}
