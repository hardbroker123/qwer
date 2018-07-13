package com.oaec.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oaec.pojo.Items;
import com.oaec.service.ItemsService;

@Controller
@RequestMapping("/pages")
public class ItemsController {
	@Autowired
	ItemsService itemsService;
	
	@RequestMapping("/getAllItems")
	public String getAllItems(HttpSession session){
		List<Items> itemsList = itemsService.getAllItems();
		session.setAttribute("itemsList", itemsList);
		return "show";
	}

	
	
	
	
	
	
	
	
	public ItemsService getItemsService() {
		return itemsService;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}
	
	
	
	
}
