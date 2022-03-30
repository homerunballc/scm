package kr.happyjob.study.mgrScm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.happyjob.study.mgrScm.service.UserInfoService;

@Controller
@RequestMapping("/scm/userinfo/")
public class UserFormController {
	
	
	private UserInfoService uiService;
	
	public UserFormController() {
	
	}

	@Autowired
	public UserFormController(UserInfoService uiService) {

		this.uiService = uiService;
	}


	@RequestMapping("getForm")
	public String initUserForm(String action, String userID, Model model){
		
		System.out.println(action);
		System.out.println(userID);
		
		if(!action.equals("REGISTER")){
			
			// uiService.getUserInfo(userID);
			
		}
		
		
		model.addAttribute("action", action);
		
		
		
		
		
		return "usermng/system/userForm";
		
	}

}
