<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCntRMG eq 0 }">
			<tr>
				<td colspan="3">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>

		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCntRMG > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
			<c:forEach items="${roomList}" var="list">
				<tr>
					    <td>${list.room_no}</td>
						<td><a href="javascript:fPopModalRoom('${list.room_no}');">${list.room_name}</a></td>
						<td>${list.room_addr}</td>
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				<c:set var="nRow" value="${nRow + 1}" />
			</c:forEach>
		</c:if>
		
		<!-- 이거 중간에 있으면 table 안먹힘  -->

        <input type="hidden" id="totalCntRMG" name="totalCntRMG" value="${totalCntRMG}"/>











