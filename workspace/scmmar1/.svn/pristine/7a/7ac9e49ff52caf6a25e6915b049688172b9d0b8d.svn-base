package kr.happyjob.study.epc.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.epc.model.ShoppingCartItemDTO;
import kr.happyjob.study.epc.service.ShoppingCartService;

@Controller
@RequestMapping("/epc")
public class ShoppingCartController {

	@Autowired
	ShoppingCartService scservice;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@RequestMapping(value="/shoppingCart", method=RequestMethod.GET)
	public String sc() {
		
		return "epc/shoppingCart";
	}
	
	
	@RequestMapping(value="/getShoppingCartList", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<ShoppingCartItemDTO> gscl() {
		ArrayList<ShoppingCartItemDTO> list = scservice.getCartList("apple");
		
		return list;
	}
	
	@RequestMapping(value="/deleteCartItem", method=RequestMethod.POST)
	@ResponseBody
	public int dcl(HttpSession session,
			@RequestParam String sales_id) {
		HashMap<String,String> params = new HashMap<>();
		String loginId = (String)session.getAttribute("loginId");
		params.put("loginID", loginId);
		params.put("sales_id", sales_id);
		int result = scservice.deleteCartItem(params);
		logger.info(sales_id);
		logger.info(loginId);
		
		return result;
	}
	
	
	@RequestMapping(value="/payCart", method=RequestMethod.POST)
	@ResponseBody
	public int pc(HttpSession session, @RequestParam String param) {
		String loginId = (String)session.getAttribute("loginId");
		scservice.orderProducts(param, loginId);
	
		return 1;
	}
	
}

