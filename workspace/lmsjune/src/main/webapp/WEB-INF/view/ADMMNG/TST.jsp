<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>시험대상자 관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- D3 -->
<style>
//
click-able rows
	.clickable-rows {tbody tr td { cursor:pointer;
	
}

.el-table__expanded-cell {
	cursor: default;
}
}
</style>
<script type="text/javascript">
        var pageSizeinf  = 3;
        var pageBlockSizeinquiry  = 10;

        var listvue;
        var selectLecture;
        var detaileditvue;
        var lecinfo;
        
		/* onload 이벤트  */
		$(document).ready(function() {
			init();	
			
			comcombo("areaCD", "areaall", "all", "2");   // Group Code, Combo Name, Option("all" : 전체     "sel" : 선택 , Select Value )  
			comcombo("JOBCD", "joball", "all", "3");   // Group Code, Combo Name, Option("all" : 전체     "sel" : 선택 , Select Value )  
			comcombo("industryCD", "industryall", "all", "J62");   // Group Code, Combo Name, Option("all" : 전체     "sel" : 선택 , Select Value )  
			
			selectcombo("tea", "teacher", "all", "");   // tea : 교수   room : 강의실  course : 과정 , Combo Name, Option("all" : 전체     "sel" : 선택 , Select Value )  
			selectcombo("room", "room", "sel", "");   // tea : 교수   room : 강의실  course : 과정 , Combo Name, Option("all" : 전체     "sel" : 선택 , Select Value )  
			
		
			// 공지사항 조회
			fListInf();
			// 강의 조회
			fListLecture();
									
			// 버튼 이벤트 등록
			fRegisterButtonClickEvent();
		});
		

		function init() {
			selectLecture = new Vue({
				  el: '#selectLecture',
				  data: {
					  slec : "",
					  stea : ""
				  } 
			});	  			
			
			
			listvue = new Vue({
				  el: '#divListLecture',
				  components: {
				    'bootstrap-table': BootstrapTable
				  },
				  data: {
					  items: [] 
				  },
				  methods:{					
					  rowClicked:function(lec_no,std_cnt){		
						  //alert("rowClicked : " + lec_no);
						  
						  fn_selectCourse(lec_no,std_cnt);
						  //$("#action").val("U");
					  },
					  applyClicked:function(lec_no){		
						  //alert("applyClicked : " + lec_no);
						  
						  fn_applyCourse(lec_no);
						  //$("#action").val("U");
					  },
					  canapplyClicked:function(lec_no){		
						  //alert("applyClicked : " + lec_no);
						  
						  fn_canapplyCourse(lec_no);
						  //$("#action").val("U");
					  }
				  }      
			});	  
			
			lecinfo = new Vue({
				  el: '#lecinfo',
				  data: {
			        no: '' 
			       ,title: ''
				   ,teacher: '' 
				   ,room: '' 
				   ,startdate: '' 
				   ,enddate: ''
				  }
				});	
			
			$("#enddate").datepicker({defaultDate: $.datepicker.formatDate('yy.mm.dd', new Date())});
			$("#startdate").datepicker({ dateFormat: 'yy.mm.dd' }).bind("change",function(){
	            var minValue = $(this).val();
	            minValue = $.datepicker.parseDate("yy.mm.dd", minValue);
	            minValue.setDate(minValue.getDate()+1);
	            $("#enddate").datepicker( "option", "minDate", minValue );
	        });
			
		}
		 
		/** 버튼 이벤트 등록 */
		function fRegisterButtonClickEvent() {
						 
		$('a[name=btn]').click(function(e) {
				e.preventDefault();

				var btnId = $(this).attr('id');
				switch (btnId) {
					case 'btnCloseCourse' :
						gfCloseModal();	
					    break;
					case 'registlecBtn' :  
						fLregLecture();	
					    break;
					case 'searchlecBtn' :
						fListLecture();	
					    break;
					case 'btnSaveCourse' :
						fsaveLecture();	
					    break; 
					case 'btnDeleteCourse' :
						$("#action").val("D");
						fsaveLecture();	
					    break; 
					    
			}
		});			
	}  
		
		  
				
	/** 공지사항 조회 */
	function fListInf(currentPage) {
		
		currentPage = currentPage || 1;
		
		console.log("currentPage : " + currentPage);
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeinf
		}
		
		var resultCallback = function(data) {
			fListInfResult(data, currentPage);
		};
		
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		//html로 받을거라 text
		callAjax("/inf/listinf.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 공지사항 조회 콜백 함수 */
	function fListInfResult(data, currentPage) {
				
		console.log("fListInfResult : " + data);		
		
		// 기존 목록 삭제
		$('#listInf').empty();
		$("#listInf").append(data);
		
		// 총 개수 추출
		var totalCntlistInf = $("#totcnt").val();
		var list = $("#selectedInfNo").val();
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntlistInf, pageSizeinf, pageBlockSizeinquiry, 'fListInf',[list]);
		console.log("paginationHtml : " + paginationHtml);
	
		$("#listInfPagination").empty().append( paginationHtml );
	
	}
	
	 /*공지사항 상세 조회*/
	 function fNoticeModal(noticeNo) {
	
		 var param = {noticeNo : noticeNo};
		 var resultCallback2 = function(data){
			 fdetailResult(data);
		 };
		 
		 callAjax("/system/detailNotice.do", "post", "json", true, param, resultCallback2);
	 }
	
	 /*  공지사항 상세 조회 -> 콜백함수   */
	 function fdetailResult(data){

		 console.log("fdetailResult  !!!!!!!!! : " + JSON.stringify(data));	
		 
		 if(data.resultMsg == "SUCCESS"){
			 //모달 띄우기 
			 gfModalPop("#notice");
			 
			// 모달에 정보 넣기 
			frealPopModal(data.result);
		 
		 }else{
			 alert(data.resultMsg);
		 }
	 }
	
	 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	 function frealPopModal(object){
		 
		 $("#loginId").val(object.loginId);
		 $("#loginId").attr("readonly", true); // 작성자 수정불가 
		 
		 $("#write_date").val(object.noticeRegdate);
		 $("#write_date").attr("readonly", true); // 처음 작성된 날짜 수정불가 
		 
		 $("#noticeTitle").val(object.noticeTitle);
		 $("#noticeTitle").attr("readonly", true);

		 $("#noticeContent").val(object.noticeContent);
		 $("#noticeContent").attr("readonly", true);
		 
		 $("#noticeNo").val(object.noticeNo); // 중요한 num 값도 숨겨서 받아온다. 
		 
	 }


	 function fListLecture(currentPage) {
		currentPage = currentPage || 1;
		
		console.log("currentPage : " + currentPage);
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeinf
				,   slec : selectLecture.slec
				,   stea : selectLecture.stea
		};		
		
		var resultCallback = function(data) {
			fListlecResult(data, currentPage);
		};
		
		callAjax("/dashboard/listlec.do", "post", "json", true, param, resultCallback);
	 
	 }
	 
	function fListlecResult(data,currentPage) {
		
		console.log("fListlecResult  !!!!!!!!! : " + JSON.stringify(data));	
		
		listvue.items=[];
		listvue.items=data.leclist;
		

		// 총 개수 추출
		var totalCntlist = data.totalcnt;
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntlist, pageSizeinf, pageBlockSizeinquiry, 'fListLecture');
		console.log("paginationHtml : " + paginationHtml);
	
		$("#listLecturePagination").empty().append( paginationHtml );
		
	}
	 
	function fLregLecture() {
		$("#lecno").val("");
		$("#action").val("I");
		
		lecinfo.no = "";
		lecinfo.title = "";
		lecinfo.teacher = "";
		lecinfo.room = "";
		lecinfo.startdate = "";
		lecinfo.enddate = "";
		$("#uploadfile").val("");
		$("#filediv").empty();
		
		$("#btnDeleteCourse").hide();
		
		gfModalPop("#lecinfo");
		
		
	}
	
	
	
	function fn_selectCourse(lec_no,std_cnt) {
		var param = {
				lecno : lec_no
	    };		
	
		var resultCallback = function(data) {
			fselecrlecResult(data);
		};
		
		callAjax("/dashboard/selectlec.do", "post", "json", true, param, resultCallback);

	}
	
    function fselecrlecResult(data) {
		
		console.log("fselecrlecResult  !!!!!!!!! : " + JSON.stringify(data));	
	
		$("#lecno").val(data.lecinfo.lec_no);
		$("#action").val("U");
		
		lecinfo.no = data.lecinfo.lec_no;
		lecinfo.title = data.lecinfo.lec_name;
		lecinfo.teacher = data.lecinfo.teach_no;
		lecinfo.room = data.lecinfo.room_no;
		lecinfo.startdate = data.lecinfo.lec_start;
		lecinfo.enddate = data.lecinfo.lec_end;
		
		var filediv = "";
				
		if(data.lecinfo.lec_file == "" || data.lecinfo.lec_file == null) {
			$("#filediv").empty();
		} else {
			filediv = "<a href='javascript:filedownload()'>" + data.lecinfo.lec_file + "</a>";
			$("#filediv").empty().append( filediv );
		}
				
		 if(data.lecinfo.std_cnt > 0) {
			 $("#btnDeleteCourse").hide();
		 } else {
			 $("#btnDeleteCourse").show();
		 }
		 
		 gfModalPop("#lecinfo");
	}
	
	
    function filedownload() {
    	var params = "";
    	params += "<input type='hidden' name='lecno' value='"+ lecinfo.no +"' />";
    	
    	jQuery("<form action='/dashboard/downloadfile.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();
    }
	

    function fsaveLecture() {

		//alert("저장 함수 타는지!!!!!?? ");
		// validation 체크 
		if (!(fValidatePopup())) {
			return;
		}

		var resultCallback = function(data) {
			fSaveLectureResult(data);
		};
		
		var frm = document.getElementById("myForm");
		frm.enctype = 'multipart/form-data';
		var dataWithFile = new FormData(frm);	

		callAjaxFileUploadSetFormData("/dashboard/lectureSave.do", "post", "json", true, dataWithFile, resultCallback);

	}

	// 저장 ,수정, 삭제 콜백 함수 처리 
	function fSaveLectureResult(data) {
		var currentPage = currentPage || 1;

		if ($("#action").val() != "I") {
			currentPage = $("#currentPage").val();
		}

		if (data.resultMsg == "SUCCESS") {
			//alert(data.resultMsg);	// 받은 메세지 출력 
			alert("저장 되었습니다.");
		} else if (data.resultMsg == "UPDATE") {
			alert("수정 되었습니다.");
		} else if (data.resultMsg == "DELETE") {
			alert("삭제 되었습니다.");
		} else {
			alert(data.resultMsg); //실패시 이거 탄다. 
			alert("실패 했습니다.");
		}

		gfCloseModal(); // 모달 닫기
		fListLecture(currentPage); // 목록조회 함수 다시 출력 
		//frealPopModal();// 입력폼 초기화
	}
	
	// 팝업내 수정, 저장 validation 
	function fValidatePopup() {
		
		var chk = checkNotEmpty(
				                           [ [ "title", "제목을 입력해주세요!" ],
				                             [ "teacher", "교수를 선택해주세요!" ], 
				                             [ "room", "강의실을 선택해주세요!" ], 
				                             [ "startdate", "시작일자를 입력해주세요!" ], 
				                             [ "enddate", "종료일자를 입력해주세요!" ], 
		                                   ]
				                         );
		if (!chk) {
			return;
		}
		return true;
	}	
	
	
	function fn_applyCourse(lec_no) {
		var param = {
				lecno : lec_no
	    };		
	
		var resultCallback = function(data) {
			fapplylecResult(data);
		};
		
		callAjax("/dashboard/applylec.do", "post", "json", true, param, resultCallback);

	}
	
	function fapplylecResult(data) {
		
		if(data.result == "SUCCESS") {
			alert("신청 완료 되었습니다.");
			
			fListLecture();
		} else {
			alert("신청 중 오류 발생.  " + data.resultMsg);
		}
		
	}
	
	
	function fn_canapplyCourse(lec_no) {
		var param = {
				lecno : lec_no
	    };		
	
		var resultCallback = function(data) {
			fcanapplylecResult(data);
		};
		
		callAjax("/dashboard/canapplylec.do", "post", "json", true, param, resultCallback);

	}
	
	function fcanapplylecResult(data) {
		
		if(data.result == "SUCCESS") {
			alert("신청 취소 되었습니다.");
			
			fListLecture();
		} else {
			alert("신청취소 중 오류 발생.  " + data.resultMsg);
		}
		
	}	
	
	
	
	
	
	//차트 뿌리러 감
	function goChart(loginID) {
		//alert("1");
		//alert(JSON.stringify(data));
		var param= {
				loginID : loginID
		
		}
	
		var resultCallback1 = function(data) {
	//	 alert("3");
	//	alert(JSON.stringify(data.lec_Name_List));
	//	alert(JSON.stringify(data.lec_Name_List)) 
		
		     fChart (data);
	    };
	
		alert("2");
		callAjax("/dashboard/goChart.do", "post", "json", true, param, resultCallback1);
	}
	
	
	// bar형 chart
	function fChart(data){
	
		//일단 간단한 값만
		var cntEngineer = data.cntEngineer;
		var cntCompany = data.cntCompany;
		var cntProject = data.cntProject;
		//var cntApplicant = ${cntApplicant};
		
		var minChart = new Chart($("#minChart"),{
			
			type : 'bar' ,
			data : {
				labels : ['가입된 엔지니어 수', '가입된 기업 수', '등록된 프로젝트 수', '일별 지원자 수'] ,
					datasets : [{
							label : '간이 통계' ,
							data : [cntEngineer, cntCompany, cntProject] ,
							borderColor: [
											'rgba(255, 99, 132, 1)' ,
											'rgba(255, 206, 86, 0.2)',
											'rgba(54, 162, 235, 0.2)'
										] ,
							borderWidth : 1
					}]
			}
		});
	}
		
		
		

</script>

</head>
<body>


<input type="hidden" id="currentPage" value="1">
<input type="hidden" id="selectedInfNo" value="">
	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
	               
					<div class="content" style="margin-bottom:20px;">
                       
						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">메인</span> <a href="../dashboard/dashboard.do"
								class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle" style="margin-bottom: 1%;">
							<span>공지 사항</span> <span class="fr"> 
								<span>로그인</span>
								<span>회원가입</span>
								<span>마이페이지</span>
								
							</span>
						</p>
						
						
				             <div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
									   <col width="5%">
										<col width="70%">
										<col width="10%">
										<col width="5%">
									</colgroup>
				
									<thead>
										<tr>
										    <th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성일</th>
											<th scope="col">작성자</th>
										</tr>
									</thead>
									<tbody id="listInf">
									</tbody>
								</table>
							</div>
										   
					   <div class="paging_area"  id="listInfPagination"> </div>
					   
					
					   <div class="selectProject" >
							<table width="100%" cellpadding="5" cellspacing="0" border="1"
		                        align="left" 
		                        style="border-collapse: collapse; border: 10px #50bcdf; ">
		                        <tr style="border: 10px; border-color: blue">

		                           <td width="40" height="25" style="font-size: 100%">지역&nbsp;</td><td><select id="areaall" name="areaall">	</select></td>          
		                           <td width="30" height="25" style="font-size: 100%"></td>
		                           <td width="40" height="25" style="font-size: 100%">직무&nbsp;</td><td><select id="joball" name="joball">	</select></td>          
		                           <td width="30" height="25" style="font-size: 100%"></td>
		                           <td width="40" height="25" style="font-size: 100%">산업&nbsp;</td><td><select id="industryall" name="industryall">	</select></td>          
		                            
		                           <td width="180" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>        
		                           <td width="100" height="60" style="font-size: 120%"></td> 
		                           <td width="20" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>        
		                        </tr>
		                     </table>    
						</div>
					   
					   
					   <!-- 과정 조회 -->
						<div class="selectLecture" id="selectLecture">
							<table width="100%" cellpadding="5" cellspacing="0" border="1"
		                        align="left" 
		                        style="border-collapse: collapse; border: 10px #50bcdf; ">
		                        <tr style="border: 10px; border-color: blue">
		                           <td width="20" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
		
		                           <td width="220" height="25" style="font-size: 150%; font-weight: bold;">과정 조회</td>
		                           <td width="40" height="25" style="font-size: 100%">강의명&nbsp;</td><td><input type="text" id="slec"  name="slec"  class="inputTxt p100" v-model="slec" /></td>       
		                           <td width="30" height="25" style="font-size: 100%"></td>
		                           <td width="40" height="25" style="font-size: 100%">교수명&nbsp;</td><td><input type="text" id="stea"  name="stea" class="inputTxt p100" v-model="stea" /> </td>         
                                   <td width="10" height="25" style="font-size: 100%"></td>
		                           <td width="100" height="60" style="font-size: 120%">
		                                 <a href="" class="btnType blue" id="registlecBtn" name="btn"><span>등  록</span></a></td> 
		                           <td width="5" height="25" style="font-size: 100%"></td>
		                           <td width="100" height="60" style="font-size: 120%">
		                                 <a href="" class="btnType blue" id="searchlecBtn" name="btn"><span>검  색</span></a></td>         
		                        </tr>
		                     </table>    
						</div>

	                    <div id="divListLecture">
							<div class="bootstrap-table">
								<div class="fixed-table-toolbar">
									<div class="bs-bars pull-left"></div>
									<div class="columns columns-right btn-group pull-right">	</div>
								</div>
								<div class="fixed-table-container" style="padding-bottom: 0px;">
									<div class="fixed-table-body">
										<table class="col">
											<caption>caption</caption>
											<colgroup>
												<col width="30%">
												<col width="10%">
												<col width="10%">
												<col width="20%">
												<col width="10%">
												<col width="10%">
												<col width="10%">
											</colgroup>
				
											<thead>
												<tr>
													<th scope="col">강의명</th>
													<th scope="col">강의실</th>
													<th scope="col">교수명</th>
													<th scope="col">기간</th>
													<th scope="col">수강인원</th>
													<th scope="col">신청인원</th>
													<th scope="col">과정신청</th>
												</tr>
											</thead>
																			
											<tbody v-for="(row, index) in items" v-if="items.length">								    
											      <tr>					
												    <td @click="rowClicked(row.lec_no,row.std_cnt)">{{ row.lec_name }}</td>
												    <td>{{ row.room_name }}</td>
												    <td>{{ row.name }}</td>
												    <td>{{ row.lec_start }}~{{ row.lec_end }}</td>
												    <td>{{ row.lec_cnt }}</td>
												    <td>{{ row.std_cnt }}</td>
												    <td>
													    <div v-if="row.usertype == 'H'  && row.lst_yn == 0"   class="btnType blue" @click="applyClicked(row.lec_no)">
														   <span>신청</span>
														</div>
														<div v-if="row.usertype == 'H'  && row.lst_yn == 1"   class="btnType blue" @click="canapplyClicked(row.lec_no)">
														    <span>신청취소</span>
														</div>
												    </td>
												  </tr>  							
											</tbody>
										</table>
										<div>
											<div>
												<div class="clearfix" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="paging_area"  id="listLecturePagination"> </div>
												 
					</div> <!--// content -->

					</li>
			</ul>
		</div>
	</div>
					

				
				
		
	<!-- 모달팝업 -->
	<div id="notice" class="layerPop layerType2" style="width: 600px;">
		<input type="hidden" id="noticeNo" name="noticeNo" value="${noticeNo}"> <!-- 수정시 필요한 num 값을 넘김  -->
		
		<dl>
			<dt>
				<strong>공지사항</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<th scope="row">작성자 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="loginId" id="loginId" /></td>
							<!-- <th scope="row">작성일<span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="write_date" id="write_date" /></td> -->
						</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="noticeTitle" id="noticeTitle" /></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="3">
								<textarea class="inputTxt p100" name="noticeContent" id="noticeContent">
								</textarea>
							</td>
						</tr>
						
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>닫기</span></a>
				</div>
			</dd>

		</dl>
	</div>

	<!-- 과정 모달팝업 -->
	<form id="myForm">
		<div id="lecinfo" class="layerPosition layerPop layerType2"  style="width: 900px;">
				<input type="hidden" id="lecno" name="lecno" > <!-- 수정시 필요한 num 값을 넘김  -->
				<input type="hidden" id="action" name="action" > <!-- 수정시 필요한 num 값을 넘김  -->
				<dl>
					<dt>
						<strong>강의 관리</strong>
					</dt>
					<dd class="content">
						<!-- s : 여기에 내용입력 -->
						<table class="row" >
							<caption>caption</caption>
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
		
							<tbody>
								<tr>
									<th scope="row">제목<span class="font_red">*</span></th>
									<td colspan="3"><input type="text" class="inputTxt p100" v-model="title" name="title" id="title" /></td>
								</tr>
								
								<tr>
									<th scope="row">강사명 <span class="font_red">*</span></th>
									<td width="30%"> <select v-model="teacher" name="teacher" id="teacher" > </select> </td>
									<th scope="row">강의실 </th>
									<td width="30%"> <select v-model="room" name="room" id="room"> </select></td>							
								</tr>
								<tr>
									<th scope="row">시작일자<span class="font_red">*</span></th>
									<td width="30%">
									     <input type="text" class="inputTxt p100" data-date-format='yy.mm.dd' v-model="startdate" name="startdate" id="startdate" />
									</td>
									<th scope="row">종료일자 <span class="font_red">*</span></th>
									<td width="30%">
									     <input type="text" class="inputTxt p100" data-date-format='yy.mm.dd' v-model="enddate" name="enddate" id="enddate" />
									</td>							
								</tr>
								<tr>
									<th scope="row">강의계획서<span class="font_red">*</span></th>
									<td colsapn='3'>
									     <input type="file"  name="uploadfile" id="uploadfile" />
									     <div id="filediv"></div>
									</td>					
								</tr>
							</tbody>
						</table>
		
						<!-- e : 여기에 내용입력 -->
		
						<div class="btn_areaC mt30">
							<a href=""  class="btnType blue" id="btnSaveCourse" name="btn"><span>저장</span></a> 
							<a href=""  class="btnType blue" id="btnDeleteCourse" name="btn"><span>삭제</span></a> 
							<a href="" class="btnType gray"  id="btnCloseCourse" name="btn"><span>취소</span></a>
						</div>
					</dd>
				</dl>
		</div>
    </form>
</body>
</html>