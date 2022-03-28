<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고서 승인</title>
<script type="text/javascript">
var listpagesize = 15;
var listblockpageSize = 15;
var detailpop;
var detailvue;
var search;
var comfirm;

$(document).ready(function() {
		init();
		listup();
});
	
function init() {
		detailvue = new Vue({
			  el: '#btable',
			  components: {
			    'bootstrap-table': BootstrapTable
			  },
			  data: {
			    items: [] 
			  },
			  methods:{					
				  ttt:function(no){		
					  this. fn_vueeditComnDetailCod(no)
				  },
				  fn_vueeditComnDetailCod:function(no){	
					  fn_editComnDetailCod(no);
				  }
			  },
			  filters : {  
			        // filter로 쓸 filter ID 지정
				yyyyMMdd : function(value){ 
			          // 들어오는 value 값이 공백이면 그냥 공백으로 돌려줌
			          if(value == '') return '';
			      
			          // 현재 Date 혹은 DateTime 데이터를 javaScript date 타입화
			          var js_date = new Date(value);

			          // 연도, 월, 일 추출
			          var year = js_date.getFullYear();
			          var month = js_date.getMonth() + 1;
			          var day = js_date.getDate();

			          // 월, 일의 경우 한자리 수 값이 있기 때문에 공백에 0 처리
			          if(month < 10){
			          	month = '0' + month;
			          }

			          if(day < 10){
			          	day = '0' + day;
			          }

			          // 최종 포맷 (ex - '2021-10-08')
			          return year + '-' + month + '-' + day;
				}
			}
			});
		
		search = new Vue({
			el:'#search',
			data:{
				sch:"",
				searchgrouptype1:"9",
				searchgrouptype2:"all"
			}
			
		});
		
		detailpop = new Vue({
			el:'#layer2',
			data:{
				divcd:"",
				modelnm:"",
				shape:"",
				property:"",
				copnm:"",
				usepurpose:"",
				usemethod:"",
				hints:"",
				etc:"",
				regDate:"",
				manufacturer:"",
				otheryn:"",
				copaddress:"",
		   		dec_name:"",
		   		dec_birth :"",
		   		meditype :"",
		   		accno:""
			},
			methods:{
				fn_SaveDtlCod:function(){
					//console.log("=========000==================: "+JSON.stringify(maininsert1.data));
				},
				resave:function(accno,r,divcd){
					maininsert1.accno = accno;
					maininsert1.action = r; 
					maininsert1.divcd = divcd; 
					
					var param ={
						accno : accno
					};
					callAjax("/adm/oneselect.do", "post", "json", true, param, this.resultCallback);  
					gfModalPop("#layer9");
				},
				delect:function(accno,r){
					maininsert1.accno = accno;
					maininsert1.action = r; 
					maininsert1.minert();
				},
				resultCallback:function(data){
					maininsert1.dec_name= data.oneselect.dec_name;
					maininsert1.dec_birth= data.oneselect.dec_birth;
					maininsert1.dec_address= data.oneselect.dec_address;
					maininsert1.copnm= data.oneselect.copnm;
					maininsert1.coplicense= data.oneselect.coplicense;
					maininsert1.copaddress= data.oneselect.copaddress;
					maininsert1.type= data.oneselect.type;
					maininsert1.divdtl= data.oneselect.divdtl;
					maininsert1.modelnm=data. oneselect.modelnm;
					maininsert1.divno= data.oneselect.divno;
					maininsert1.shape= data.oneselect.shape;
					maininsert1.property= data.oneselect.property;
					maininsert1.usepurpose= data.oneselect.usepurpose;
					maininsert1.hints= data.oneselect.hints;
					maininsert1.manufacturer=data. oneselect.manufacturer;
					maininsert1.etc= data.oneselect.etc;
					maininsert1.manager= data.oneselect.manager;
					maininsert1.managerphone= data.oneselect.managerphone;
				}
			}
		});	
		
		comfirm = new Vue({
			el:"#layer55",
			data:{
				comttt:"",
				accno:""
			},
			methods:{
				comttt1:function(){
					console.log("===============================: "+comfirm.comttt);
					console.log("============123==============: "+comfirm.accno);
					
					var param = {
							accyn : comfirm.comttt,
							accno : comfirm.accno
					};
					callAjax("/adm/comupdate.do", "post", "json", true, param, this.resultCallback); 
				}
			}
		});
		
		div= new Vue({
			el:"#layer0",
			data:{
				divcd:0
			},
			methods:{
				divinsert:function(){
					//alert("divinsert : " + div.divcd);
					
					maininsert1.divcd = div.divcd;
					gfModalPop("#layer9");
				}
			}
		});
		
		maininsert1 = new Vue({
			el:"#layer9",
			data:{
				divcd:0,
				accno : "", 
				dec_name:"",
				dec_birth:"",
				dec_address:"",
				copnm:"",
				coplicense:"",
				copaddress:"",
				type:"",
				divdtl:"",
				modelnm:"",
				divno:"",
				shape:"",
				property:"",
				usepurpose:"",
				hints:"",
				manufacturer:"",
				etc:"",
				manager:"",
				managerphone:"",
				action:"",
				accas:"",
				otheryn:"",
				meditype:"",
			} ,
			methods:{
			 minert:function(){
					console.log("maininsert1.dec_name : "+maininsert1.dec_name);
					console.log("maininsert1.dec_birth : "+maininsert1.dec_birth);
					console.log("maininsert1.dec_address : "+maininsert1.dec_address);
					console.log("maininsert1.type : "+maininsert1.type);
					console.log("maininsert1.divdtl : "+maininsert1.divdtl);
					console.log("maininsert1.accno : "+maininsert1.accno);
					console.log("maininsert1.action : "+maininsert1.action);
					//alert(maininsert1.accno);
					//alert(this.divcd);
					//alert(typeof maininsert1.divcd);
					   var param = {
						 	accno : maininsert1.accno, 
							dec_name : maininsert1.dec_name,
							dec_birth: maininsert1.dec_birth,
							dec_address: maininsert1.dec_address,
							copnm: maininsert1.copnm,
							coplicense: maininsert1.coplicense,
							copaddress: maininsert1.copaddress,
							type: maininsert1.type,
							divdtl: maininsert1.divdtl,
							modelnm: maininsert1.modelnm,
							divno: maininsert1.divno,
							shape: maininsert1.shape,
							property: maininsert1.property,
							usepurpose: maininsert1.usepurpose,
							hints: maininsert1.hints,
							manufacturer: maininsert1.manufacturer,
							etc: maininsert1.etc,
							manager: maininsert1.manager,
							managerphone: maininsert1.managerphone,
							action:maininsert1.action,
							divcd:maininsert1.divcd,
							accas:maininsert1.accas,
							otheryn:maininsert1.otheryn
							
					}; 
					callAjax("/adm/cinsert.do", "post", "json", true, param, this.resultCallback);  
				}
			} 
		});
		
};

