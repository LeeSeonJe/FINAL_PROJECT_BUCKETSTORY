package com.kh.BucketStory.expert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExpertController {
	
	@RequestMapping("info.ex")
	public String expertInfo() {
		return "ex_info";
	}
	
	@RequestMapping("estimate.ex")
	public String extrimateView() {
		return "estimate";
	}
}
