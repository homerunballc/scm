<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<tr>
	<th scope="row" align="center">강의 제목</th>
	<td colspan="3">${lec_info.lec_name }</td>
</tr>
<tr>
	<th scope="row" align="center">강의실 번호</th>
	<td colspan="3"> 강의실 ${lec_info.room_no }</td>
</tr>
<tr>
	<th scope="row" align="center">강의 인원수</th>
	<td colspan="3"> ${lec_info.lec_cnt }명</td>
</tr>
<tr id="birthday1">
	<th scope="row" align="center">강의 시작일</th>
	<td> ${lec_info.lec_start } ~</td>
</tr>
<tr id="birthday1">
	<th scope="row" align="center">강의 종료일</th>
	<td>~ ${lec_info.lec_end }</td>
</tr>
<tr>
	<th scope="row" align="center">강의 목표</th>
	<td colspan="3"> ${lec_info.lec_goal }</td>
</tr>
<tr>
	<th scope="row" align="center">강의계획서</th>
	<td colspan="3"><a href='javascript:filedownload(${lec_info.lec_no} )'> ${lec_info.lec_file} </a>    </td>
</tr>


