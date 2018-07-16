package com.oaec.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

	
	@RequestMapping("/insertOneItem")
	public String insertOneItem(Items items,MultipartFile item_Pic) throws Exception{
		String oFileName = item_Pic.getOriginalFilename();
		File file = new File("e:\\images\\"+oFileName);
		item_Pic.transferTo(file);
		items.setItemPic(oFileName);
		itemsService.insertOneItem(items);
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ItemsService getItemsService() {
		return itemsService;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}
	
	
	
	
}
