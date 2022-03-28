<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 세션에 등록된 유저타입이 'A'가 아니면  /dashboard/dashboard.do"링크로 이동됨, ne (!=) -->
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

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

		// 강의실관리 목록 페이징 설정
        var pageSizeRoom  = 5					// 화면에 나오는 데이터 수
        var pageBlockSizeRoom  = 5;				// 블럭으로 잡히는 페이지 수
        
        // ready 이벤트 : 페이지 실행 시 DOM(Document Object Model)이 load된 후에 즉시 실행 
        $(document).ready(function() {
        	
        	// 강의실 조회
        	fListRoom();
        	// 버튼 이벤트 등록
    		fRegisterButtonClickEvent();
        	
        }); 

        /** 버튼 이벤트 등록 */
    	function fRegisterButtonClickEvent() {
    		$('a[name=btn]').click(function(e) {
    			e.preventDefault();

    			var btnId = $(this).attr('id');

    			switch (btnId) {
    				case 'btnSaveRMG' :
    					fSaveRMG();
    					break;
    				case 'btnDeleteRMG' :
    					fDeleteRMG();
    					break;
    				case 'btnSearchRMG':
    					board_search();
    					break;
    				case 'btnCloseRMG' :
    					gfCloseModal();
    					break;
    			}
    		});
    	}
        
    	/** 강의실관리 폼 초기화 */
    	function fInitFormRMG(object) {
    		// $("대상 선택").focus();  :  대상 요소(아이디가 room_no인)로 포커스가 이동하면 이벤트 발생
    		//								텍스트 창일때 커서를 그 곳으로 위치시킨다.
    		$("#room_no").focus();
    		if( object == "" || object == null || object == undefined) {
    			
    			// .val() : 양식(form)의 값을 가져오거나 값을 설정하는 메소드
    			// $("#room_no").val("");   : id가 room_no인 값을 ""(빈 값)로 설정 
    			// .attr() : 선택한 요소의 속성값을 가져오거나 속성을 추가
    			// $("#room_no").attr("readonly", false); :  id가 room_no인 곳에 읽기만 가능한 것을 수정도 가능하게 해준다.
    			// .css() : 선택한 요소의 css 속성값을 가져오거나 style 속성을 추가
    			// $("#room_no").css("background", "#FFFFFF"); : id가 room_no인 곳에 배경색을 #FFFFFF색으로 변경
    			$("#room_no").val("");
    			$("#room_name").val("");
    			$("#room_addr").val("");
    			$("#room_no").attr("readonly", false);
    			$("#room_no").css("background", "#FFFFFF");
    			$("#room_no").focus();
    			$("#btnDeleteRMG").hide();
    			
    		} else {
    			
    			$("#room_no").val(object.room_no);
    			$("#room_name").val(object.room_name);
    			$("#room_addr").val(object.room_addr);
    			
    			$("#room_no").attr("readonly", true);
    			$("#room_no").css("background", "#F5F5F5");
    			$("#room_name").focus();
    			
    			
    			
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
                  ,   pageSize : pageSizeRoom
            }
            //swal(JSON.stringify(param));
            var resultCallback = function(data) {
            	fListRoomResult(data, currentPage); 
            };
            
            callAjax("/ADMRSC/roomInfo.do", "post", "text", true, param, resultCallback);
            
      } 
        
    	// 강의실관리 저장 validation(확인)
    	function fValidateRMG() {

    		var chk = checkNotEmpty(
    				[
    						[ "room_no", "강의실번호를 입력해 주세요." ]
    					,	[ "room_addr", "그룹 코드 설명을 입력해 주세요." ]
    					,	[ "room_name", "그룹 코드 명을 입력해 주세요" ]
    				]
    		);

    		if (!chk) {
    			return;
    		}

    		return true;
    	}
    	
    	// 강의실관리 모달 실행
		function fPopModalRoom(room_no) {
			
			// 신규 저장
			if (room_no == null || room_no=="") {
				//swal("여기도 찍어봅세  ");
				// Tranjection type 설정
				$("#action").val("I");
				
				// 그룹코드 폼 초기화
				fInitFormRMG();
				
				// 모달 팝업
				gfModalPop("#layer1");

			// 수정 저장
			} else {
				// Tranjection type 설정
				$("#action").val("U");
				
				// 그룹코드 단건 조회
				fSelectRMG(room_no);
			}
		}
    	
        // 강의실 조회 
		function fListRoom(currentPage) {
			
			currentPage = currentPage || 1;
			
			var sname = $('#sname').val();
			var oname = $('#searchKey').val();
			
			console.log("currentPage : " + currentPage);
			
			var param = {
						sname : sname
					,	oname : oname
					,	currentPage : currentPage
					,	pageSize : pageSizeRoom
			}
			
			var resultCallback = function(data) {
				fListRoomResult(data, currentPage);
			};
			
			//Ajax실행 방식
			//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
			//html로 받을거라 text
			callAjax("/ADMRSC/roomInfo.do", "post", "text", true, param, resultCallback);
		}
        
        // 강의실 조회 콜백 함수
		function fListRoomResult(data, currentPage) {
					//alert(data);
			console.log("fListRoomResult : " + data);		
			
			// 기존 목록 삭제
			$('#listRoom').empty();
			// 신규 목록 생성
			$("#listRoom").append(data);
			
			// 총 개수 추출
			var totalCntRMG = $("#totalCntRMG").val();
			
			// 페이지 네비게이션 생성
			var paginationHtml = getPaginationHtml(currentPage, totalCntRMG, pageSizeRoom, pageBlockSizeRoom, 'fListRoom');
			console.log("paginationHtml : " + paginationHtml);
			//swal(paginationHtml);
			$("#roomPagination").empty().append( paginationHtml );
			
			// 현재 페이지 설정
			$("#currentPageRMG").val(currentPage);
		
		}
        
		// 강의실목록 단건 조회  수정중
		function fSelectRMG(room_no) {
			
			var param = { room_no : room_no };
			
			var resultCallback = function(data) {
				fSelectRMGResult(data);
			};
			
			callAjax("/ADMRSC/selectRMG.do", "post", "json", true, param, resultCallback);
		}
		
		
		// 강의실목록 단건 조회 콜백 함수
		function fSelectRMGResult(data) {

			if (data.result == "SUCCESS") {

				// 모달 팝업
				gfModalPop("#layer1");
				
				// 그룹코드 폼 데이터 설정
				fInitFormRMG(data.roomInfo);
				
			} else {
				swal(data.resultMsg);
			}	
		}
		
		
		// 강의실 추가 
		function fSaveRMG() {

			// vaildation 체크
			if ( ! fValidateRMG() ) {
				return;
			}
			
			var resultCallback = function(data) {
				fSaveRMGResult(data);
			};
			
			callAjax("/ADMRSC/saveRMG.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
		}
		
		
		// 강의실 추가 콜백 함수
		function fSaveRMGResult(data) {
			
			// 목록 조회 페이지 번호
			var currentPage = "1";
			if ($("#action").val() != "I") {
				currentPage = $("#currentPageRMG").val();
			}
			
			if (data.result == "SUCCESS") {
				
				// 응답 메시지 출력
				swal(data.resultMsg);
				
				// 모달 닫기
				gfCloseModal();
				
				// 목록 조회
				fListRoom(currentPage);
				
			} else {
				// 오류 응답 메시지 출력
				swal(data.resultMsg);
			}
			
			// 입력폼 초기화
			fInitFormRMG();
		}

		
		// 강의실 삭제
		function fDeleteRMG() {
			
			swal("정말 삭제하겠습니까? \n삭제시 복구불가합니다.", {
				  buttons:{
					  yes : "예",
					  no : "아니오"
				  }
				}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
					switch(value){
					case "yes":
						
						var resultCallback = function(data) {
						fDeleteRMGResult(data);
						};
					
						callAjax("/ADMRSC/deleteRMG.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
					
						break;
					case "no": 
						break;
					}
				});
			
			
		}
		
		
		// 강의실 삭제 콜백 함수 
		function fDeleteRMGResult(data) {
			
			var currentPage = $("#currentPageRMG").val();
			
			if (data.result == "SUCCESS") {
				
				// 응답 메시지 출력
				swal(data.resultMsg);
				
				// 모달 닫기
				gfCloseModal();
				
				// 그룹코드 목록 조회
				fListRoom(currentPage);
				
			} else {
				swal(data.resultMsg);
			}	
		}
        
        
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageRMG" value="1">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" name="action" id="action" value="">

	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> 
					<jsp:include	page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> 
					<!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
	               
					<div class="content" style="margin-bottom:20px;">
                       
						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
							<span class="btn_nav bold">물품관리</span> 
							<span class="btn_nav bold">강의실관리</span> 
							<a href="../ADMRSC/RMG.do" class="btn_set refresh">새로고침</a>
						</p>
						<!-- 컨텐츠 타이틀 -->
						<p class="conTitle" style="margin-bottom: 1%;">
							<span>강의실관리</span>
							 <span class="fr"> 
							 	<a class="btnType blue" href="javascript:fPopModalRoom();" name="modal"><span>강의실 추가</span></a>
							</span> 
						</p>
						
						<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
									   <col width="20%">
										<col width="60%">
										<col width="20%">
									</colgroup>
				
									<thead>
										<tr>
										    <th scope="col">강의실번호</th>
											<th scope="col">강의실이름</th>
											<th scope="col">강의실주소</th>
										</tr>
									</thead>
									<tbody id="listRoom">
									</tbody>
								</table>
							</div>
							
						<div class="paging_area"  id="roomPagination"> </div>
		          		
		          		<table style="margin-top: 10px" width="100%" cellpadding="5" cellspacing="0" border="1"
                        		align="left" style="collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="80" height="25" style="font-size: 120%;">&nbsp;&nbsp;</td>
                           <td width="50" height="25" style="font-size: 100%; text-align:left; padding-right:25px;">
     	                      <select id="searchKey" name="searchKey" style="width: 150px;" v-model="searchKey">
									<option value="room_name" >강의실이름</option>
									<option value="room_addr" >강의실주소</option>
							</select> 
							
     	                       <input type="text" style="width: 300px; height: 25px;" id="sname" name="sname">                    
	                           <a href="" class="btnType blue" id="btnSearchRMG" name="btn"><span>검  색</span></a>
                           </td> 
                           
                        </tr>
                     </table> 
                     
		          	</div>	<!--// content -->
				</li>
	    	</ul>
	    </div>
    </div>				
	
	<!-- 모달팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>강의실 관리</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">강의실번호 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="room_no" id="room_no" /></td>
							<th scope="row">강의실주소 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="room_addr" id="room_addr" /></td>
						</tr>
						<tr>
							<th scope="row">강의실이름 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="room_name" id="room_name" /></td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveRMG" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnDeleteRMG" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnCloseRMG" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>