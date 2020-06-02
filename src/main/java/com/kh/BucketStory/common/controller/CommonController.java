package com.kh.BucketStory.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.BucketStory.member.model.service.MemberService;

@SessionAttributes("loginUser")
@Controller
public class CommonController {
	
	@Autowired
	private MemberService mService;

	/*
	 * @Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	 */
	
	@RequestMapping("login.co")
	public String Login() {
		
		return "login";
		
		
		
		
	}
}
