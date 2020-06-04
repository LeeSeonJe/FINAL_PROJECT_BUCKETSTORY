package com.kh.BucketStory.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.main.model.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("main.ho")
	public ModelAndView Main(@RequestParam("menuNum") int menuNum, @RequestParam("category") int category,
						ModelAndView mv) {
		ArrayList<BucketList> bucketList = mainService.selectBucketList();
		ArrayList<Media> blImg = mainService.selectBucketImg();
		mv.addObject("bucketList", bucketList);
		mv.addObject("blImg", blImg);
		
		
		if(menuNum == 1) {
			switch(category) {
			case 1: mv.setViewName("mainList");break;
			case 2: mv.setViewName("mainList2");break;
			case 3: mv.setViewName("mainList3");break;
			case 4: mv.setViewName("mainList4");break;
			case 5: mv.setViewName("mainList5");break;
			case 6: mv.setViewName("mainList6");break;
			case 7: mv.setViewName("mainList7");break;
			case 8: mv.setViewName("mainList8");break;
			case 9: mv.setViewName("mainList9");break;
			}
		} else if(menuNum == 2) {
			switch(category) {
			case 1: mv.setViewName("mainRanking");break;
			case 2: mv.setViewName("mainRanking2");break;
			case 3: mv.setViewName("mainRanking3");break;
			case 4: mv.setViewName("mainRanking4");break;
			case 5: mv.setViewName("mainRanking5");break;
			case 6: mv.setViewName("mainRanking6");break;
			case 7: mv.setViewName("mainRanking7");break;
			case 8: mv.setViewName("mainRanking8");break;
			case 9: mv.setViewName("mainRanking9");break;
			}
		} else if(menuNum == 3) {
			switch(category) {
			case 1: mv.setViewName("mainRecomment");break;
			case 2: mv.setViewName("mainRecomment2");break;
			case 3: mv.setViewName("mainRecomment3");break;
			case 4: mv.setViewName("mainRecomment4");break;
			case 5: mv.setViewName("mainRecomment5");break;
			case 6: mv.setViewName("mainRecomment6");break;
			case 7: mv.setViewName("mainRecomment7");break;
			case 8: mv.setViewName("mainRecomment8");break;
			case 9: mv.setViewName("mainRecomment9");break;
			}
		} else {
			switch(category) {
			case 1: mv.setViewName("mainCompany");break;
			case 2: mv.setViewName("mainCompany2");break;
			case 3: mv.setViewName("mainCompany3");break;
			case 4: mv.setViewName("mainCompany4");break;
			case 5: mv.setViewName("mainCompany5");break;
			case 6: mv.setViewName("mainCompany6");break;
			case 7: mv.setViewName("mainCompany7");break;
			case 8: mv.setViewName("mainCompany8");break;
			case 9: mv.setViewName("mainCompany9");break;
			}
		}
		
		return mv;
	}
	
	@RequestMapping("delogin.ho")
	public ModelAndView deLogin(ModelAndView mv, HttpSession session) {
		
		Date today = new Date(0);
		Member loginUser = new Member("hanho", "1234", "name03", "010-1234-5678", "rgvefc1@naver.com", "1993/12/15", "M", "nick03", "N", null, 0, today);
		System.out.println(loginUser);
		session.setAttribute("loginUser", loginUser);
		
		mv.addObject("menuNum", 1);
		mv.addObject("category", 1);
		mv.setViewName("redirect:main.ho");
		
		return mv;
	}
	
	@RequestMapping("blLike.ho")
	public void BucketLikeUp(@RequestParam("bkNo") int bkNo, HttpSession session, HttpServletResponse response) {
		String UserId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		int blLike = mainService.blLike(bkNo, UserId);
		
		try {
			PrintWriter out = response.getWriter();
			
			out.append(blLike+"");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
