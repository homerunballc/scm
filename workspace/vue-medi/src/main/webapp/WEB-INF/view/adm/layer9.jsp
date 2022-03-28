<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div id="layer9" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>신고서</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="100px">
						<col width="100px">
					</colgroup>
						
					<tbody v-if="divcd ==1">
						<tr>
							<td colspan="4" style="text-align: center">신고인(대표자)</td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text"  v-model ="dec_name"></td>
							<td>생년 월일</td>
							<td><input type="text" v-model ="dec_birth"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text"  v-model ="dec_address"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">제조(소입)업소</td>
						</tr>
						<tr>
							<td>명칭(상호)</td>
							<td><input type="text" v-model ="copnm"></td>
							<td>입허가번호</td>
							<td><input type="text" v-model ="coplicense"></td>
						</tr>
						<tr>
							<td>소재지</td>
							<td colspan="3"><input type="text" style="width: 100%" v-model ="copaddress"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">구분</td>
						</tr>
						<tr>
							<td><input type="radio" name="type" value = "items" v-model ="type">품목류 </td>
							<td><input type="radio" name="dtype" value ="1" v-model ="divdtl">제조신고 </td>
							<td><input type="radio" name="dtype" value="2" v-model ="divdtl">제조신고변경 </td>
							<td><input type="radio" name="dtype" v-model ="divdtl">조건부 제조신고 </td>
						</tr>
						<tr>
							<td><input type="radio" name="type" value = "item" v-model ="type">품목 </td>
							<td><input type="radio" name="dtype" value ="3" v-model ="divdtl">수입신고 </td>
							<td><input type="radio" name="dtype" value="4" v-model ="divdtl">수입신고변경 </td>
							<td><input type="radio" name="dtype" v-model ="divdtl">조건부 수입신고 </td>
						</tr>
						<tr>
							<td colspan="2">제품명(상품명,품목명,모델명)</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="modelnm"></td>
						</tr>
						<tr>
							<td colspan="2">분류번호(등급)</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="divno"></td>
						</tr>
						<tr>
							<td colspan="2">모양 및 구조</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="shape"></td>
						</tr>
						<tr>
							<td colspan="2">성능</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="property"></td>
						</tr>
						<tr>
							<td colspan="2">사용 목적</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="usepurpose"></td>
						</tr>
						<tr>
							<td colspan="2">사용시 주의사항</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="hints"></td>
						</tr>
						<tr>
							<td colspan="2">제조원</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="manufacturer"></td>
						</tr>
						<tr>
							<td colspan="2">비고</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="etc"></td>
						</tr>
						<tr>
							<td colspan="2">신고인</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="dec_name"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 성명</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="manager"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 전화번호</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="managerphone"></td>
						</tr>
					</tbody>
					
					<tbody v-else-if="divcd ==2">
						<tr>
							<td colspan="4" style="text-align: center">신고인(대표자)</td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text"  v-model ="dec_name"></td>
							<td>생년 월일</td>
							<td><input type="text" v-model ="dec_birth"></td>
						</tr>
						<tr>
							<td>등록기준지</td>
							<td><input type="text"  v-model ="dec_address"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">제조(소입)업소</td>
						</tr>
						<tr>
							<td>영업소명</td>
							<td><input type="text" v-model ="copnm"></td>
							<td>전화번호</td>
							<td><input type="text" v-model ="managerphone"></td>			
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="3"><input type="text" style="width: 100%" v-model ="copaddress"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">수리대상 의료기기의 유형</td>
							<td colspan="2" ><textarea rows="5" cols="10" style="resize: none"  v-model="meditype"></textarea> </td>							
						</tr>
						<tr>
							<td colspan="2">다른 겸업 여부</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="otheryn"></td>	
						</tr>
						<tr>
							<td colspan="2">비고 </td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="etc"></td>	
						</tr>
						<tr>
							<td colspan="2">신고인</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="dec_name"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 성명</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="manager"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 전화번호</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="managerphone"></td>
						</tr>
					</tbody>
					
					<tbody v-else-if="divcd ==3">
						<tr>
							<td colspan="4" style="text-align: center">신고인(대표자)</td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text"  v-model ="dec_name"></td>
							<td>생년 월일</td>
							<td><input type="text" v-model ="dec_birth"></td>
						</tr>
						<tr>
							<td>등록기준지</td>
							<td><input type="text"  v-model ="dec_address"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">제조(소입)업소</td>
						</tr>
						<tr>
							<td>영업소명)</td>
							<td><input type="text" v-model ="copnm"></td>
							<td>신고번호</td>
							<td><input type="text" v-model ="coplicense"></td>			
						</tr>
						<tr>
							<td>소재지</td>
							<td colspan="3"><input type="text" style="width: 100%" v-model ="copaddress"></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center">구분</td>
						</tr>
						<tr>
							<td><input type="radio" name="accas" value = "1" v-model ="accas">판매업 </td>		
							<td><input type="radio" name="accas" value ="2" v-model ="accas">임대업</td>			
						</tr>
						<tr>
							<td colspan="2">신고인</td>
							<td colspan="2"><input type="text" style="width: 100%"  v-model ="dec_name"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 성명</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="manager"></td>
						</tr>
						<tr>
							<td colspan="2">담당자 전화번호</td>
							<td colspan="2"><input type="text" style="width: 100%" v-model ="managerphone"></td>
						</tr>
					</tbody>
					
					<tbody v-else>
						<tr>
							<td colspan="4" style="text-align: center">신고서를 선택해 주세요{{divcd}}</td>
						</tr>
					</tbody>
					
				</table>
				<!-- e : 여기에 내용입력 -->
					<div class="btn_areaC mt30">
					   <input type="hidden" name="Actiondetail" id="Actiondetail" value="">
						<a href="" class="btnType blue" id="btnSaveDtlCod"  @click="minert()" name="btn" ><span>저장</span></a>
						<a  href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
					</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
   </div>
</html>