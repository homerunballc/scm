package kr.happyjob.study.TCHSUP.model;

//학습자료
public class SupportInfo {

	private int sup_no; //자료번호
	private String sup_name; //제목
	private String sup_cont; //내용
	private String sup_file; //첨부파일명
	private String sup_lp; //논리경로
	private String sup_pp; //물리경로
	private String sup_filesize; //파일사이즈
	
	public int getSup_no() {
		return sup_no;
	}
	public void setSup_no(int sup_no) {
		this.sup_no = sup_no;
	}
	public String getSup_name() {
		return sup_name;
	}
	public void setSup_name(String sup_name) {
		this.sup_name = sup_name;
	}
	public String getSup_cont() {
		return sup_cont;
	}
	public void setSup_cont(String sup_cont) {
		this.sup_cont = sup_cont;
	}
	public String getSup_file() {
		return sup_file;
	}
	public void setSup_file(String sup_file) {
		this.sup_file = sup_file;
	}
	public String getSup_lp() {
		return sup_lp;
	}
	public void setSup_lp(String sup_lp) {
		this.sup_lp = sup_lp;
	}
	public String getSup_pp() {
		return sup_pp;
	}
	public void setSup_pp(String sup_pp) {
		this.sup_pp = sup_pp;
	}
	public String getSup_filesize() {
		return sup_filesize;
	}
	public void setSup_filesize(String sup_filesize) {
		this.sup_filesize = sup_filesize;
	}
	
	
}
