package com.kh.BucketStory.expert.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.expert.model.exception.ExpertException;
import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.vo.Company;

@Controller
public class ExpertController {
	
	@Autowired
	private ExpertService ExService;
	
	@RequestMapping("info.ex")
	public ModelAndView expertInfo(@RequestParam("coid") String coId, ModelAndView mv) {
		Company company = ExService.selectCompanyInfo(coId);
		mv.addObject("company",company);
		mv.setViewName("ex_info");
		System.out.println(company.getCoId());
		return mv;
	}
	
	@RequestMapping("ex_infoUpdateForm.ex")
	public ModelAndView ex_infoUpdateForm(@RequestParam("coid") String coId,ModelAndView mv) {
		Company company = ExService.selectCompanyInfo(coId);
		mv.addObject(company);
		mv.setViewName("ex_infoUpdateForm");
		return mv;
	}
	
	@RequestMapping("expertUpdate.ex")
	public ModelAndView expertInfoUpdate(@ModelAttribute Company com,ModelAndView mv) {
		System.out.println(com.getCoId());
		System.out.println(com.getCoInfo());
		System.out.println(com.getCoIntro());
		int result = ExService.updateExInfo(com);
		System.out.println(result);
		if(result>0) {
			mv.setViewName("redirect:info.ex?coid="+com.getCoId());
		}else {
			throw new ExpertException("게시글 수정에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("estimate.ex")
	public String extrimateView() {
		return "estimate";
	}
}
