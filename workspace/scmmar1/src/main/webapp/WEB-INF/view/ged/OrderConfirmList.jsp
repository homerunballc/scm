<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${orderConfirmCnt eq 0 }">
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		

		<!-- 갯수가 있는 경우  -->
		<c:if test="${orderConfirmCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${orderConfirm}" var="list">
				<tr>
				        <!--  <td>${list.orderid}</td>-->
					    <td>${list.compNm}</td>
						<td>${list.salesNm}</td>
						<td>${list.orderCnt}</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.unitprice}"></fmt:formatNumber></td>
						<td>${fn:substring(list.purdate,0,10)}</td>
						<td>

                             <c:if test="${list.confirmYN eq null }">
                                                                  미승인
                             </c:if>    
						     <c:if test="${list.confirmYN eq 'N' }">
                                                                  반려처리 완료
                             </c:if>                              
						     <c:if test="${list.confirmYN eq 'Y' }">
                                                                  승인처리 완료
                             </c:if>                               
                        </td>
                        <td>
                                 <a class="btnType3 color1" href="javascript:fOrderOne('${list.orderid}','Y','${list.confirmYN}');"><span>승인</span></a>
                                 <a class="btnType3 color1" href="javascript:fOrderOne('${list.orderid}','N','${list.confirmYN}');"><span>반려</span></a>
                        </td>     
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
		<!-- 이거 중간에 있으면 table 안먹힘  -->

        <input type="hidden" id="totcnt" name="totcnt" value="${orderConfirmCnt}"/>











