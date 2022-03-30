<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		
	
		<!-- <div id="layer1" class="layerPop layerType2" style="width:600px"> -->
			<div id="userinfoarea" class="bts">
			
				
				<table>
				
					<tbody>
						<tr class="basicinfo-row1">
							<c:if test="${empty info}">
								<td rowspan="3" style="vertical-align: top">
									<select id="sb-userType">
										<option selected value="Cust">기업고객</option>
										<option value="Emp">내부직원</option>
									</select>
								</td>
							</c:if>
							
							<td>
								<span>아이디</span>
							</td>
							<td>
								<input type="text" name="userID">
							</td>
							<td>
								<span>비밀번호</span>
							</td>
							<td>
								<input type="password" name="password">
							</td>
						</tr>
						
						<c:if test="${not empty info}">
							<tr class="custInfo">
								
								
								<td>
									<span>회사명</span>
								</td>
								<td>
									<input type="text" name="client">
								</td>
								<td>
									<span>담당자명</span>
								</td>
								<td>
									<input type="text" name="name">
								</td>
							</tr>
						</c:if>
						
						<tr class="basicinfo-row2">
							<td>
								<span>연락처</span>
							</td>
							<td>
								<input type="text" name="phone">
							</td>
							<td>
								<span>이메일</span>
							</td>
							<td>
								<input type="text" name="email">
							</td>
						</tr>
						<c:if test="${not empty info}">
							<c:if test="${info.user_Type ne 'C'}">
								<tr class="empInfo">
									<td>
										<span>직원명</span>
									</td>
									<td>
										<input type="text" name="name">
									</td>
									<td>
										<span>담당업무</span>
									</td>
									<td>
										<select>
											<option value="A">SCM</option>
											<option value="B">배송</option>
											<option value="D">구매</option>
											<option value="E">임원</option>
										</select>
									</td>
								</tr>
							</c:if>
						</c:if>
						<tr>
							<td>
								<span>우편번호</span>
							</td>
							<td colspan="4">
								<input type="text" name="zipCode">
							</td>
						</tr>
						<tr>
							<td>
								<span>주소</span>
							</td>
							<td colspan="4">
								<input type="text" name="address">
							</td>
						</tr>
						<tr>
							<td>
								<span>상세주소</span>
							</td>
							<td colspan="4">
								<input type="text" name="dtAddress">
							</td>
						</tr>
					</tbody>
				
				</table>
				
				
				
				<div class="userInfoBtnArea bts">
					<div class="text-right">
						<button type="button" class="btn btn-info" id="btnEditUserInfo">수정</button>
						<button type="button" class="btn btn-secondary" id="closeModal">취소</button>
					</div>
				</div>
			</div>
			
		<!-- </div> -->
		
		
		<input type="hidden" id="action" name="">
