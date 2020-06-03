package com.kh.BucketStory.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	
	@RequestMapping("writer.me")
	public String writer() {
		return "writer";
	}
	
	
	@RequestMapping("test.me")
	public String test(@RequestParam("ir1") String ir1, Model model) {
		System.out.println(ir1);
		ir1 = ir1.replaceAll(System.getProperty("line.separator"), " ");
		model.addAttribute("ir1", ir1);
		return "test";
	}
	
	@RequestMapping("update.me")
	public String update(@RequestParam("ir1") String ir1, Model model) {
		System.out.println(ir1);
		model.addAttribute("ir1", ir1);
		return "update";
	}
	
	@RequestMapping("myBucket.me")
	public String MyPageBucket() {
		return "MyPageBucket";
	}
	
	@RequestMapping("bucketWrite.me")
	public String BucketWrite() {
		return "bucketWrite";
	}
	
	@RequestMapping("myBlog.me")
	public String BucketBlog() {
		return "bucketBlog";
	}
	
	
}
