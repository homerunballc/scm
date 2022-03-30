<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		
		
		
		$('body').on('click','.userInfoBtnArea button',function(e){
			e.preventDefault();
			
			var param={
					action: '',
					userId: ''
			}
			console.log($(this).attr('id'));
			switch($(this).attr('id')){
				case 'btnEditUserInfo' :
					alert('임시수정테스트');
					break;
				case 'closeModal' :{
					console.log('closeModal called');
					$('#userinfoarea').remove();
					return;
					}
				case 'regUserBtn' :
					alert('임시메시지 : 신규 유저를 등록합니다');
					
					
					
				case 'regFormBtn' :
					param.action='NEW';
					break;
			}
			
			fuserFormPop(param);
					
					
		})
		
		$('#userModalForm').on('change','#sb-userType',function(){
			console.log($(this).val());
			if($(this).val()=='Cust'){
				$('#userModalForm .empInfo').remove();
				$('.basicinfo-row1').after($(getAdditionalInfoFormForCust()));
			}else{
				$('#userModalForm .custInfo').remove();
				$('.basicinfo-row2').after($(getAdditionalInfoFormForEMP()));
			}
		})
		
	})
	
	
	
	
	function fuserFormPop(param){
		
		callAjax('${CTX_PATH}/scm/userinfo/getForm', 'post', 'text', false, param, fafterAjaxSuccess);
		
		if(param.action=='NEW'){
			$('.basicinfo-row1').after($(getAdditionalInfoFormForCust()));
			$('#btnEditUserInfo').attr('id','regUserBtn').text('등록');
		}
		
	}
	
	function fafterAjaxSuccess(data){
		console.log('do afterSuccess func');
		$('#userModalForm').empty().append($(data));
		
		
	}
	
	
	function getAdditionalInfoFormForEMP(){
		var html='';
			html+='<tr class="empInfo">\r\n';
			html+='<td>\r\n';
			html+='<span>직원명</span>\r\n';
			html+='</td>\r\n';
			html+='<td>\r\n';
			html+='<input type="text" name="name"\r\n';
			html+='</td>\r\n';
			html+='<td>\r\n';
			html+='<span>담당업무</span>\r\n';
			html+='</td>\r\n';
			html+='<td>\r\n'
			html+='<select>\r\n';
			html+='<option value="A">SCM</option>\r\n';
			html+='<option value="B">배송</option>\r\n';
			html+='<option value="D">구매</option>\r\n';
			html+='<option value="E">임원</option>\r\n';
			html+='</select>\r\n';
			html+='</td>\r\n';
			html+='</tr>';
		return html;
		
	}
	
	function getAdditionalInfoFormForCust(){
		var html='';
		html+='<tr class="custInfo">\r\n';
		html+='<td>\r\n';
		html+='<span>회사명</span>\r\n';
		html+='</td>\r\n';
		html+='<td>\r\n';
		html+='<input type="text" name="client"\r\n';
		html+='</td>\r\n';
		html+='<td>\r\n';
		html+='<span>담당자명</span>\r\n';
		html+='</td>\r\n';
		html+='<td>\r\n'
		html+='<input type="text" name="name"\r\n';
		html+='</td>\r\n';
		html+='</tr>';
		return html;
		
	}
	

</script>