function fn_editComnDetailCod(no) {
	
   	console.log("no : " + no) ;
   	
   	var param = {
   		no : no
   	};
	
	var resultCallback = function(data) {
		
		//console.log("--------------------"+JSON.stringify(data));
		fn_detaileditresult(data);
	}		
	callAjax("/adm/modellist.do", "post", "json", true, param, resultCallback); 
 
}


function fn_detaileditresult(data) {
	gfModalPop("#layer2");
	
	
	detailpop.modelnm = data.modellist.modelnm;
	detailpop.shape = data.modellist.shape;
	detailpop.property = data.modellist.property;
	detailpop.copnm = data.modellist.copnm;
	detailpop.usepurpose = data.modellist.usepurpose;
	detailpop.usemethod = data.modellist.usemethod;
	detailpop.hints = data.modellist.hints;
	detailpop.etc = data.modellist.etc;
	detailpop.regDate = data.modellist.regDate;
	detailpop.manufacturer = data.modellist.manufacturer;
	detailpop.otheryn = data.modellist.otheryn;
	detailpop.divcd = data.modellist.divcd;
	detailpop.copaddress = data.modellist.copaddress;
	detailpop.dec_name = data.modellist.dec_name;
	detailpop.dec_birth = data.modellist.dec_birth;
	detailpop.meditype = data.modellist.meditype;
	detailpop.accno =  data.modellist.accno;
}

