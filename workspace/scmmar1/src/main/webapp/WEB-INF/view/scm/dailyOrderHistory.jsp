<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>일별수주내역</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
<script type="text/javascript">

var pageSize = 10;
var pageBlockSize = 10;
var returnsearch = '';	// 반품 목록 조회 검색 조건
var selectsearch = '';	// 검색 조건 일자 구분
var datesearch1 = '';	// 검색 조건 앞 날짜
var datesearch2 = '';	// 검색 조건 뒤 날짜
var pur_id = '';
today = new Date();
today = today.toISOString().slice(0, 10);
var sales_id = '';
var test = '';
var loginID='';

// onload list 및 검색조건 함수 불러오기
$(function(){
	
	$('#serchdate2').val(today);
	init();
	
});


// list 조회
function init(currentPage) {
	
	currentPage = currentPage || 1;
	
	var param = {	
			currentPage : currentPage
		,	pageSize : pageSize
		,	returnsearch : returnsearch
		,	selectsearch : selectsearch
		,	datesearch1 : datesearch1
		,	datesearch2 : datesearch2
		,	pur_id : pur_id
			}
	
	var resultCallback = function(data) {
		
		// list tbody에 넣는 내용
		$("#dailyOrderlist").empty().append(data);
		var total = $("#total").val();
		
		// 페이지 네비게이션 생성
		// pageBlockSize 보여지는 페이징 갯수
		var paginationHtml = getPaginationHtml(currentPage, total,  pageSize, pageBlockSize, 'init');
		console.log("paginationHtml : " + paginationHtml);
		$("#comnGrpCodPagination").empty().append( paginationHtml );
	};
	callAjax("/scm/listdailyOrderHistory.do", "post", "text", true, param, resultCallback);
}



// 반품/미반품 목록 검색 조회
function returns(value){
	
	alert(value);
	returnsearch = value;
	init();
}
function search(){
	
	//$("select[name=searchgrouptype] option:selected").val()
	selectsearch = $("#searchgrouptype option:selected").val()
	datesearch1 = $("#serchdate1").val();
	datesearch2 = $("#serchdate2").val();
	var testdate ='';
	
	if(datesearch1 < datesearch2){
		datesearch1 = datesearch1;
		datesearch2 = datesearch2
		
		
	}else{
		testdate = datesearch2;
		datesearch2 = datesearch1;
		datesearch1 = testdate;
		
		$('#serchdate1').val(datesearch1);
		$('#serchdate2').val(datesearch2);
		
		
	}
	init();
	
}


// 검색 조건 초기화
function reset(){
	$('#serchdate1').val('');
	$('#serchdate2').val(today);
	$('#returnsearch1').prop('checked',false);
	$('#returnsearch2').prop('checked',false);
	$('#searchgrouptype').val('');
	
	init();
}

// 지시서 작성 radio 모달창 실행
function orderhi(purid,salesid,login_ID){
	pur_id = purid;
	sales_id = salesid;
	loginID = login_ID;
	gfModalPop("#layer1");
	init();
}

// 지시서 작성  팝업 구분 실행
function layer1btn(){
	var selcheck = $('input:radio[name=sel]:checked').val();
	var param = {	
			pur_id : pur_id,
			selcheck : selcheck
			}
	
	var resultCallback = function(data) {

		console.log(data);
		alert(data.ondata.loginID);
		$("#layer").empty().append(data);
		gfModalPop("#layer");
		
		
	};
	callAjax("/scm/onedailyOrderHistory.do", "post", "text", true, param, resultCallback);
}

	
	
function whcnt(v){
	//alert(v);
	//alert(sales_id);
	var param = {
			sales_id : sales_id
		,	wh_id : v
	}
	var resultCallback = function(data){
		$("#warehcnt").html(data.whcnt.st_cnt);
		test = data.whcnt.st_cnt;
	}
	
	callAjax("/scm/whcnd.do", "post", "json", true, param, resultCallback);
}

