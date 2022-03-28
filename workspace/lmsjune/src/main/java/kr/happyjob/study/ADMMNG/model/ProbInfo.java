package kr.happyjob.study.ADMMNG.model;

public class ProbInfo{
	
	//시험번호
	private int    test_no;
	//문제번호
	private String que_no;
	//문제
	private String que_que;
	//정답
	private int    que_right;
	//보기1
	private String que_ex1;
	//보기2
	private String que_ex2;
	//보기3
	private String que_ex3;
	//보기4
	private String que_ex4;
	
	
	public int getTest_no() {
		return test_no;
	}


	public String getQue_no() {
		return que_no;
	}


	public String getQue_que() {
		return que_que;
	}


	public int getQue_right() {
		return que_right;
	}


	public String getQue_ex1() {
		return que_ex1;
	}


	public String getQue_ex2() {
		return que_ex2;
	}


	public String getQue_ex3() {
		return que_ex3;
	}


	public String getQue_ex4() {
		return que_ex4;
	}
	
	private void setTest_no(int test_no) {
		this.test_no = test_no;
	}


	private void setQue_no(String que_no) {
		this.que_no = que_no;
	}


	private void setQue_que(String que_que) {
		this.que_que = que_que;
	}


	private void setQue_right(int que_right) {
		this.que_right = que_right;
	}


	private void setQue_ex1(String que_ex1) {
		this.que_ex1 = que_ex1;
	}


	private void setQue_ex2(String que_ex2) {
		this.que_ex2 = que_ex2;
	}


	private void setQue_ex3(String que_ex3) {
		this.que_ex3 = que_ex3;
	}


	private void setQue_ex4(String que_ex4) {
		this.que_ex4 = que_ex4;
	}


	@Override
	public String toString() {
		return "ProbInfo [test_no=" + test_no + ", que_no=" + que_no + ", que_que=" + que_que + ", que_right="
				+ que_right + ", que_ex1=" + que_ex1 + ", que_ex2=" + que_ex2 + ", que_ex3=" + que_ex3 + ", que_ex4="
				+ que_ex4 + "]";
	}

}
