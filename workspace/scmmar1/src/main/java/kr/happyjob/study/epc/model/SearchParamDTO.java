package kr.happyjob.study.epc.model;

public class SearchParamDTO {
	String searchKeyword;
	String dateStart;
	String dateEnd;
	String loginID;
	int purID;
	int startIndex;
	int currentPage;
	int pageBlockSize;
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public String getDateStart() {
		return dateStart;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	public String getLoginID() {
		return loginID;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getPageBlockSize() {
		return pageBlockSize;
	}
	public int getStartIndex() {
		return startIndex;
	}
	
	public int getPurID() {
		return purID;
	}
	public void setPurID(int purID) {
		this.purID = purID;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setPageBlockSize(int pageBlockSize) {
		this.pageBlockSize = pageBlockSize;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	@Override
	public String toString() {
		return "SearchParamDTO [searchKeyword=" + searchKeyword + ", dateStart=" + dateStart + ", dateEnd=" + dateEnd
				+ ", loginID=" + loginID + ", startIndex=" + startIndex + ", currentPage=" + currentPage
				+ ", pageBlockSize=" + pageBlockSize + "]";
	}
	
	
	
	
}
