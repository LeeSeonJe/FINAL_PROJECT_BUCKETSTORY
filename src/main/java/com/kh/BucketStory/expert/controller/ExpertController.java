package com.kh.BucketStory.expert.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.vo.Company;

@Controller
public class ExpertController {
	
	@Autowired
	private ExpertService bService;
	
	@RequestMapping("info.ex")
	public ModelAndView expertInfo(@RequestParam("coid") String coId, ModelAndView mv) {
		Company company = bService.selectCompanyInfo(coId);
		mv.addObject("company",company);
		mv.setViewName("ex_info");
		return mv;
	}
	
	@RequestMapping("estimate.ex")
	public String extrimateView() {
		return "estimate";
	}
}
