<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCntTMG eq 0 }">
			<tr>
				<td colspan="3">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>

		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCntTMG > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
			<c:forEach items="${teacherList}" var="list">
				<tr>
					    <td><input type="checkbox"></td>
						<td>${list.t_name}</td>
						<td>${list.loginID}</td>
						<td>${list.t_no}</td>
						<td>${list.pw}</td>
						<td>${list.hp}</td>
						<td>${list.dep}</td>
						<td>${list.joinDate}</td>
						<td><a class="btnType3 color1" href="javascript:fPopModalTeacher('${list.loginID}');"><span>수정</span></a></td>
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				<c:set var="nRow" value="${nRow + 1}" />
			</c:forEach>
		</c:if>
		
		<!-- 이거 중간에 있으면 table 안먹힘  -->

        <input type="hidden" id="totalCntTMG" name="totalCntTMG" value="${totalCntTMG}"/>











