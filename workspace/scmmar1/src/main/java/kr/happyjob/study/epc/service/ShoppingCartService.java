package kr.happyjob.study.epc.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.happyjob.study.epc.model.ShoppingCartItemDTO;

public interface ShoppingCartService {

	public abstract ArrayList<ShoppingCartItemDTO> getCartList(String loginID);
	public abstract int deleteCartItem(HashMap<String, String> params);
	public abstract int orderProducts(String data, String loginID);
	
	
}
