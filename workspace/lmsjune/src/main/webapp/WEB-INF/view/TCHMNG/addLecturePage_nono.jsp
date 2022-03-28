<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
		function regist_event() {
			if(confirm("등록하시겠습니까?")==true) {
				alert("dddd");
				loacation.href="TCH/addLecturePro.do";
				alert("gggggg");
			}else {
				return;
			}
		}
		
		function reset_event() {
			myForm.reset();
		}

</script>

<!-- 
      <form id="myForm" action="/addLecturePro.do" method="post">
	       -->
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
						<col width="120px">					
					</colgroup>
						<tbody>
							<tr class="hidden">
								<td><input type="text" name="div_cd" id="div_cd" /></td>
								<td><input type="text" name="del_cd" id="del_cd" /></td>
						 		<td><input type="text" name="user_type" id="user_type" /></td> 
								<td><input type="text" name="approval_cd" id="approval_cd" /></td>
							</tr>

							<tr>
								<th scope="row">강의 제목<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="lec_name" id="lec_name" /></td>
							</tr>
							<tr>
								<th scope="row">강의실 번호<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="room_no" id="room_no" /></td>
							</tr>
							<tr>
								<th scope="row">강의 인원수<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="lec_cnt" id="lec_cnt" /></td>
							</tr>
							<tr id="birthday1">
								<th scope="row">강의 시작일<span class="font_red">*</span></th>
								<td><input type="date" class="inputTxt p100"
									name="lec_start" id="lec_start" style="font-size: 15px" />
							</tr>
							<tr id="birthday1">
								<th scope="row">강의 종료일<span class="font_red">*</span></th>
								<td><input type="date" class="inputTxt p100"
									name="lec_end" id="lec_end" style="font-size: 15px" />
							</tr>
							<tr>
								<th scope="row">강의 목표<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="lec_goal" id="lec_goal" /></td>
							</tr>
							<tr>
						<th scope="row" >강의계획서<span class="font_red">*</span></th>
								<td colspan="3">
								<input type="file" name="lec_plan" id="lec_plan"  ></input>
								<!-- <img v-if="file_nm !='' "src="/images/treeview/minus.gif" @click="minusClickEvent"> -->
								</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="btn">
							<a  class="btnType blue" href=""	id="RegisterCom" name="btn"> <span>등록</span></a> 
							<a class="btnType gray"  href="" id="btnCloseLsmCod" name="btn"><span>취소</span></a>
				</div>
<!-- 	</form>	 -->
						