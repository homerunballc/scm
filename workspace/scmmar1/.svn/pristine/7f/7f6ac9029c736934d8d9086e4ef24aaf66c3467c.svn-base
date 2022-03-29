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
<title>Job Korea :: 공통 코드 관리</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
<script type="text/javascript">

// onload list 및 검색조건 함수 불러오기
$(function(){
	
	
});

// 지시서 작성 radio 모달창 실행
function orderhi(){
	gfModalPop("#layer1");
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
							     <select id="searchgrouptype"  name="searchgrouptype" style="width: 150px;">
							            <option value="" >전체</option>
							    		<option value="" >그룹코드</option>
							    		<option value="" >그룹코드명</option>
							     </select> 
							     <input type="text" style="width: 300px; height: 25px;" id="sgroupinput" name="sgroupinput">                    
	                              <a href="" class="btnType blue" id="btnSearchGrpcod" name="btn"><span>검  색</span></a>
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
									<col width="8%">
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
								<tbody>
									<tr>
										<td>1</td>
										<td>2020-12-12</td>
										<td>삼성</td>
										<td>서버</td>
										<td>100</td>
										<td>10000</td>
										<td>50</td>
										<td>500000</td>
										<td>N</td>
										<td>-</td>
										<td>Y</td>
										<td>
											<a class="btnType blue" style="cursor: pointer;" onclick="orderhi()" >
											<span>지시서 작성</span></a>
										</td>
									</tr>
								</tbody>
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
				<strong>그룹코드 관리</strong>
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

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
				    <input type="hidden" name="Action" id="Action" value="">
					<a href="" class="btnType blue" id="btnSaveGrpCod" name="btn"><span>작성</span></a> 
					<a href=""	class="btnType gray"  id="btnCloseGrpCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>


</form>
</body>
</html>