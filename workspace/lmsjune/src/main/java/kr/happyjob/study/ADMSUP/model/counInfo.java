package kr.happyjob.study.ADMSUP.model;

import java.sql.Date;

public class counInfo {
	
	// tb_coun : 상담
	private int	coun_no;		// 상담번호
	private int	class_no;		// 수강번호
	private Date coun_date; 	// 상담일자
	private int	room_no;	 	// 강의실 번호
	private String count_cont;	// 상담내용
	
	public int getCoun_no() {
		return coun_no;
	}
	public void setCoun_no(int coun_no) {
		this.coun_no = coun_no;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public Date getCoun_date() {
		return coun_date;
	}
	public void setCoun_date(Date coun_date) {
		this.coun_date = coun_date;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getCount_cont() {
		return count_cont;
	}
	public void setCount_cont(String count_cont) {
		this.count_cont = count_cont;
	}


}
