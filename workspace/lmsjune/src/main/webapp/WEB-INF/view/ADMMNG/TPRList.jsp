<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					
							<c:if test="${totalCntProbInfo eq 0 }">
								<tr>
									<td colspan="8">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntProbInfo > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageProbInfo-1)}" />
								<c:forEach items="${listProbInfo}" var="list">
									<tr>
										<td>${list.que_no}</td>
										<td>${list.que_que}</td>
										<td>${list.que_right}</td>
										<td>${list.que_ex1}</td>
										<td>${list.que_ex2}</td>
										<td>${list.que_ex3}</td>
										<td>${list.que_ex4}</td>
										<td>
										<a class="btnType3 color1" href="javascript:fPopModalProb(${list.test_no},${list.que_no});"><span>수정</span></a>
										</td>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntProbInfo" name="totalCntProbInfo" value="${totalCntProbInfo}" />