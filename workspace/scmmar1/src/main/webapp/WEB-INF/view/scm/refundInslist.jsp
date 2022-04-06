<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
						   
							<c:forEach items="${relist}" var="list">
										<tr style="cursor: pointer;">
											<td>${list.regdate}</td>
											<td>${list.sales_nm}</td>
											<td>${list.client}</td>
											<td>${list.return_cnt}</td>
											<td>${list.avg}</td>
											<td>${list.confirmYN}</td>
							</c:forEach>
							<input type="hidden" id="total" name="total" value ="${total}"/>
							
