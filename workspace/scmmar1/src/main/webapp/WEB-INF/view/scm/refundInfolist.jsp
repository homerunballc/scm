<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
						   
							<c:forEach items="${reinfolist}" var="list">
										<tr style="cursor: pointer;" onclick="reinfo(${list.return_id})">
											<td>${list.sales_nm}</td>
											<td>${list.wanted_date}</td>
											<td>${list.return_cnt}</td>
											<td>${list.avg}</td>
							</c:forEach>
							<input type="hidden" id="total" name="total" value ="${total}"/>
							
