<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div id="layer55" class="layerPop layerType2" style="width: 600px;">
	  <div id="vueedittable">
		<dl>
			<dt>
				<strong>승인여부</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="100px">
						<col width="100px">
					</colgroup>

					<tbody >
						<tr>
							<td scope="row" colspan="3" style="text-align: center">
							<input type="radio" name = "comttt" value = "1" id = "comttt" v-model="comttt">승인
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name = "comttt" value = "2" id = "comttt" v-model="comttt">반려
							</td>
						</tr>
				</table>
				<!-- e : 여기에 내용입력 -->
				<div class="btn_areaC mt30">
				   <input type="hidden" name="Actiondetail" id="Actiondetail" value="">
					<a href=""class="btnType blue" id="btnSaveDtlCod"  @click="comttt1()" name="btn"><span>저장</span></a>
					<a href=""class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
   </div>
</html>