// 주문 입력 수가 총 재고수 넘지 못하게 막기
function t(){
	var val = $("#warehinput").val();
	if(val > test){
		alert("재고가 부족 합니다.");
		$("#warehinput").val('');			
		return;
	}
}
//지시서 작성
function send(f){
	//배송지시서
	if(f == 'wa'){
		
		
		alert(f);
	
	//발주지시서
	}else if(f == 'com'){
		var a = $("#compcnt").val();
		var b = $("#selcomcnt").val();
		alert(loginID);
		//$("#userID").val(loginID);
		var param = {
				com_cnt : a
			,	com_code : b
			,	sales_id : sales_id
			,	active : f
			,	pur_id : pur_id
				}
		var resultCallback = function(data){
		}
		
		callAjax("/scm/sendtotal.do", "post", "json", true, param, resultCallback);
		
		
		
		
		
	//반품지시서	
	}else{
		alert("111");
		
	}
}
	
	
</script>


</head>
<body>
<form id="myForm" action=""  method="">
    <input type="hidden" name="selfrpcd" id="selfrpcd" value="">
    <input type="hidden" name="selfrpnm" id="selfrpnm" value="">
	
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
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">Sample</span> <span class="btn_nav bold">일별수주내역</span> 
								<a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>일별수주내역</span> 
							<span class="fr">
								 <input type="radio" id="returnsearch1" name="returnsearch" class="returnsearch" value="a" onclick="returns(this.value)" style="cursor: pointer;">반품요청 목록 조회    
	                             <input type="radio" id="returnsearch2" name="returnsearch" class="returnsearch" value="b" onclick="returns(this.value)" style="cursor: pointer;">미반품요청 목록 조회
							     <select id="searchgrouptype"  name="searchgrouptype" style="width: 150px;">
							            <option value="" >전체</option>
							    		<option value="0" >주문일자로 조회</option>
							    		<option value="1" >반품처리일자로 조회</option>
							     </select> 
							     <input type = "date" id="serchdate1" name="serchdate1"> ~
							     <input type = "date" id="serchdate2" name="serchdate2">
	                              <a class="btnType blue" id="btnSearchGrpcod" name="btn" style="cursor: pointer;"><span onclick="search()" >검  색</span></a>
	                              <a class="btnType blue" id="btnSearchGrpcod" name="btn" style="cursor: pointer;"><span onclick="reset()" >초기화</span></a>
	                             
							</span>
    
						</p>
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="4%">
									<col width="6%">
									<col width="6%">
									<col width="10%">
									<col width="6%">
									<col width="6%">
									<col width="6%">
									<col width="6%">
									<col width="4%">
									<col width="8%">
									<col width="4%">
									<col width="8%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">주문번호</th>
										<th scope="col">주문일자</th>
										<th scope="col">고객명</th>
										<th scope="col">제품명</th>
										<th scope="col">재고수</th>
										<th scope="col">단가</th>
										<th scope="col">주문수</th>
										<th scope="col">총 금액</th>
										<th scope="col">반품요청</th>
										<th scope="col">반품처리일자</th>
										<th scope="col">입금</th>
										<th scope="col">지시서 작성</th>
									</tr>
								</thead>
								<tbody id="dailyOrderlist"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="comnGrpCodPagination"> </div>
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

<!-- 모달팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 600px;">

		<dl>
			<dt>
				<strong>지시서 작성</strong>
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
							<th scope="row">지시서 작성<span class="font_red">*</span></th>
							<td colspan="3">
							   <input type="radio" 	name="sel" id="sel1" value='1' style="cursor: pointer;"/>반품지시서
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="sel" id="sel2" value="2" style="cursor: pointer;"/>배송지시서
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" name="sel" id="sel3" value="3" style="cursor: pointer;"/>발주지시서
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_areaC mt30">
				    <input type="hidden" name="Action" id="Action" value="">
					<a class="btnType blue" id="btnSaveGrpCod" name="btn" onclick="layer1btn()"><span style="cursor: pointer;">작성</span></a> 
					<a href=""	class="btnType gray"  id="btnCloseGrpCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
	
	<div id="layer" class="layerPop layerType2" style="width: 600px;"></div>
</form>
</body>
</html>