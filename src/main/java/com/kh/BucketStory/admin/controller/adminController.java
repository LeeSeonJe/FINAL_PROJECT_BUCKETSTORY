package com.kh.BucketStory.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	@RequestMapping("admin.ad")
	public String adminWrite() {
		return "adminCaution";
	}
	
}
