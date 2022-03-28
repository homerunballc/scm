<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="content">
                          <div id="btable">
								<div class="bootstrap-table">
									<div class="fixed-table-toolbar">
										<div class="bs-bars pull-left"></div>
										<div class="columns columns-right btn-group pull-right">	</div>
									</div>
									<div class="fixed-table-container" style="padding-bottom: 0px;">
										<div class="fixed-table-body" style="height: 50%">		
												<table class="col">
													<caption>caption</caption>
													<colgroup>
													   <col width="5%">
													   <col width="35%">
														<col width="30%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
													</colgroup>
								
													<thead>
														<tr>
														    <th scope="col">NO</th>
														    <th scope="col">의료기기 이름</th>
															<th scope="col">업체명</th>
															<th scope="col">등록자</th>
															<th scope="col">날짜</th>
															<th scope="col">승인여부</th>
														</tr>
													</thead>
													<tbody id="listInf" v-for="(item,index) in items" v-if="items.length">
													      <tr >
														    <td >{{ item.accno }}</td>
														    <td  @click="ttt(item.accno)" style="cursor:hand;">{{ item.modelnm }}</td>
															<td>{{ item.copnm }}</td>
															<td>{{ item.regID }}</td>
															<td>{{ item.regDate | yyyyMMdd }}</td>		
															<td v-if ="item.accyn ==0" @click="ccc(item.accno)" style="cursor:hand;">승인대기</td>
															<td v-else-if ="item.accyn ==1" @click="ccc(item.accno)" style="cursor:hand;">승인</td>
															<td v-else-if ="item.accyn ==2" @click="ccc(item.accno)" style="cursor:hand;">반려</td>
															<td v-else style="cursor:no-drop;">-</td>
													</tbody>
												</table>
										</div>
	                                    <div>
												<div>
													<div class="clearfix" />
												</div>
										</div>
									 </div>		
								   </div>
								</div>			   

					        	<div class="paging_area"  id="listInfPagination"> </div>
					</div>
</html>