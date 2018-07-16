package com.oaec.service;

import java.util.List;

import com.oaec.pojo.Items;;

public interface ItemsService {
	
	public List<Items> getAllItems();
	
	/**
	 * 添加商品
	 */
	public int insertOneItem(Items items);
}