function ccc(no){
	comfirm.accno = no;
	  gfModalPop("#layer55");
}
function mi(){
	
	//gfModalPop("#layer9");
	gfModalPop("#layer0");
}

function listup(pagenum){
	
	pagenum = pagenum || 1;	
	
	 var resultCallback = function(data) {
			fn_detaillistdisplay(data,pagenum);
		}
	 var param = {
			 				search : search.sch,
			                pageSize : listpagesize,
			                pagenum : pagenum,
			                searchgrouptype2 : search.searchgrouptype2,
			                searchgrouptype1 : search.searchgrouptype1
	 };
	
	callAjax("/adm/acb.do", "post", "json", true, param, resultCallback);
	
	
};

function fn_detaillistdisplay (data,pagenum){
	 //console.log(JSON.stringify(data));
	 
	 console.log("----------ffff---------" +data.totaldecListcount);
	 
	detailvue.items  = [];
	detailvue.items = data.decList;
	
	var totaldecListcount = data.totaldecListcount;	// total 값
		 
		var paginationHtml = getPaginationHtml(pagenum, totaldecListcount, listpagesize, listblockpageSize, 'listup');
		console.log("paginationHtml : " + paginationHtml);
		
		$("#listInfPagination").empty().append( paginationHtml );
		
};


</script>




