package com.oaec.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oaec.mapper.ItemsMapper;
import com.oaec.pojo.Items;
import com.oaec.service.ItemsService;
@Service
public class ItemsServiceImpl implements ItemsService{
	@Autowired
	ItemsMapper itemsMapper;

	@Override
	public List<Items> getAllItems() {
		return itemsMapper.getAllItems();
	}
	
	
	
	
	
	
	
	
	
	
	public ItemsMapper getItemsMapper() {
		return itemsMapper;
	}

	public void setItemsMapper(ItemsMapper itemsMapper) {
		this.itemsMapper = itemsMapper;
	}

	
	
	

}
