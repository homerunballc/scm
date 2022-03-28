<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
							<c:if test="${totalCntClassInfo eq 0 }">
								<tr>
									<td colspan="12">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${totalCntClassInfo > 0 }">
							<c:set var="nRow" value="${pageSize*(currentPageClassInfo-1)}" />
							<c:forEach items="${listClassInfo}" var="list">
								<tr>
									<td>${totalCntClassInfo - nRow}</td>
									<td>${list.class_no}</td>
									<td>${list.lec_no}</td>
									<td>${list.stu_no}</td>
									<td>${list.name}</td>
									<td>${list.dep}</td>
									<td>${list.lec_name}</td>
									<td>${list.lec_start}</td>
									<td>${list.lec_end}</td>
									<td><a class="btnType3 color1" href="javascript:fPopModalClass('${list.class_no});"><span>수정</span></a></td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
						</c:if>	

						<input type="hidden" id="totalCntClassInfo" name="totalCntClassInfo" value="${totalCntClassInfo}" />