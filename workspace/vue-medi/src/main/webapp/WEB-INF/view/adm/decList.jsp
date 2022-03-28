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
				divcd:"",
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
						
					<!-- search -->
					<jsp:include page="/WEB-INF/view/adm/search.jsp"></jsp:include>
					<!-- list select -->
					<jsp:include page="/WEB-INF/view/adm/btable.jsp"></jsp:include>
					
				</li>
			</ul>
	</div>
	
	<!-- 모달 팝업  -->
	<!-- 게시글 등록  -->
	<jsp:include page="/WEB-INF/view/adm/layer2.jsp"></jsp:include>
	
	<!-- 승인 반려 팝업 -->
	<jsp:include page="/WEB-INF/view/adm/layer55.jsp"></jsp:include>
	
	<!-- 신고서 타입 선택 팝업 -->
	<jsp:include page="/WEB-INF/view/adm/layer0.jsp"></jsp:include>
	
	<!-- 신고서 등록 팝업 -->
	<jsp:include page="/WEB-INF/view/adm/layer9.jsp"></jsp:include>
	
</body>
</html>