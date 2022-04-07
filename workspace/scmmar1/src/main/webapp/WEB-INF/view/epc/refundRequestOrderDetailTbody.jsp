<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <c:forEach items="${orderDetailList}" var="item">
                <tr>
                    <td>
                        <input type="checkbox" name="isRefund" id="isRefund">
                    </td>
                    <td>
                        <input type="number" name="refund_cnt" id="refund_cnt" value="0">
                    </td>
                    <td>
                        <span name="pur_id" id="pur_id">${item.pur_id}</span>
                    </td>
                    <td>
                        <span name="sales_type" id="sales_type">${item.sales_type}</span>
                    </td>
                    <td>
                        <span name="model_nm" id="model_nm">${item.model_nm}</span>
                    </td>
                    <td>
                        <span name="mfcomp" id="mfcomp">${item.mfcomp}</span>
                    </td>
                    <td>
                        <span name="price" id="price">${item.price}</span>
                    </td>
                    <td>
                        <span name="pur_cnt" id="pur_cnt">${item.pur_cnt}</span>
                    </td>
                    <td>
                        <span name="total_price" id="total_price">hello"</span>
                    </td>
                </tr>
            </c:forEach>