</head>
<body>
		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
			<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb" style="height: 50%">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					
					<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">Sample</span> <span class="btn_nav bold">공통코드
								관리</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>
						
						<div id = "search">
						<p class="conTitle">
							<span>신고서 목록 / 조회 / 승인</span> 
							<span class="fr">
							  
							     <select id="searchgrouptype1"  name="searchgrouptype1" style="width: 150px; height: 25px" v-model = "searchgrouptype1" >
							            <option value="9" >전체</option>
							    		<option value="0" >승인대기</option>
							    		<option value="1" >승인</option>
							    		<option value="2" >반려</option>
							     </select> 
							     
							       <select id="searchgrouptype2"  name="searchgrouptype2" style="width: 150px; height: 25px" v-model = "searchgrouptype2">
							            <option value="all" >전체</option>
							    		<option value="codelnm" >의료기기 이름</option>
							    		<option value="copnm" >업체명</option>
							    		<option value="regID" >등록자</option>
							     </select> 
							     <input type="text" style="width: 300px; height: 25px;" id="sgroupinput" name="sgroupinput" v-model = "sch">
	                              <a onclick="listup()" class="btnType blue" id="btnSearchGrpcod" name="btn" ><span style="cursor:hand;">검  색</span></a>
	                              <a  onclick="mi()" class="btnType blue" id="mi" name="btn" ><span style="cursor:hand;">등  록</span></a>
							</span>
						</p>
					</div>
					
					<div class="content">
                          <div id="btable">
								<div class="bootstrap-table">
									<div class="fixed-table-toolbar">
										<div class="bs-bars pull-left"></div>
										<div class="columns columns-right btn-group pull-right">	</div>
									</div>
									<div class="fixed-table-container" style="padding-bottom: 0px;">
										<div class="fixed-table-body" style="height: 50%">		
												<table class="col">
													<caption>caption</caption>
													<colgroup>
													   <col width="5%">
													   <col width="35%">
														<col width="30%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
													</colgroup>
								
													<thead>
														<tr>
														    <th scope="col">NO</th>
														    <th scope="col">의료기기 이름</th>
															<th scope="col">업체명</th>
															<th scope="col">등록자</th>
															<th scope="col">날짜</th>
															<th scope="col">승인여부</th>
														</tr>
													</thead>
													<tbody id="listInf" v-for="(item,index) in items" v-if="items.length">
													      <tr >
														    <td >{{ item.accno }}</td>
														    <td  @click="ttt(item.accno)" style="cursor:hand;">{{ item.modelnm }}</td>
															<td>{{ item.copnm }}</td>
															<td>{{ item.regID }}</td>
															<td>{{ item.regDate | yyyyMMdd }}</td>		
															<td v-if ="item.accyn ==0" @click="ccc(item.accno)" style="cursor:hand;">승인대기</td>
															<td v-else-if ="item.accyn ==1" @click="ccc(item.accno)" style="cursor:hand;">승인</td>
															<td v-else-if ="item.accyn ==2" @click="ccc(item.accno)" style="cursor:hand;">반려</td>
															<td v-else style="cursor:no-drop;">-</td>
														</tr>
													</tbody>
												</table>
										</div>
	                                    <div>
												<div>
													<div class="clearfix" />
												</div>
										</div>
									 </div>		
								   </div>
								</div>			   

					        	<div class="paging_area"  id="listInfPagination"> </div>
					</div>
				</li>
			</ul>
	</div>
	
	<jsp:include page="/WEB-INF/view/adm/layer2.jsp"></jsp:include>
	<!-- 모달 팝업  -->
	 <div id="layer2" class="layerPop layerType2" style="width: 600px;">
	  <div id="vueedittable">
		<dl>
			<dt>
				<strong>허가증</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="50px">
						<col width="120px">
					</colgroup>

					<tbody v-if = "divcd ==1">
						<tr>
							<th scope="row">제품명(품목명 및 형명)</th>
							<td scope="row"><input type="text"  id="modelnm"  name="modelnm" v-model="modelnm" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">형상 및 구조</th>
							<td scope="row"><input type="text"  id="shape"  name="shape" v-model="shape" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">원자재 또는 성분 및 분량</th>
							<td scope="row"><input type="text"  id="property"  name="property" v-model="property" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">제조방법</th>
							<td scope="row"><input type="text"  id="copnm"  name="copnm" v-model="copnm" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">성능 및 사용 목적</th>
							<td scope="row"><input type="text"  id="usepurpose"  name="usepurpose" v-model="usepurpose" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">조작방법 또는 사용방법</th>
							<td scope="row"><input type="text"  id="usemethod"  name="usemethod" v-model="usemethod" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">사용시 주의 사항</th>
							<td scope="row"><input type="text"  id="hints"  name="hints" v-model="hints" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">포장단위</th>
							<td scope="row"><input type="text"  id="etc"  name="etc" v-model="etc" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">저장방법 및 사용기한</th>
							<td scope="row"><input type="text"  id="regDate"  name="regDate" v-model="regDate" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">시험규격</th>
							<td scope="row"><input type="text"  id="manufacturer"  name="manufacturer" v-model="manufacturer" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">제조원</th>
							<td scope="row"><input type="text"  id="otheryn"  name="otheryn" v-model="otheryn" readonly="readonly"/></td>
						</tr>
					</tbody>
					
					
					<tbody v-else-if = "divcd ==2">
						<tr>
							<th scope="row">업소명</th>
							<td scope="row"><input type="text"  id="copnm"  name="copnm" v-model="copnm" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">소재지</th>
							<td scope="row"><input type="text"  id="copaddress"  name="copaddress" v-model="copaddress" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">대표자</th>
							<td scope="row"><input type="text"  id="dec_name"  name="dec_name" v-model="dec_name" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">생년원일</th>
							<td scope="row"><input type="text"  id="dec_birth"  name="dec_birth" v-model="dec_birth" readonly="readonly"/> </td>
						</tr>
						<tr>
							<th scope="row">수리대상 의료기기 유형</th>
							<td scope="row"><input type="text"  id="meditype"  name="meditype" v-model="meditype" readonly="readonly"/> </td>
						</tr>
					</tbody>
					
					<tbody v-else>
						<tr>
							<th colspan="3">증서 등록이 없습니다.</th>
						</tr>					
					</tbody>
					
					
					
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
				   <input type="hidden" name="Actiondetail" id="Actiondetail" value="">
					<!-- <a class="btnType blue" id="btnSaveDtlCod"  @click="fn_SaveDtlCod()" name="btn"><span>저장</span></a> -->
					<a  href="" @click="delect(detailpop.accno,'D')" class="btnType blue" id="btnDeleteDtlCod" @click="fn_deleteDtlCod()" name="btn"><span>삭제</span></a> 
					<a  @click="resave(detailpop.accno,'R',detailpop.divcd)" class="btnType gray" id="btnCloseDtlCod" name="btn"><span style="cursor:hand;">수정</span></a>
					<a  href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
   </div> 
	
	
	
	
	<div id="layer55" class="layerPop layerType2" style="width: 600px;">
	  <div id="vueedittable">
		<dl>
			<dt>
				<strong>승인여부</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="100px">
						<col width="100px">
					</colgroup>

					<tbody >
						<tr>
							<td scope="row" colspan="3" style="text-align: center">
							<input type="radio" name = "comttt" value = "1" id = "comttt" v-model="comttt">승인
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name = "comttt" value = "2" id = "comttt" v-model="comttt">반려
							</td>
						</tr>
				</table>
				<!-- e : 여기에 내용입력 -->
				<div class="btn_areaC mt30">
				   <input type="hidden" name="Actiondetail" id="Actiondetail" value="">
					<a href=""class="btnType blue" id="btnSaveDtlCod"  @click="comttt1()" name="btn"><span>저장</span></a>
					<a href=""class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
   </div>
	
	<div id="layer0" class="layerPop layerType2" style="width: 600px;">
	  <div id="vueedittable">
		<dl>
			<dt>
				<strong>등록</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="100px">
						<col width="100px">
					</colgroup>

					<tbody >
						<tr>
							<td scope="row" colspan="3" style="text-align: center">
							<input type="radio" name = "divcd" value = "1" id = "divcd" v-model="divcd">의료기기 신고서
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name = "divcd" value = "2" id = "divcd" v-model="divcd">의료기기 수리업 신고서
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name = "divcd" value = "3" id = "divcd" v-model="divcd">의료기기 판매업 신고서
							</td>
						</tr>
				</table>
				<!-- e : 여기에 내용입력 -->
				<div class="btn_areaC mt30">
				   <input type="hidden" name="Actiondetail" id="Actiondetail" value="">
					<a class="btnType blue" id="btnSaveDtlCod"  @click="divinsert()" name="btn"><span>등록</span></a>
					<a href=""class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
   </div>
	
	
	<div id="layer9" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>신고서</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="100px">
						<col width="100px">
					</colgroup>
						
					<tbody v-if="divcd ==1">
						<tr>
							<td colspan="4" style="text-align: center">신고인(대표자)</td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text"  v-model ="dec_name"></td>
							<td>생년 월일</td>
							<td><input type="text" v-model ="dec_birth"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text"  v-model ="dec_address"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">제조(소입)업소</td>
						</tr>
						<tr>
							<td>명칭(상호)</td>
							<td><input type="text" v-model ="copnm"></td>
							<td>입허가번호</td>
							<td><input type="text" v-model ="coplicense"></td>
						</tr>
						<tr>
							<td>소재지</td>
							<td colspan="3"><input type="text" style="width: 100%" v-model ="copaddress"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">구분</td>
						</tr>
						<tr>
							<td><input type="radio" name="type" value = "items" v-model ="type">품목류 </td>
							<td><input type="radio" name="dtype" value ="1" v-model ="divdtl">제조신고 </td>
							<td><input type="radio" name="dtype" value="2" v-model ="divdtl">제조신고변경 </td>
							<td><input type="radio" name="dtype" v-model ="divdtl">조건부 제조신고 </td>
						</tr>
						<tr>
							<td><input type="radio" name="type" value = "item" v-model ="type">품목 </td>
							<td><input type="radio" name="dtype" value ="3" v-model ="divdtl">수입신고 </td>
							<td><input type="radio" name="dtype" value="4" v-model ="divdtl">수입신고변경 </td>
							<td><input type="radio" name="dtype" v-model ="divdtl">조건부 수입신고 </td>
						</tr>
						<tr>
							<td colspan="2">제품명(상품명,품목명,모델명)</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="modelnm"></td>
						</tr>
						<tr>
							<td colspan="2">분류번호(등급)</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="divno"></td>
						</tr>
						<tr>
							<td colspan="2">모양 및 구조</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="shape"></td>
						</tr>
						<tr>
							<td colspan="2">성능</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="property"></td>
						</tr>
						<tr>
							<td colspan="2">사용 목적</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="usepurpose"></td>
						</tr>
						<tr>
							<td colspan="2">사용시 주의사항</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="hints"></td>
						</tr>
						<tr>
							<td colspan="2">제조원</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="manufacturer"></td>
						</tr>
						<tr>
							<td colspan="2">비고</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="etc"></td>
						</tr>
						<tr>
							<td colspan="2">신고인</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="dec_name"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 성명</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="manager"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 전화번호</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="managerphone"></td>
						</tr>
					</tbody>
					
					<tbody v-else-if="divcd ==2">
						<tr>
							<td colspan="4" style="text-align: center">신고인(대표자)</td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text"  v-model ="dec_name"></td>
							<td>생년 월일</td>
							<td><input type="text" v-model ="dec_birth"></td>
						</tr>
						<tr>
							<td>등록기준지</td>
							<td><input type="text"  v-model ="dec_address"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">제조(소입)업소</td>
						</tr>
						<tr>
							<td>영업소명</td>
							<td><input type="text" v-model ="copnm"></td>
							<td>전화번호</td>
							<td><input type="text" v-model ="managerphone"></td>			
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="3"><input type="text" style="width: 100%" v-model ="copaddress"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">수리대상 의료기기의 유형</td>
							<td colspan="2" ><textarea rows="5" cols="10" style="resize: none"  v-model="meditype"></textarea> </td>							
						</tr>
						<tr>
							<td colspan="2">다른 겸업 여부</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="otheryn"></td>	
						</tr>
						<tr>
							<td colspan="2">비고 </td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="etc"></td>	
						</tr>
						<tr>
							<td colspan="2">신고인</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="dec_name"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 성명</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="manager"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 전화번호</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="managerphone"></td>
						</tr>
					</tbody>
					
					<tbody v-else-if="divcd ==3">
						<tr>
							<td colspan="4" style="text-align: center">신고인(대표자)</td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text"  v-model ="dec_name"></td>
							<td>생년 월일</td>
							<td><input type="text" v-model ="dec_birth"></td>
						</tr>
						<tr>
							<td>등록기준지</td>
							<td><input type="text"  v-model ="dec_address"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">제조(소입)업소</td>
						</tr>
						<tr>
							<td>영업소명)</td>
							<td><input type="text" v-model ="copnm"></td>
							<td>신고번호</td>
							<td><input type="text" v-model ="coplicense"></td>			
						</tr>
						<tr>
							<td>소재지</td>
							<td colspan="3"><input type="text" style="width: 100%" v-model ="copaddress"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">구분</td>
						</tr>
						<tr>
							<td><input type="radio" name="accas" value = "1" v-model ="accas">판매업 </td>		
							<td><input type="radio" name="accas" value ="2" v-model ="accas">임대업</td>			
						</tr>
						<tr>
							<td colspan="2">신고인</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="dec_name"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 성명</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="manager"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 전화번호</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="managerphone"></td>
						</tr>
					</tbody>
					
					<tbody v-else>
						<tr>
							<td colspan="4" style="text-align: center">신고서를 선택해 주세요{{divcd}}</td>
						</tr>
					</tbody>
					
				</table>
				<!-- e : 여기에 내용입력 -->
					<div class="btn_areaC mt30">
					   <input type="hidden" name="Actiondetail" id="Actiondetail" value="">
						<a href="" class="btnType blue" id="btnSaveDtlCod"  @click="minert()" name="btn" ><span>저장</span></a>
						<a  href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
					</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
   </div>
</body>
</html>