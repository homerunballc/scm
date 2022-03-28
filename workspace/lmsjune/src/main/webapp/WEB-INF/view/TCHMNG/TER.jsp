<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>강의리스트 & 강의계획서</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

<script type="text/javascript">

	// 강의목록 페이징 설정
	var pageSizeLec_no = 5;
	var pageBlockSizeComnLec_no = 5;
	
	// 상세코드 페이징 설정
	var pageSizeComnDtlCod = 5;
	var pageBlockSizeComnDtlCod = 10;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 강의목록 조회
		fListLec_no();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'RegisterCom' :
					RegisterCom();
				case 'btnSaveGrpCod' :
					fSaveGrpCod();
					break;
				case 'btnDeleteGrpCod' :
					fDeleteGrpCod();
					break;
				case 'btnSaveDtlCod' :
					fSaveDtlCod();
					break;
				case 'btnDeleteDtlCod' :
					fDeleteDtlCod();
					break;
				case 'btnSearchGrpcod':
					board_search();
					break;
				case 'btnCloseGrpCod' :
				case 'btnCloseDtlCod' :
					gfCloseModal();
					break;
			}
		});
	}
	
	//강의등록
	function RegisterCom(data) {
	      
	      var resultCallback = function(data) {
	    	  console.log("RegisterCom : " + JSON.stringify(data));
	      }
	      
	     if(confirm("등록하시겠습니까?")){
	            
	         //callAjax("/TCH/addLecturePro.do","post","json",true,$("myForm").serialize(), resultCallback);
	         callAjax("/TCH/addLecturePro.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	      }else {
	            return;
	     }
   }
	   
	    //취소버튼
	   function ResetBtn() {
	       myForm.reset();
	    }
	
	
	/** 그룹코드 폼 초기화 */
	function fInitFormGrpCod(object) {
		$("#grp_cod").focus();
		if( object == "" || object == null || object == undefined) {
			
			$("#grp_cod").val("");
			$("#grp_cod_nm").val("");
			$("#grp_cod_eplti").val("");
			$("#grp_tmp_fld_01").val("");
			$("#grp_tmp_fld_02").val("");
			$("#grp_tmp_fld_03").val("");
			$("input:radio[name=grp_use_poa]:input[value='Y']").attr("checked", true);
			$("#grp_cod").attr("readonly", false);
			$("#grp_cod").css("background", "#FFFFFF");
			$("#grp_cod").focus();
			$("#btnDeleteGrpCod").hide();
			
		} else {
			
			$("#grp_cod").val(object.grp_cod);
			$("#grp_cod_nm").val(object.grp_cod_nm);
			$("#grp_cod_eplti").val(object.grp_cod_eplti);
			
			$("#grp_tmp_fld_01").val(object.tmp_fld_01);
			$("#grp_tmp_fld_02").val(object.tmp_fld_02);
			$("#grp_tmp_fld_03").val(object.tmp_fld_03);
			$("input:radio[name=grp_use_poa]:input[value="+object.use_poa+"]").attr("checked", true);
			$("#grp_cod").attr("readonly", true);
			$("#grp_cod").css("background", "#F5F5F5");
			$("#grp_cod_nm").focus();
			
			
			
			if(object.tmp_fld_01>0){
				$("#btnDeleteGrpCod").hide();
			}else{
				$("#btnDeleteGrpCod").show();	
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
        		  sname : sname.val()
        	  ,	  oname : oname
              ,   currentPage : currentPage
              ,   pageSize : pageSizeLec_no
        }
        //swal(JSON.stringify(param));
        var resultCallback = function(data) {
        	flistLec_noResult(data, currentPage); 
        };
        
        callAjax("/ADMMNG/listLec.do", "post", "text", true, param, resultCallback);
        
  } 

	
	/** 상세코드 폼 초기화 */
	function fInitFormDtlCod(object) {

		var grpCod = $("#tmpGrpCod").val();
		var grpCodNm = $("#tmpGrpCodNm").val();

		if( object == "" || object == null || object == undefined) {
			
			$("#dtl_grp_cod").val(grpCod);
			$("#dtl_grp_cod_nm").val(grpCodNm);
			$("#dtl_cod").val("");
			$("#dtl_cod_nm").val("");
			$("#dtl_odr").val("");
			$("#dtl_cod_eplti").val("");
			$("#dtl_tmp_fld_01").val("");
			$("#dtl_tmp_fld_02").val("");
			$("#dtl_tmp_fld_03").val("");
			$("#dtl_tmp_fld_04").val("");
			$("input:radio[name=dtl_use_poa]:input[value='Y']").attr("checked", true);
			
			$("#dtl_grp_cod").attr("readonly", true);
			$("#dtl_grp_cod").css("background", "#F5F5F5");
			$("#dtl_grp_cod_nm").attr("readonly", true);
			$("#dtl_grp_cod_nm").css("background", "#F5F5F5");
			$("#dtl_cod").attr("readonly", false);
			$("#dtl_cod").css("background", "#FFFFFF");
			$("#btnDeleteDtlCod").hide();
			$("#dtl_cod").focus();
			
		} else {

			$("#dtl_grp_cod").val(object.grp_cod);
			$("#dtl_grp_cod_nm").val(object.grp_cod_nm);
			$("#dtl_cod").val(object.dtl_cod);
			$("#dtl_cod_nm").val(object.dtl_cod_nm);
			$("#dtl_odr").val(object.odr);
			$("#dtl_cod_eplti").val(object.dtl_cod_eplti);
			$("#dtl_tmp_fld_01").val(object.tmp_fld_01);
			$("#dtl_tmp_fld_02").val(object.tmp_fld_02);
			$("#dtl_tmp_fld_03").val(object.tmp_fld_03);
			$("#dtl_tmp_fld_04").val(object.tmp_fld_04);
			$("input:radio[name=dtl_use_poa]:input[value='"+object.use_poa+"']").attr("checked", true);
			
			$("#dtl_grp_cod").attr("readonly", true);
			$("#dtl_grp_cod").css("background", "#F5F5F5");
			$("#dtl_grp_cod_nm").attr("readonly", true);
			$("#dtl_grp_cod_nm").css("background", "#F5F5F5");
			$("#dtl_cod").attr("readonly", true);
			$("#dtl_cod").css("background", "#F5F5F5");
			$("#btnDeleteDtlCod").show();
			$("#dtl_cod_nm").focus();
		}
	}
	
	
	/** 그룹코드 저장 validation */
	function fValidateGrpCod() {

		var chk = checkNotEmpty(
				[
						[ "grp_cod", "그룹 코드를 입력해 주세요." ]
					,	[ "grp_cod_nm", "그룹 코드 명을 입력해 주세요" ]
					,	[ "grp_cod_eplti", "그룹 코드 설명을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	/** 상세코드 저장 validation */
	function fValidateDtlCod() {

		var chk = checkNotEmpty(
				[
						[ "dtl_grp_cod", "그룹 코드를 선택해 주세요." ]
					,	[ "dtl_cod", "상세 코드를 입력해 주세요." ]
					,	[ "dtl_cod_nm", "상세 코드 명을 입력해 주세요" ]
					,	[ "dtl_cod_eplti", "상세 코드 설명을 입력해 주세요." ]
					,	[ "dtl_odr", "상세 코드 설명을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	/** 그룹코드 모달 실행 */
	function fPopModalComnGrpCod(grp_cod) {
		
		// 신규 저장
		if (grp_cod == null || grp_cod=="") {
			//swal("여기도 찍어봅세  ");
			// Tranjection type 설정
			$("#action").val("I");
			
			// 그룹코드 폼 초기화
			fInitFormGrpCod();
			
			// 모달 팝업
			gfModalPop("#layer1");

		// 수정 저장
		} else {
			// Tranjection type 설정
			$("#action").val("U");
			
			// 그룹코드 단건 조회
			fSelectGrpCod(grp_cod);
		}
	}
	
	
	/** 그룹코드 조회 */
	function fListLec_no(currentPage) {
		
		currentPage = currentPage || 1;
		
		//var sname = $('#sname');
        //var searchKey = document.getElementById("searchKey");
		//var oname = searchKey.options[searchKey.selectedIndex].value;
		var sname = $('#sname').val();
		var oname = $('#searchKey').val();
		
		
		
		console.log("currentPage : " + currentPage);
		
		var param = {	
					sname : sname
				,	oname : oname
				,	currentPage : currentPage
				,	pageSize : pageSizeLec_no
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
		$('#listComnGrpCod').empty();
		
		// 신규 목록 생성
		$("#listComnGrpCod").append(data);
		
		// 총 개수 추출
		
		var totalCntLectureInfo = $("#totalCntLectureInfo").val();
		
		
		//swal(totalCntLectureInfo);
		
		// 페이지 네비게이션 생성
		
		var paginationHtml = getPaginationHtml(currentPage, totalCntLectureInfo, pageSizeLec_no, pageBlockSizeComnLec_no, 'fListLec_no');
		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		$("#comnGrpCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnGrpCod").val(currentPage);
	}
	
	
	/** 그룹코드 단건 조회 */
	function fSelectGrpCod(grp_cod) {
		
		var param = { grp_cod : grp_cod };
		
		var resultCallback = function(data) {
			fSelectGrpCodResult(data);
		};
		
		callAjax("/system/selectComnGrpCod.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 그룹코드 단건 조회 콜백 함수*/
	function fSelectGrpCodResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer1");
			
			// 그룹코드 폼 데이터 설정
			fInitFormGrpCod(data.comnGrpCodModel);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	
	/** 그룹코드 저장 */
	function fSaveGrpCod() {

		// vaildation 체크
		if ( ! fValidateGrpCod() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveGrpCodResult(data);
		};
		
		callAjax("/system/saveComnGrpCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 그룹코드 저장 콜백 함수 */
	function fSaveGrpCodResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageComnGrpCod").val();
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
		fInitFormGrpCod();
	}

	
	/** 그룹코드 삭제 */
	function fDeleteGrpCod() {
		
		swal("정말 삭제하겠습니까? \n삭제시 복구불가합니다.", {
			  buttons:{
				  yes : "예",
				  no : "아니오"
			  }
			}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
				switch(value){
				case "yes":
					
					var resultCallback = function(data) {
					fDeleteGrpCodResult(data);
					};
				
					callAjax("/system/deleteComnGrpCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
				
					break;
				case "no": 
					break;
				}
			});
		
		
	}
	
	
	/** 그룹코드 삭제 콜백 함수 */
	function fDeleteGrpCodResult(data) {
		
		var currentPage = $("#currentPageComnGrpCod").val();
		
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
	
	
	/** 상세코드 모달 실행 */
	function fPopModalComnDtlCod(grp_cod, dtl_cod) {
		
		// 신규 저장
		if (dtl_cod == null || dtl_cod=="") {
		
			if ($("#tmpGrpCod").val() == "") {
				swal("그룹 코드를 선택해 주세요.");
				return;
			}
			
			// Tranjection type 설정
			$("#action").val("I");
			
			// 상세코드 폼 초기화
			fInitFormDtlCod();
			
			// 모달 팝업
			gfModalPop("#layer2");

		// 수정 저장
		} else {
			
			// Tranjection type 설정
			$("#action").val("U");
			
			// 상세코드 단건 조회
			fSelectDtlCod(grp_cod, dtl_cod);
		}
	}
	
	
	/** 상세코드 목록 조회 */
	function fListComnDtlCod(currentPage, grp_cod, grp_cod_nm) {
		
		currentPage = currentPage || 1;
		
		// 그룹코드 정보 설정
		$("#tmpGrpCod").val(grp_cod);
		$("#tmpGrpCodNm").val(grp_cod_nm);
		
		var param = {
					grp_cod : grp_cod
				,	currentPage : currentPage
				,	pageSize : pageSizeComnDtlCod
		}
		
		var resultCallback = function(data) {
			flistDtlCodResult(data, currentPage);
		};
		
		callAjax("/system/listComnDtlCod.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 상세코드 조회 콜백 함수 */
	function flistDtlCodResult(data, currentPage) {
		
		// 기존 목록 삭제
		$('#listComnDtlCod').empty(); 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listComnDtlCod = $data.find("#listComnDtlCod");		
		$("#listComnDtlCod").append($listComnDtlCod.children());
		
		// 총 개수 추출
		var $totalCntComnDtlCod = $data.find("#totalCntComnDtlCod");
		var totalCntComnDtlCod = $totalCntComnDtlCod.text(); 
		
	
		
		// 페이지 네비게이션 생성
		var grp_cod = $("#tmpGrpCod").val();
		var grp_cod_nm = $("#tmpGrpCodNm").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntComnDtlCod, pageSizeComnDtlCod, pageBlockSizeComnDtlCod, 'fListComnDtlCod', [grp_cod]);
		$("#comnDtlCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnDtlCod").val(currentPage);
	}
	
	
	/** 상세코드 단건 조회 */
	function fSelectDtlCod(grp_cod, dtl_cod) {

		var param = {
					grp_cod : grp_cod
				,	dtl_cod : dtl_cod
		};
		
		var resultCallback = function(data) {
			fSelectDtlCodResult(data);
		};
		
		callAjax("/system/selectComnDtlCod.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 상세코드 단건 조회 콜백 함수*/
	function fSelectDtlCodResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer2");
			
			// 그룹코드 폼 데이터 설정
			fInitFormDtlCod(data.comnDtlCodModel);
			
		} else {
			swal(data.resultMsg);
		}	
	}
	
	
	/** 상세코드 저장 */
	function fSaveDtlCod() {

		// vaildation 체크
		if ( ! fValidateDtlCod() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveDtlCodResult(data);
		};
		
		callAjax("/system/saveComnDtlCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 상세코드 저장 콜백 함수 */
	function fSaveDtlCodResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageComnDtlCod").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			var grp_cod = $("#tmpGrpCod").val();
			var grp_cod_nm = $("#tmpGrpCodNm").val();
			fListComnDtlCod(currentPage, grp_cod, grp_cod_nm);
			
		} else {
			// 오류 응답 메시지 출력
			swal(data.resultMsg);
		}
		
		// 입력폼 초기화
		fInitFormDtlCod();
	}
	
	
	/** 상세코드 삭제 */
	function fDeleteDtlCod() {
		
		var resultCallback = function(data) {
			fDeleteDtlCodResult(data);
		};
		
		callAjax("/system/deleteComnDtlCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 상세코드 삭제 콜백 함수 */
	function fDeleteDtlCodResult(data) {
		
		var currentPage = $("#currentPageComnDtlCod").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			swal(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 그룹코드 목록 조회
			var grp_cod = $("#tmpGrpCod").val();
			var grp_cod_nm = $("#tmpGrpCodNm").val();
			fListComnDtlCod(currentPage, grp_cod, grp_cod_nm);
			
		} else {
			swal(data.resultMsg);
		}	
	}
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageComnGrpCod" value="1">
	<input type="hidden" id="currentPageComnDtlCod" value="1">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
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
						</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>강의목록</span>
						</p>
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="20%">
									<col width="15%">
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">강의명</th>
										<th scope="col">강의번호</th>
										<th scope="col">수강인원</th>
										<th scope="col">개강일</th>
										<th scope="col">종강일</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="listComnGrpCod"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="comnGrpCodPagination"> </div>
						
						
						
						<table style="margin-top: 10px" width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="80" height="25" style="font-size: 120%;">&nbsp;&nbsp;</td>
                           <td width="50" height="25" style="font-size: 100%; text-align:left; padding-right:25px;">
     	                      <select id="searchKey" name="searchKey" style="width: 150px;">
									<option value="lec_no" >강의번호</option>
									<option value="lec_name" >강의명</option>
							</select> 
							
     	                       <input type="text" style="width: 300px; height: 25px;" id="sname" name="sname">                    
	                           <a href="" class="btnType blue" id="btnSearchGrpcod" name="btn"><span>검  색</span></a>
                           </td> 
                           
                        </tr>
                     </table> 
                     
						<p class="conTitle mt50">
							<span>시험결과</span> 
						</p>
	
					

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!--// 모달팝업 -->
</form>
</body>
</html>