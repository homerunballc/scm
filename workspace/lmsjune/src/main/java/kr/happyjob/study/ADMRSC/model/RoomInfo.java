package kr.happyjob.study.ADMRSC.model;


public class RoomInfo {
	
	// tb_room : 강의실
	private int room_no;		// 강의실 번호 
	private String room_name;	// 강의실 이름
	private String room_addr;	// 강의실 주소
	
	  
	public String getRoom_addr() {
		return room_addr;
	}
	public void setRoom_addr(String room_addr) {
		this.room_addr = room_addr;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

}
