<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
						   
							<c:if test="${totalCntLectureInfo eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntLectureInfo > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageLectureInfo-1)}" />
								<c:forEach items="${listAdminLectureInfo}" var="list">
									<tr>
										<td>${totalCntLectureInfo - nRow}</td><!-- 번호 -->
										<%-- <td><a href="/TCH/planDetail.do?lec_no=${list.lec_no }">${list.lec_name}</a></td> --%><!-- 강의명 -->
										<td><a href="javascript:planDetail(${list.lec_no })">${list.lec_name}</a></td>
										<td>${list.name}</td><!-- 강사이름 -->
										<td>${list.lec_start}</td><!-- 개강일 -->
										<td>${list.lec_end}</td><!-- 종강일 -->
										<td>0</td>
										<td>${list.lec_cnt}</td><!-- 수강인원 -->
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntLectureInfo" name="totalCntLectureInfo" value ="${totalCntLectureInfo}"/>