package kr.happyjob.study.epc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.epc.dao.RefundRequestDao;
import kr.happyjob.study.epc.model.OrderListItemDTO;

@Service
public class RefundRequestServiceImpl implements RefundRequestService {

	@Autowired
	RefundRequestDao rrdao;
	
	public ArrayList<OrderListItemDTO> getOrderList(OrderListItemDTO param){
		
		ArrayList<OrderListItemDTO> result = rrdao.getOrderList(param);
		
		return result;
	}
	
	public ArrayList<OrderListItemDTO> getOrderDetailListByPurID(int pur_id) {
		
		ArrayList<OrderListItemDTO> result = rrdao.getOrderDetailListByPurID(pur_id);
		
		return result;
	}
}
