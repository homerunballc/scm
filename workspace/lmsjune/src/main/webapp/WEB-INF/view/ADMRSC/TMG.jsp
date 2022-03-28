<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea</title>

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

/*datepicker 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
</style>
<script type="text/javascript">
        var pageSizeTeacher  = 5;					// 화면에 나오는 데이터 수
        var pageBlockSizeTeacher  = 10;			// 블럭으로 잡히는 페이지 수

        // ready 이벤트 : 페이지 실행 시 DOM(Document Object Model)이 load된 후에 즉시 실행 
        $(document).ready(function() {
        	
        	// 강의실 조회
        	fListTeacher();
        	// 버튼 이벤트 등록
    		fRegisterButtonClickEvent();
        	
        }); 
        
        // 버튼 이벤트 등록
    	function fRegisterButtonClickEvent() {
    		$('a[name=btn]').click(function(e) {
    			e.preventDefault();

    			var btnId = $(this).attr('id');

    			switch (btnId) {
    				case 'btnSaveTMG' :
    					fSaveTMG();
    					break;
    				case 'btnDeleteTMG' :
    					fDeleteTMG();
    					break;
    				case 'btnSearchTMG':
    					board_search();
    					break;
    				case 'btnCloseTMG' :
    					gfCloseModal();
    					break;
    			}
    		});
    	}
        
    	// 강사관리 폼 초기화 
    	function fInitFormTMG(object) {
    		// $("대상 선택").focus();  :  대상 요소(아이디가 room_no인)로 포커스가 이동하면 이벤트 발생
    		//								텍스트 창일때 커서를 그 곳으로 위치시킨다.
    		$("#loginID").focus();
    		if( object == "" || object == null || object == undefined) {
    			
    			// .val() : 양식(form)의 값을 가져오거나 값을 설정하는 메소드
    			// $("#room_no").val("");   : id가 room_no인 값을 ""(빈 값)로 설정 
    			// .attr() : 선택한 요소의 속성값을 가져오거나 속성을 추가
    			// $("#room_no").attr("readonly", false); :  id가 room_no인 곳에 읽기만 가능한 것을 수정도 가능하게 해준다.
    			// .css() : 선택한 요소의 css 속성값을 가져오거나 style 속성을 추가
    			// $("#room_no").css("background", "#FFFFFF"); : id가 room_no인 곳에 배경색을 #FFFFFF색으로 변경
    			$("#loginID").val("");
    			$("#pw").val("");
    			$("#t_name").val("");
    			$("input:radio[name=gender]:input[value='M']").attr("checked", true);
    			$("#age").val("");
    			//$("#joinDate").val("");
    			$('#joinDate').datepicker('setDate', 'today');
    			$("#t_no").val("");
    			$("#dep").val("");
    			// select박스 option값 선택하기
    			$("#hp").val("");
    			$("#email").val("");
    			$("#zip").val("");
    			$("#addr").val("");
    			$("#addr_dtl").val("");
    			
    			$("#loginID").attr("readonly", false);
    			$("#loginID").css("background", "#FFFFFF");
    			$("#loginID").focus();
    			$("#btnDeleteTMG").hide();
    			
    		} else {
    			
    			$("#loginID").val(object.loginID);
    			$("#pw").val(object.pw);
    			$("#t_name").val(object.t_name);
    			$("input:radio[name=gender]:input[value="+object.gender+"]").attr("checked", true);
    			$("#age").val(object.age);
    			$("#joinDate").val(object.joinDate);
    			$("#t_no").val(object.t_no);
    			$("#dep").val(object.dep);
    			$("#hp").val(object.hp);
    			$("#email").val(object.email);
    			$("#zip").val(object.zip);
    			$("#addr").val(object.addr);
    			$("#addr_dtl").val(object.addr_dtl);
    			
    			$("#loginID").attr("readonly", true);
    			$("#loginID").css("background", "#F5F5F5");
    			$("#t_name").focus();
    			
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
            	fListTeacherResult(data, currentPage); 
            };
            
            callAjax("/ADMRSC/roominfo.do", "post", "text", true, param, resultCallback);
            
      } 
        
    	// 강사관리 저장 validation(확인)
    	function fValidateTMG() {

    		var chk = checkNotEmpty(
    				[
    						[ "loginID", "아이디를 입력해 주세요." ]
    					,	[ "pw", "비밀번호를 입력해 주세요." ]
    					,	[ "t_name", "이름을 입력해 주세요" ]
    					,	[ "t_name", "이름을 입력해 주세요" ]	
    					,	[ "age", "연령을 입력해 주세요" ]
        				,	[ "t_no", "교번을 입력해 주세요" ]
    					,	[ "dep", "소속을 입력해 주세요" ]
        				,	[ "zip", "우편번호를 입력해 주세요" ]
    					,	[ "addr", "주소를 입력해 주세요" ]
        				,	[ "addr_dtl", "세부주소를 입력해 주세요" ]
    				]
    		);
    		if (!chk) {
    			return;
    		}

    		return true;
    	}
    	
    	// 강사관리 모달 실행
		function fPopModalTeacher(loginID) {
			
			// 신규 저장
			if (loginID == null || loginID=="") {
				//swal("여기도 찍어봅세  ");
				// Tranjection type 설정
				$("#action").val("I");
				
				// 그룹코드 폼 초기화
				fInitFormTMG();
				
				// 모달 팝업
				gfModalPop("#layer1");

			// 수정 저장
			} else {
				// Tranjection type 설정
				$("#action").val("U");
				
				// 그룹코드 단건 조회
				fSelectTMG(loginID);
			}
		}
    	
        // 강사목록 조회 
		function fListTeacher(currentPage) {
			
			currentPage = currentPage || 1;
			
			var sname = $('#sname').val();
			var oname = $('#searchKey').val();
			
			console.log("currentPage : " + currentPage);
			
			var param = {
						sname : sname
					,	oname : oname
					,	currentPage : currentPage
					,	pageSize : pageSizeTeacher
			}
			
			var resultCallback = function(data) {
				fListTeacherResult(data, currentPage);
			};
			
			//Ajax실행 방식
			//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
			//html로 받을거라 text
			callAjax("/ADMRSC/teacherInfo.do", "post", "text", true, param, resultCallback);
		}
        
        // 강의실 조회 콜백 함수
		function fListTeacherResult(data, currentPage) {
					//alert(data);
			console.log("fListTeacherResult : " + data);		
			
			// 기존 목록 삭제
			$('#listTeacher').empty();
			// 신규 목록 생성
			$("#listTeacher").append(data);
			
			// 총 개수 추출
			var totalCntTMG = $("#totalCntTMG").val();
			
			// 페이지 네비게이션 생성
			var paginationHtml = getPaginationHtml(currentPage, totalCntTMG, pageSizeTeacher, pageBlockSizeTeacher, 'fListTeacher');
			console.log("paginationHtml : " + paginationHtml);
			//swal(paginationHtml);
			$("#teacherPagination").empty().append( paginationHtml );
			
			// 현재 페이지 설정
			$("#currentPageTMG").val(currentPage);
		
		}
        
		// 강사목록 단건 조회 
		function fSelectTMG(loginID) {
			
			var param = { loginID : loginID };
			
			var resultCallback = function(data) {
				fSelectTMGResult(data);
			};
			
			callAjax("/ADMRSC/selectTMG.do", "post", "json", true, param, resultCallback);
		}
		
		
		// 강사목록 단건 조회 콜백 함수
		function fSelectTMGResult(data) {

			if (data.result == "SUCCESS") {

				// 모달 팝업
				gfModalPop("#layer1");
				
				// 그룹코드 폼 데이터 설정
				fInitFormTMG(data.teacherInfo);
				
			} else {
				swal(data.resultMsg);
			}	
		}
		
		
		// 강사정보 추가 
		function fSaveTMG() {

			// vaildation 체크
			if ( ! fValidateTMG() ) {
				return;
			}
			
			var resultCallback = function(data) {
				fSaveTMGResult(data);
			};
			
			callAjax("/ADMRSC/saveTMG.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
		}
		
		
		// 강사정보 추가 콜백 함수
		function fSaveTMGResult(data) {
			
			// 목록 조회 페이지 번호
			var currentPage = "1";
			if ($("#action").val() != "I") {
				currentPage = $("#currentPageTMG").val();
			}
			
			if (data.result == "SUCCESS") {
				
				// 응답 메시지 출력
				swal(data.resultMsg);
				
				// 모달 닫기
				gfCloseModal();
				
				// 목록 조회
				fListTeacher(currentPage);
				
			} else {
				// 오류 응답 메시지 출력
				swal(data.resultMsg);
			}
			
			// 입력폼 초기화
			fInitFormTMG();
		}

		
		// 강사정보 삭제
		function fDeleteTMG() {
			
			swal("정말 삭제하겠습니까? \n삭제시 복구불가합니다.", {
				  buttons:{
					  yes : "예",
					  no : "아니오"
				  }
				}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
					switch(value){
					case "yes":
						
						var resultCallback = function(data) {
						fDeleteTMGResult(data);
						};
					
						callAjax("/ADMRSC/deleteTMG.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
					
						break;
					case "no": 
						break;
					}
				});
			
			
		}
		
		
		// 강사정보 삭제 콜백 함수 
		function fDeleteTMGResult(data) {
			
			var currentPage = $("#currentPageTMG").val();
			
			if (data.result == "SUCCESS") {
				
				// 응답 메시지 출력
				swal(data.resultMsg);
				
				// 모달 닫기
				gfCloseModal();
				
				// 그룹코드 목록 조회
				fListTeacher(currentPage);
				
			} else {
				swal(data.resultMsg);
			}	
		}
		
		// jQuery datepicker(날짜 선택기)
		$(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                // ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                // ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
 
            //input을 datepicker로 선언
            $("#datepicker").datepicker();                    
            $("#datepicker2").datepicker();
            $("#joinDate").datepicker();
            
            // 시작일의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', '-1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            // 종료일의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', 'today');
            // 등록일의 초기값을 오늘 날짜로 설정
            $('#joinDate').datepicker('setDate', 'today');
		 });
		
		// 입력 시 연락처 양식 자동 설정
		$(function(){ 
			$('#hp').keydown(function(event) { 
				var key = event.charCode || event.keyCode || 0;
				$text = $(this); 
				if (key !== 8 && key !== 9) { 
					if ($text.val().length === 3) {
						$text.val($text.val() + '-');
						} 
					if ($text.val().length === 8) { 
						$text.val($text.val() + '-'); 
						} 
					} 
				return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105)); 
				});
			});

</script>

</head>
<body>
<form id="myForm" action=""  method="">

<input type="hidden" id=currentPageTMG value="1">
<input type="hidden" id="selectedInfNo" value="">
<input type="hidden" name="action" id="action" value="">
	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> 
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> 
					<!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
	               
					<div class="content" style="margin-bottom:20px;">
						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
							<span	 class="btn_nav bold">인원관리</span>
							<span	 class="btn_nav bold">강사관리</span> 
							<a href="../ADMRSC/TMG.do"
								class="btn_set refresh">새로고침</a>
						</p>
						<!-- 컨텐츠 타이틀 -->
						<p class="conTitle" style="margin-bottom: 1%;">
							<span>강사관리</span>
							 <span class="fr"> 
							 	<a class="btnType blue" href="javascript:fPopModalTeacher();" name="modal"><span>강사 추가</span></a>
							</span>
						</p>
						<!-- 날짜선택기 : datepicker -->
						<p>
							<span>가입일자: <input type="text" id="datepicker"> ~ <input type="text" id="datepicker2"></span>
							<span class="fr">
								강사명  :  <input type="text" style="width: 300px; height: 25px;" id="sname" name="sname">                    
	                           <a href="" class="btnType blue" id="btnSearchTMG" name="btn"><span>검  색</span></a>
							</span>
						</p>
						<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="4%">
										<col width="14%">
										<col width="12%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="15%">
										<col width="10%">
										<col width="16%">
									</colgroup>
				
									<thead>
										<tr>
										    <th scope="col"><input type="checkbox"></th>
										    <th scope="col">강사명</th>
										    <th scope="col">로그인ID</th>
										    <th scope="col">교번</th>
										    <th scope="col">pw</th>
										    <th scope="col">전화번호</th>
										    <th scope="col">소속</th>
											<th scope="col">가입일</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody id="listTeacher">
									</tbody>
								</table>
							</div>
							
						<div class="paging_area"  id="teacherPagination"> </div>
						
					</div> <!--// content -->
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 모달팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 750px;">
		<dl>
			<dt>
				<strong>강사 관리</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="150px">
						<col width="*">
						<col width="150px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">아이디 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="loginID" id="loginID" /></td>
							<th scope="row">비밀번호 <span class="font_red">*</span></th>
							<td><input type="password" class="inputTxt p100" name="pw" id="pw" /></td>
						</tr>
						<tr>
							<th scope="row">이름 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="t_name" id="t_name" /></td>
							<th scope="row">성별 <span class="font_red">*</span></th>
							<td><label for = "gender"></label>
								<input type="radio"  name="gender" id="gender"  value="M"/>&nbsp;남&nbsp;&nbsp;
								<input type="radio"  name="gender" id="gender"  value="F"/>&nbsp;여</td>
						</tr>
						<tr>
							<th scope="row">연령 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="age" name="age"></td>
							<th scope="row">등록일 <span class="font_red">*</span></th>
							<td><input type="text" id="joinDate"  name="joinDate"  ></td>
						</tr>
						<tr>
							<th scope="row">교번 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="t_no" id="t_no" /></td>
							<th scope="row">소속 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="dep" id="dep" /></td>
						</tr>
						<tr>
							<th scope="row">연락처 <span class="font_red">*</span></th>
							<td>
								<input type="text" name="hp" id="hp" maxlength="13" class="inputTxt p100">
							</td>
							<th scope="row">우편번호 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="zip" id="zip" /></td>
						</tr>
						<tr>	
							<th scope="row">이메일 <span class="font_red">*</span></th>
							<td colspan="3"><input type="email" class="inputTxt p100"	name="email" id="email" /></td>
						</tr>
						<tr>
							<th scope="row">주소 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="addr" id="addr" /></td>
						</tr>
						<tr>
							<th scope="row">상세주소 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="addr_dtl" id="addr_dtl" /></td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveTMG" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnDeleteTMG" name="btn"><span>삭제</span></a> 
					<a href="" class="btnType gray"  id="btnCloseTMG" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>