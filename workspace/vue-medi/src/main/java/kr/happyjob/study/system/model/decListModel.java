package kr.happyjob.study.system.model;

import java.sql.Timestamp;
import java.util.Date;

public class decListModel {
	
	//신고구분(1:판매업 2:임대업)
	private int accas;	
	//접수번호
	private int accno;	
	//승인여부
	private String accyn;	
	//업체소재지
	private String copaddress;	
	//입허가번호
	private String coplicense;	
	//상호명
	private String copnm;	
	//제조업체 전화번호
	private String copphone;
	//신고인 주소
	private String dec_address;	
	//신고인 생년월일
	private String dec_birth;	
	//신고인 성명
	private String dec_name;	
	//신고구분(1:제조 2:수리 3:판매)
	private String divcd;	
	//구분상세(1:제조신고 2:제조신고변경 3:수입신고 4:수입신고변경)
	private String divdtl;	
	//분류번호(등급)
	private String divno;	
	//비고
	private String etc;	
	//사용시 주의사항
	private String hints;
	//담당자 성명
	private String manager;	
	//담당자 전화번호
	private String managerphone;	
	//제조원
	private String manufacturer;	
	//수리대상 의료기기 유형
	private String meditype;	
	//제품명
	private String modelnm;	
	//다른겸업여부
	private String otheryn;	
	//성능
	private String property;	
	//등록일자
	private Date regDate;	
	//등록자
	private String regID;
	//신고번호
	private String reporNumber;	
	//신고의주분
	private String reporttype;	
	//모양및구조
	private String shape;
	//구분
	private String type;	
	//수정일자
	private Date upDate;	
	//수정자
	private String upID;	
	//사용방법
	private String usemethod;	
	//사용목적
	private String usepurpose;	
	
	//기본생성자	
	public decListModel() {
	}
	
	//멤버필드에 대한 getter 및 setter
	public int getAccas() {
		return accas;
	}

	public void setAccas(int accas) {
		this.accas = accas;
	}

	public int getAccno() {
		return accno;
	}

	public void setAccno(int accno) {
		this.accno = accno;
	}

	public String getAccyn() {
		return accyn;
	}

	public void setAccyn(String accyn) {
		this.accyn = accyn;
	}

	public String getCopaddress() {
		return copaddress;
	}

	public void setCopaddress(String copaddress) {
		this.copaddress = copaddress;
	}

	public String getCoplicense() {
		return coplicense;
	}

	public void setCoplicense(String coplicense) {
		this.coplicense = coplicense;
	}

	public String getCopnm() {
		return copnm;
	}

	public void setCopnm(String copnm) {
		this.copnm = copnm;
	}

	public String getCopphone() {
		return copphone;
	}

	public void setCopphone(String copphone) {
		this.copphone = copphone;
	}

	public String getDec_address() {
		return dec_address;
	}

	public void setDec_address(String dec_address) {
		this.dec_address = dec_address;
	}

	public String getDec_birth() {
		return dec_birth;
	}

	public void setDec_birth(String dec_birth) {
		this.dec_birth = dec_birth;
	}

	public String getDec_name() {
		return dec_name;
	}

	public void setDec_name(String dec_name) {
		this.dec_name = dec_name;
	}

	public String getDivcd() {
		return divcd;
	}

	public void setDivcd(String divcd) {
		this.divcd = divcd;
	}

	public String getDivdtl() {
		return divdtl;
	}

	public void setDivdtl(String divdtl) {
		this.divdtl = divdtl;
	}

	public String getDivno() {
		return divno;
	}

	public void setDivno(String divno) {
		this.divno = divno;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getHints() {
		return hints;
	}

	public void setHints(String hints) {
		this.hints = hints;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getManagerphone() {
		return managerphone;
	}

	public void setManagerphone(String managerphone) {
		this.managerphone = managerphone;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getMeditype() {
		return meditype;
	}

	public void setMeditype(String meditype) {
		this.meditype = meditype;
	}

	public String getModelnm() {
		return modelnm;
	}

	public void setModelnm(String modelnm) {
		this.modelnm = modelnm;
	}

	public String getOtheryn() {
		return otheryn;
	}

	public void setOtheryn(String otheryn) {
		this.otheryn = otheryn;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getRegID() {
		return regID;
	}

	public void setRegID(String regID) {
		this.regID = regID;
	}

	public String getReporNumber() {
		return reporNumber;
	}

	public void setReporNumber(String reporNumber) {
		this.reporNumber = reporNumber;
	}

	public String getReporttype() {
		return reporttype;
	}

	public void setReporttype(String reporttype) {
		this.reporttype = reporttype;
	}

	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
		this.shape = shape;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getUpDate() {
		return upDate;
	}

	public void setUpDate(Date upDate) {
		this.upDate = upDate;
	}

	public String getUpID() {
		return upID;
	}

	public void setUpID(String upID) {
		this.upID = upID;
	}

	public String getUsemethod() {
		return usemethod;
	}

	public void setUsemethod(String usemethod) {
		this.usemethod = usemethod;
	}

	public String getUsepurpose() {
		return usepurpose;
	}

	public void setUsepurpose(String usepurpose) {
		this.usepurpose = usepurpose;
	}


	
	
}
