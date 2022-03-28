package kr.happyjob.study.TCHSUP.model;

import java.util.Date;

//강의정보
public class LectureInfo {
	
	private int lec_no; //강의번호
	private String lec_name; //강의명
	private int lec_cnt; //수강인원
	private String lec_start; //강의시작일
	private String lec_end; //강의종료일
	private String lec_goal; //강의목표
	private String lec_plan; //강의계획
	private String lec_file; //강의계획서 파일
	private String lec_lp; //파일논리경로
	private String lec_pp; //파일물리경로
	private String lec_filesize; //파일사이즈
	
	
	public int getLec_no() {
		return lec_no;
	}
	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	public String getLec_name() {
		return lec_name;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	public int getLec_cnt() {
		return lec_cnt;
	}
	public void setLec_cnt(int lec_cnt) {
		this.lec_cnt = lec_cnt;
	}
	public String getLec_start() {
		return lec_start;
	}
	public void setLec_start(String lec_start) {
		this.lec_start = lec_start;
	}
	public String getLec_end() {
		return lec_end;
	}
	public void setLec_end(String lec_end) {
		this.lec_end = lec_end;
	}
	public String getLec_goal() {
		return lec_goal;
	}
	public void setLec_goal(String lec_goal) {
		this.lec_goal = lec_goal;
	}
	public String getLec_plan() {
		return lec_plan;
	}
	public void setLec_plan(String lec_plan) {
		this.lec_plan = lec_plan;
	}
	public String getLec_file() {
		return lec_file;
	}
	public void setLec_file(String lec_file) {
		this.lec_file = lec_file;
	}
	public String getLec_lp() {
		return lec_lp;
	}
	public void setLec_lp(String lec_lp) {
		this.lec_lp = lec_lp;
	}
	public String getLec_pp() {
		return lec_pp;
	}
	public void setLec_pp(String lec_pp) {
		this.lec_pp = lec_pp;
	}
	public String getLec_filesize() {
		return lec_filesize;
	}
	public void setLec_filesize(String lec_filesize) {
		this.lec_filesize = lec_filesize;
	}
	
	
	
}
