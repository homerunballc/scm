<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div id = "search">
						<p class="conTitle">
							<span>신고서 목록 / 조회 / 승인</span> 
							<span class="fr">
							  
							     <select id="searchgrouptype1"  name="searchgrouptype1" style="width: 150px; height: 25px" v-model = "searchgrouptype1" >
							            <option value="9" >전체</option>
							    		<option value="0" >승인대기</option>
							    		<option value="1" >승인</option>
							    		<option value="2" >반려</option>
							     </select> 
							     
							       <select id="searchgrouptype2"  name="searchgrouptype2" style="width: 150px; height: 25px" v-model = "searchgrouptype2">
							            <option value="all" >전체</option>
							    		<option value="codelnm" >의료기기 이름</option>
							    		<option value="copnm" >업체명</option>
							    		<option value="regID" >등록자</option>
							    		
							     </select> 
							     <input type="text" style="width: 300px; height: 25px;" id="sgroupinput" name="sgroupinput" v-model = "sch">
	                              <a onclick="listup()" class="btnType blue" id="btnSearchGrpcod" name="btn" ><span style="cursor:hand;">검  색</span></a>
	                              <a  onclick="mi()" class="btnType blue" id="mi" name="btn" ><span style="cursor:hand;">등  록</span></a>
							</span>
						</p>
					</div>
</html>