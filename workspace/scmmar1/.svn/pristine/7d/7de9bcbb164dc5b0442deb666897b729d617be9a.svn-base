package kr.happyjob.study.epc.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.happyjob.study.epc.model.OrderListItemDTO;
import kr.happyjob.study.epc.service.RefundRequestService;

@Controller
@RequestMapping(value="/epc")
public class RefundRequestController {

	@Autowired
	RefundRequestService rrservice;
	
	@RequestMapping(value="refundRequest", method=RequestMethod.GET)
	public String rr() {

		return "epc/refundRequest";
	}
	
	
	@RequestMapping(value="getOrderList", method= RequestMethod.POST)
	public String gol(Model model) {
		
		OrderListItemDTO param = new OrderListItemDTO();
		param.setLoginID("apple");	//param.setLoginID((String)session.getAttribute("loginId"));
		ArrayList<OrderListItemDTO> itemList = rrservice.getOrderList(param);
		model.addAttribute("orderRecordList", itemList);
		
		return "epc/refundRequestOrderListTbody";
	}
	
	@RequestMapping(value="getOrderDetail", method= RequestMethod.POST)
	public String god(Model model, @RequestParam(defaultValue="63", required=false) int pur_id) {
		
/*		OrderListItemDTO item = new OrderListItemDTO();
		item.setLoginID("testID");
		item.setMfcomp("testMfcomp");
		item.setModel_nm("testModelName");
		item.setPrice(123456);
		item.setPur_id(pur_id);
		item.setPur_cnt(45);
		item.setPurdate("2022-04-07");
		item.setSales_type("iphone");
		item.setWanted_date("2022-04-12");
		item.setDeliv_type("U");*/
		
		ArrayList<OrderListItemDTO> itemList = rrservice.getOrderDetailListByPurID(pur_id);
		model.addAttribute("orderDetailList", itemList);
		
		return "epc/refundRequestOrderDetailTbody";
	}
	
}
