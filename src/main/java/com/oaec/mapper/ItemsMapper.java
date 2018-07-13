package com.oaec.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.oaec.pojo.Items;

@Repository
public interface ItemsMapper {
	
	public List<Items> getAllItems();
}
