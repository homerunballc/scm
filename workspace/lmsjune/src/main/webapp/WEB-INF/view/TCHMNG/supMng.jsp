<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>support management / 학습자료관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<style>
//
click-able rows
	.clickable-rows {tbody tr td { cursor:pointer;
	
}

.el-table__expanded-cell {
	cursor: default;
}
}

.atag {
	text-align: center;
}
</style>

</head>
<body>

<form id="myForm" action=""  method="">

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
							<span>강의 목록</span> 
						</p>
				             <div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
									   <col width="35%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
									</colgroup>
				
									<thead>
										<tr>
										    <th scope="col">강의제목</th>
											<th scope="col">강사명</th>
											<th scope="col">강의시작일</th>
											<th scope="col">강의종료일</th>
											<th scope="col">신청인원</th>
											<th scope="col">정원</th>
										</tr>
									</thead>
									
									
									
									
									<tbody id="listInf">
									<thead>
									<c:choose>
										<c:when test="${empty list }">
											<tr>
												<td colspan="6" align="center">데이터가 없습니다</td>
											</tr>
										</c:when>
										<c:when test="${!empty list }">
											<c:forEach var="list" items="${list }">
										<tr>
										    <th scope="col"><a href="#">${list.lec_name }</a></th>
											<th scope="col">교수번호</th>
											<th scope="col">${list.lec_start }</th>
											<th scope="col">${list.lec_end }</th>
											<th scope="col">신청인원</th>
											<th scope="col">${list.lec_cnt }</th>
										</tr>
										</c:forEach>
									</c:when>
								</c:choose>
								</thead>
									</tbody>
								</table>
							</div>
						
						<div class="paging_area"  id="comnGrpCodPagination"> </div>		   
					   
					   
					   <br><br>
					 
					 <div class="atag">
						  <a href="./addLecClick.do" class="btnType blue" id="searchBtn" name="btn" ><span> 강의 등록 </span></a>
					</div>
					 
					</div> <!--// content -->
					</li>
			</ul>
		</div>
	</div>
					
</form>

</body>
</html>