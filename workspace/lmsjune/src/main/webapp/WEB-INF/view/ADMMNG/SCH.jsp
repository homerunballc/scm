<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>수강관리</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">

	// 강의목록 페이징 설정
	var pageSizeLec = 5;
	var pageBlockSizeLec = 5;
	
	// 문제목록 페이징 설정
	var pageSizeClass = 5;
	var pageBlockSizeClass = 10;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 강의목록 조회
		fListLec_no();
		// 수강목록 조회
		fListClass();
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSaveLec' :
					fSaveLec();
					break;
				case 'btnDeleteLec' :
					fDeleteLec();
					break;
				case 'btnSaveClass' :
					fSaveClass();
					break;
				case 'btnDeleteClass' :
					fDeleteClass();
					break;
				case 'btnSearchLec':
					board_search();
					break;
				case 'btnCloseLec' :
				case 'btnCloseClass' :
					gfCloseModal();
					break;
			}
		});
	}
	
	
	/** 강의 폼 초기화 */
	function fInitFormLec(object) {
		$("#lec_no").focus();
		if( object == "" || object == null || object == undefined) {
			
			$("#lec_no").val("");
			$("#lec_name").val("");
			$("#room_no").val("");
			$("#teach_no").val("");
			$("#lec_cnt").val("");
			$("#lec_start").val("");
			$("#lec_end").val("");
			$("#lec_goal").val("");
			$("#lec_plan").val("");
			$("#lec_test_no").val("");
			$("#lec_no").attr("readonly", false);
			$("#lec_no").css("background", "#FFFFFF");
			$("#lec_no").focus();
			$("#btnDeleteLec").hide();
			
		} else {
			
			$("#lec_no").val(object.lec_no);
			$("#lec_name").val(object.lec_name);
			$("#room_no").val(object.room_no);
			$("#teach_no").val(object.teach_no);
			$("#lec_cnt").val(object.lec_cnt);
			$("#lec_start").val(object.lec_start);
			$("#lec_end").val(object.lec_end);
			$("#lec_goal").val(object.lec_goal);
			$("#lec_plan").val(object.lec_plan);
			$("#lec_test_no").val(object.test_no);
			$("#lec_no").attr("readonly", true);
			$("#lec_no").css("background", "#F5F5F5");
			$("#lec_name").focus();
			
			
			
			if(object.lec_no>0){
				$("#btnDeleteLec").hide();
			}else{
				$("#btnDeleteLec").show();	
			}
		}
	}
	
	// 검색기능
	function board_search(currentPage) {
        
        var sname = $('#sname');
        var searchKey = document.getElementById("searchKey");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		
		currentPage = currentPage || 1;
		
		console.log("currentPage : " + currentPage);     
		
        var param = {
        		
        		  from : 2
        	  ,	  sname : sname.val()
        	  ,	  oname : oname
              ,   currentPage : currentPage
              ,   pageSize : pageSizeLec
        }
        //swal(JSON.stringify(param));
        var resultCallback = function(data) {
        	flistLec_noResult(data, currentPage); 
        };
        
        callAjax("/ADMMNG/listLec.do", "post", "text", true, param, resultCallback);
        
  } 

	
	/** 수강 폼 초기화 */
	function fInitFormClass(object) {

		var class_no = $("#tmpclass_no").val();
		
		if( object == "" || object == null || object == undefined) {
			
			$("#class_no").val(class_no);
			$("#lec_no").val("");
			$("#stu_no").val("");
			$("#class_ox").val("");
			$("#class_cnt").val("");
			$("#class_pass").val("");
						
			$("#class_no").attr("readonly", true);
			$("#class_no").css("background", "#F5F5F5");
			$("#btnDeleteProb").hide();
			$("#lec_no").focus();
			
		} else {

			$("#class_no").val(object.class_no);
			$("#lec_no").val(object.lec_no);
			$("#stu_no").val(object.stu_no);
			$("#class_ox").val(object.class_ox);
			$("#class_cnt").val(object.class_cnt);
			$("#class_pass").val(object.class_pass);
						
			$("#class_no").attr("readonly", true);
			$("#class_no").css("background", "#F5F5F5");
			$("#btnDeleteProb").hide();
			$("#lec_no").focus();
		}
	}
	
	
	/** 강의 저장 validation */
	function fValidateLec() {

		var chk = checkNotEmpty(
				[
						[ "lec_no", "강의번호를 입력해 주세요." ]
					,	[ "lec_test_no", "시험번호를 입력해 주세요" ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	/** 수강 저장 validation */
	function fValidateClass() {

		var chk = checkNotEmpty(
				[
						[ "lec_no", "강의번호를 입력해 주세요." ]
					,	[ "stu_no", "학번을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	/** 강의 모달 실행 */
	function fPopModalLec(lec_no) {
		
		// 신규 저장
		if (lec_no == null || lec_no=="") {
			//swal("여기도 찍어봅세  ");
			// Tranjection type 설정
			$("#action").val("I");
			
			// 강의 폼 초기화
			fInitFormLec();
			
			// 모달 팝업
			gfModalPop("#layer1");

		// 수정 저장
		} else {
			// Tranjection type 설정
			$("#action").val("U");
			
			// 강의 단건 조회
			fSelectLec(lec_no);
		}
	}
	
	
	/** 강의목록 조회 */
	function fListLec_no(currentPage) {
		
		currentPage = currentPage || 1;
		
		//var sname = $('#sname');
        //var searchKey = document.getElementById("searchKey");
		//var oname = searchKey.options[searchKey.selectedIndex].value;
		var sname = $('#sname').val();
		var oname = $('#searchKey').val();
		
		
		
		console.log("currentPage : " + currentPage);
		
		var param = {
				
					from : 2
	        	,	sname : sname
				,	oname : oname
				,	currentPage : currentPage
				,	pageSize : pageSizeLec
		}
		
		var resultCallback = function(data) {
			flistLec_noResult(data, currentPage);
		};
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/ADMMNG/listLec.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 강의목록 조회 콜백 함수 */
	function flistLec_noResult(data, currentPage) {
		
		//swal(data);
		console.log(data);
		
		// 기존 목록 삭제
		$('#listLec').empty();
		
		// 신규 목록 생성
		$("#listLec").append(data);
		
		// 총 개수 추출
		
		var totalCntLectureInfo = $("#totalCntLectureInfo").val();
		
		
		//swal(totalCntLectureInfo);
		
		// 페이지 네비게이션 생성
		
		var paginationHtml = getPaginationHtml(currentPage, totalCntLectureInfo, pageSizeLec, pageBlockSizeLec, 'fListLec_no');
		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		$("#LecPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageLec").val(currentPage);
	}
	
	
	/** 강의 단건 조회 */
	function fSelectLec(lec_no) {
		
		var param = { lec_no : lec_no };
		
		var resultCallback = function(data) {
			fSelectLecResult(data);
		};
		
		callAjax("/ADMMNG/selectLec.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 강의 단건 조회 콜백 함수*/
	function fSelectLecResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer1");
			
			// 강의 폼 데이터 설정
			fInitFormLec(data.LecModel);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	
	/** 강의 저장 */
	function fSaveLec() {

		// vaildation 체크
		if ( ! fValidateLec() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveLecResult(data);
		};
		
		callAjax("/ADMMNG/saveLec.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 강의 저장 콜백 함수 */
	function fSaveLecResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageLec").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			fListLec_no(currentPage);
			
		} else {
			// 오류 응답 메시지 출력
			swal(data.resultMsg);
		}
		
		// 입력폼 초기화
		fInitFormLec();
	}

	
	/** 강의 삭제 */
	function fDeleteLec() {
		
		swal("정말 삭제하겠습니까? \n삭제시 복구불가합니다.", {
			  buttons:{
				  yes : "예",
				  no : "아니오"
			  }
			}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
				switch(value){
				case "yes":
					
					var resultCallback = function(data) {
					fDeleteLecResult(data);
					};
				
					callAjax("/ADMMNG/deleteLec.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
				
					break;
				case "no": 
					break;
				}
			});
		
		
	}
	
	
	/** 강의 삭제 콜백 함수 */
	function fDeleteLecResult(data) {
		
		var currentPage = $("#currentPageLec").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 강의 목록 조회
			fListLec_no(currentPage);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	
	/** 수강 모달 실행 */
	function fPopModalClass(class_no) {
		
		// 신규 저장
		if (test_no == null || test_no=="") {
			/**
			if ($("#tmplec_no").val() == "") {
				swal("강의번호를 선택해 주세요.");
				return;
			}
			 */	
			// Tranjection type 설정
			$("#action").val("I");
			
			// 수강 폼 초기화
			fInitFormClass();
			
			// 모달 팝업
			gfModalPop("#layer2");

		// 수정 저장
		} else {
			
			// Tranjection type 설정
			$("#action").val("U");
			
			// 수강 단건 조회
			fSelectClass(test_no, que_no);
		}
	}
	
	
	/** 수강 목록 조회 */
	function fListClass(currentPage, sname, oname) {
		
		
		currentPage = currentPage || 1;
		sname = sname || "";
		oname = oname || "";
		console.log("fListClass : " + currentPage, sname, oname);
		// 목록 정보 설정
		$("#tmp_sname").val(sname);
		$("#tmp_oname").val(oname);
		
		var param = {
				 	sname : sname
	        	,  	oname : oname
				,	currentPage : currentPage
				,	pageSize : pageSizeClass
		}
		
		var resultCallback = function(data) {
			fListClassResult(data, currentPage);
		};
		
		callAjax("/ADMMNG/listClass.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 수강목록 조회 콜백 함수 */
	function fListClassResult(data, currentPage) {
		
		console.log("fListClassResult : " + data);
		
		// 기존 목록 삭제
		$('#listClass').empty(); 
		$("#listClass").append(data);
		
		// 총 개수 추출
		var totalCntClass = $("#totalCntClassInfo").val();
		
		// 페이지 네비게이션 생성
		var sname = $("#tmp_sname").val();
		var oname =$("#tmp_oname").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntClass, pageSizeClass, pageBlockSizeClass, 'fListClass');
		
		console.log("paginationHtml : " + paginationHtml);
		
		$("#ClassPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageClassInfo").val(currentPage);
	}
	
	
	/** 수강 단건 조회 */
	function fSelectClass(class_no) {
		
		var param = {
					class_no : class_no
		};
		
		var resultCallback = function(data) {
			fSelectClassResult(data);
		};
		
		callAjax("/ADMMNG/selectClass.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 수강 단건 조회 콜백 함수*/
	function fSelectClassResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer2");
			
			// 문제 폼 데이터 설정
			fInitFormClass(data.ClassModel);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	
	/** 수강 저장 */
	function fSaveClass() {

		// vaildation 체크
		if ( ! fValidateClass() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveClassResult(data);
		};
		
		callAjax("/ADMMNG/saveClass.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 수강 저장 콜백 함수 */
	function fSaveClassResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageClass").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 수강목록 조회
			var sname = $("#tmp_sname").val();
			var oname = $("#tmp_oname").val();
			fListClass(currentPage, sname, oname);
			
		} else {
			// 오류 응답 메시지 출력
			swal(data.resultMsg);
		}
		
		// 입력폼 초기화
		fInitFormClass();
	}
	
	
	/** 수강 삭제 */
	function fDeleteClass() {
		
		var resultCallback = function(data) {
			fDeleteClassResult(data);
		};
		
		callAjax("/ADMMNG/deleteClass.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 수강 삭제 콜백 함수 */
	function fDeleteClassResult(data) {
		
		var currentPage = $("#currentPageClass").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 수강 목록 조회
			var sname = $("#tmp_sname").val();
			var oname = $("#tmp_oname").val();
			fListClass(currentPage, sname, oname);
			
		} else {
			swal(data.resultMsg);
		}	
	}
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageLec" value="1">
	<input type="hidden" id="currentPageClass" value="1">
	<input type="hidden" id="tmp_lec_no" value="">
	<input type="hidden" id="tmp_sname" value="">
	<input type="hidden" id="tmp_oname" value="">
	<input type="hidden" id="tmp_class_no" value="">
	<input type="hidden" name="action" id="action" value="">
	
	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

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
					<div class="content">

						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
							 <span class="btn_nav bold">학습관리</span> 
							 <span class="btn_nav bold">강의목록
						</span> <a href="../ADMMNG/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>강의목록</span> <span class="fr"> <a
								class="btnType blue" href="javascript:fPopModalLec();" name="modal"><span>신규강의</span></a>
							</span>
						</p>
						
						<div class="divLecList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="20%">
									<col width="10%">
									<col width="10%">
									<col width="13%">
									<col width="13%">
									<col width="9%">
									<col width="10%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">강의명</th>
										<th scope="col">강의번호</th>
										<th scope="col">강사이름</th>
										<th scope="col">개강일</th>
										<th scope="col">종강일</th>
										<th scope="col">시험번호</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="listLec"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="LecPagination"> </div>
						
						
						
						<table style="margin-top: 10px" width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="80" height="25" style="font-size: 120%;">&nbsp;&nbsp;</td>
                           <td width="50" height="25" style="font-size: 100%; text-align:left; padding-right:25px;">
								<select id="searchKey" name="searchKey" style="width: 150px;" v-model="searchKey">
									<option value="lec_no" >강의번호</option>
									<option value="lec_name" >강의명</option>
									<option value="teach_no" >교수번호</option>
									<option value="name" >강사이름</option>
								</select> 
							
     	                       <input type="text" style="width: 300px; height: 25px;" id="sname" name="sname">                    
	                           <a href="" class="btnType blue" id="btnSearchLec" name="btn"><span>검  색</span></a>
                           </td> 
                           
                        </tr>
                     </table> 
                     
						<p class="conTitle mt50">
							<span>수강 목록</span> <span class="fr"> <a
								class="btnType blue"  href="javascript:fPopModalClass();" name="modal"><span>수강입력</span></a>
							</span>
						</p>
	
						<div class="divClassList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="4%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="6%">
									<col width="6%">
									<col width="9%">
									<col width="9%">
									<col width="9%">
									<col width="3%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">수강<br>번호</th>
										<th scope="col">강의<br>번호</th>
										<th scope="col">학번</th>
										<th scope="col">수강생<br>이름</th>
										<th scope="col">소속</th>
										<th scope="col">강의명</th>
										<th scope="col">개강일</th>
										<th scope="col">종강일</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="listClass">
									<tr>
										<td colspan="8">강의를 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="ClassPagination"> </div>

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 1000px;">
		<dl>
			<dt>
				<strong>강의 관리</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="col">
					<caption>caption</caption>
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="15%">
						<col width="15%">
						<col width="20%">
						<col width="20%">
						<col width="5%">
					</colgroup>
					<thead>
						<tr>
						<th scope="col">강의번호</th>
						<th scope="col">강의명</th>
						<th scope="col">강의실번호</th>
						<th scope="col">강사번호</th>
						<th scope="col">수강인원</th>
						<th scope="col">개강일</th>
						<th scope="col">종강일</th>
						<th scope="col">학습목표</th>
						<th scope="col">학습계획</th>
						<th scope="col">시험번호</th>
						</tr>
					</thead>
					<tbody>
					<tr>
						<td><input type="text" class="inputTxt p100" name="lec_no" id="lec_no"/></td>
						<td><input type="text" class="inputTxt p100" name="lec_name" id="lec_name"/></td>
						<td><input type="text" class="inputTxt p100" name="room_no" id="room_no"/></td>
						<td><input type="text" class="inputTxt p100" name="teach_no" id="teach_no"/></td>
						<td><input type="text" class="inputTxt p100" name="lec_cnt" id="lec_cnt"/></td>
						<td><input type="text" class="inputTxt p100" name="lec_start" id="lec_start"/></td>
						<td><input type="text" class="inputTxt p100" name="lec_end" id="lec_end"/></td>
						<td><input type="text" class="inputTxt p100" name="lec_goal" id="lec_goal" /></td>
						<td><input type="text" class="inputTxt p100" name="lec_plan" id="lec_plan"/></td>
						<td><input type="text" class="inputTxt p100" name="test_no" id="lec_test_no"/></td>
					</tr>	
					</tbody>	
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveLec" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnDeleteLec" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnCloseLec" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

	<div id="layer2" class="layerPop layerType2" style="width: 1000px;">
		<dl>
			<dt>
				<strong>수강 관리</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>	
						<col width="20%">					
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
						<thead>
							<tr>
							<th scope="col">수강번호</th>
							<th scope="col">강의번호</th>
							<th scope="col">학번</th>
							<th scope="col">응시여부</th>
							<th scope="col">정답수</th>
							<th scope="col">과락여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td><input type="text" class="inputTxt p100" name="class_no" id="class_no" /></td>
							<td><input type="text" class="inputTxt p100" name="lec_no" id="lec_no" /></td>
							<td><input type="text" class="inputTxt p100" name="stu_no" id="stu_no" /></td>
							<td><input type="text" class="inputTxt p100" name="class_ox" id="class_ox" /></td>
							<td><input type="text" class="inputTxt p100" name="class_cnt" id="class_cnt" /></td>
							<td><input type="text" class="inputTxt p100" name="class_pass" id="class_pass" /></td>
							</tr>
						</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveClass" name="btn"><span>저장</span></a>
					<a href="" class="btnType blue" id="btnDeleteClass" name="btn"><span>삭제</span></a>  
					<a href="" class="btnType gray" id="btnCloseClass" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>