<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>

<style>
	.searchArea{
		margin-top: 35px;
	    padding: 50px 0;
	    border: 2px solid rgb(190,190,190);
	}
	#searchBtnWrap{
		display: inline-block;
		margin: 0 10px;
	}
	#userinfoarea{
		padding: 10px;
		border: 2px solid rgb(190,190,190);
		
	}
	#userinfoarea table{
		border-collapse: separate;
		border-spacing: 0 10px;
		
	}
	#userinfoarea table input, #userinfoarea table select{
		margin:0 10px;
		
	}
	.userInfoBtnArea{
		margin-top: 10px;
	}

</style>

<title>Job Korea :: 기업고객/직원정보 관리</title>
</head>
<body>



	<div id="mask"></div>
	
	
	<!-- Global Wrap Area -->
	
	<div id="wrap_area">
	
		<!-- Header -->
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
		
		<!-- Content -->
		<div id="container">
			<ul>
			
			
				<li class="lnb">
					<%-- <%@ include file="/WEB-INF/view/common/lnbMenu.jsp" %> --%>
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
				</li>
				
				<li class="contents">
					<div class="content">
						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home"></a>
							<span class="btn_nav bold">기준정보</span>
							<span class="btn_nav bold">기업고객/직원정보관리</span>
							<a href="${CTX_PATH}/scm/userinfo.do" class="btn_set refresh"></a>
						</p>
						
						<!-- SearchArea -->
						<div class="searchArea">
							<table style="margin-top: 10px" width="100%" cellpadding="5" cellsapcing="0" border="1">
							   <tr style="border: 0px; border-color: blue">
		                           <td width="80" height="25" style="font-size: 120%;">&nbsp;&nbsp;</td>
		                           <td width="50" height="25" style="font-size: 100%; text-align:left; padding-right:25px;">
		     	                       <select id="searchKey" name="searchKey" style="width: 150px;" v-model="searchKey">
											<option value="comp_nm" >회사명</option>
											<option value="emp_nm" >직원명</option>
											<option value="user_nm">담당자명</option>
											<option value="task">담당업무</option>
									   </select>
									   
						
		     	                       <input type="text" style="width: 300px; height: 25px;" id="sname" name="sname">
		     	                       <input type="checkbox" name="showdeletedataYN">
		     	                       <span style="margin-left: 5px">삭제된 정보 표시</span>
		     	                       <div class="bts" id="searchBtnWrap">
		     	                       		<button type="button" class="btn btn-info">검색</button>
		     	                       </div>                 
			                           
		                            </td> 
	                        	</tr>
							</table>
						</div>
						
						<!-- UserListArea -->
						<div id="userListArea"></div>
						
						<!-- Register And Delete Btn Area -->
						<div class="bts userInfoBtnArea" style="margin: 10px 0">
							<div class="text-right">
								<button type="button" class="btn btn-info" id="regFormBtn">신규등록</button>
								<button type="button" class="btn btn-danger" id="delUserBtn">삭제</button>
							</div>
						</div>
						
						<!-- User Form Area -->
						<form id="userModalForm"></form>
						
						
						
						
						
						
						
						
					</div>
					
					
					
	
				</li>
				
			</ul>
		</div>
		
		
	
	</div>
	
	
	
	
	
	<!-- Modal Area -->
	




</body>


<%@include file="/WEB-INF/view/usermng/pageset/usermngmainPageset.jsp" %>
</html>