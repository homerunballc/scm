<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
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
</html>