<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
						   

		<dl>
			<dt>
				<strong>배송지시서 작성</strong>
			</dt>
			<dd class="content">
				<div style="text-align: left; font-size: 15px; font-weight: bold;">주문정보</div> <br>
				<table class="row">
					<caption>caption</caption>
					<tbody>
						<tr>
							<th style="text-align: center;">주문번호</th>
							<th style="text-align: center;">주문일자</th>
							<th style="text-align: center;">고객기업명</th>
							<th style="text-align: center;">제품명</th>
							<th style="text-align: center;">주문개수</th>
							<th style="text-align: center;">배송담당자</th>
							<th style="text-align: center;">입금여부</th>
						</tr>
						<tr>
							<td style="text-align: center;">${onedata.pur_id }</td>
							<td style="text-align: center;">${onedata.purdate }</td>
							<td style="text-align: center;">${onedata.name }</td>
							<td style="text-align: center;">${onedata.sales_nm }</td>
							<td style="text-align: center;">${onedata.pur_cnt}</td>
							<td style="text-align: center;"></td>
							<td style="text-align: center;">${onedata.depositYN }</td>
						</tr>
					</tbody>
				</table>
				
				<br><br>
				
				
				<div style="text-align: left; font-size: 15px; font-weight: bold;">배송정보 입력</div> <br>
				<form action="">
					<table class="row">
					<caption>caption</caption>
						<tbody>
							<tr>
								<th>창고별 품목</th>
								<th>총 재고 건수</th>
								<th>주문 개수 입력</th>
							</tr>
							
						
							<tr>
								<td>
									<select id="wareh" onchange="whcnt(this.value)">
											<option value ="" selected="selected" disabled >::창고를 선택해 주세요::</option>
										<c:forEach items="${warehouse}" var="list">
											<option value="${list.wh_id }">${list.wh_nm }</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<input type="text" id="warehcnt" value = "">
								</td>
								<td>
									<input type="number">
								</td>
							</tr>
							
						</tbody>
					</table>
				</form>


				<div class="btn_areaC mt30">
				    <input type="hidden" name="Action" id="Action" value="">
					<a class="btnType blue" id="btnSaveGrpCod" name="btn" ><span>작성</span></a> 
					<a href=""	class="btnType gray"  id="btnCloseGrpCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		
		
