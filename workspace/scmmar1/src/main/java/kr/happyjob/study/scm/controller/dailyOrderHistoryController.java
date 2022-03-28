package kr.happyjob.study.scm.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/scm/")
public class dailyOrderHistoryController {
	
	
	// 화면 이동
	@RequestMapping("dailyOrderHistory.do")
	public String initApproval(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
		return "scm/dailyOrderHistory";
	}
}
