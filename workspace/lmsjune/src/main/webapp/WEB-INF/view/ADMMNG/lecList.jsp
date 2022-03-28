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
										<td>
											<c:if test="${from eq 1 }"><a href="javascript:fListProb(1, ${list.lec_no}, ${list.test_no})"></c:if>
											${list.lec_name}<c:if test="${from eq 1 }"></a></c:if></td><!-- 강의명 -->
										<td>
											<c:if test="${from eq 1 }"><a href="javascript:fListProb(1, ${list.lec_no}, ${list.test_no})"></c:if>
											<c:if test="${from eq 2 }"><a href="javascript:fListClass(1, ${list.lec_no}, 'lec_no') "></c:if>
											${list.lec_no}
											</a></td><!-- 강의번호 -->
										<td>${list.name}</td><!-- 강사이름 -->
										<td>${list.lec_start}</td><!-- 개강일 -->
										<td>${list.lec_end}</td><!-- 종강일 -->
										<td>
											<c:if test="${from eq 1 }"><a href="javascript:fListProb(1, ${list.lec_no}, ${list.test_no})"></c:if>
											${list.test_no}<c:if test="${from eq 1 }"></a></c:if></td><!-- 시험번호 -->
										<td>
											<a class="btnType3 color1" href="javascript:fPopModalLec(${list.lec_no});"><span>수정</span></a>
										</td>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntLectureInfo" name="totalCntLectureInfo" value ="${totalCntLectureInfo}"/>