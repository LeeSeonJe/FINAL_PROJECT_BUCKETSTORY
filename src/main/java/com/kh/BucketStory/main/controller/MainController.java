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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.main.model.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("main.ho")
	public ModelAndView Main(@RequestParam("menuNum") int menuNum, @RequestParam("category") int category,
						ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		ArrayList<BucketList> bucketList = mainService.selectBucketList();
		ArrayList<Media> blImg = mainService.selectBucketImg();
		ArrayList<WishList> wishList = mainService.selectWishList(userId);
		ArrayList<ShareBucket> shareList = mainService.selectShareList(userId);
		mv.addObject("bucketList", bucketList);
		mv.addObject("blImg", blImg);
		mv.addObject("wishList", wishList);
		mv.addObject("category", category);
		mv.addObject("shareList", shareList);
		
		if(menuNum == 1) {
			mv.setViewName("mainList");
		} else if(menuNum == 2) {
			mv.setViewName("mainRanking");
		} else if(menuNum == 3) {
			mv.setViewName("mainRecomment");
		} else {
			mv.setViewName("mainCompany");
		}
		return mv;
	}
	
	@RequestMapping("blLike.ho")
	public void BucketLike(@RequestParam("bkNo") int bkNo, HttpSession session, HttpServletResponse response) {
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
	
	@RequestMapping("wishRegi.ho")
	public void BucketWish(@RequestParam("bkNo") int bkNo, HttpSession session, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String UserId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		String wishCheck = mainService.blWish(bkNo, UserId);
		
		PrintWriter out;
		try {
			out = response.getWriter();
			
			out.append(wishCheck);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("sharebl.ho")
	@ResponseBody
	public String BucketShare(@RequestParam("bkNo") int bkNo, HttpSession session) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		int result = mainService.blShare(bkNo, userId);
		
		String returnString = "";
		if(result > 0) {
			returnString = "success";
		} else {
			System.out.println("실패");
		}
		return returnString;
	}
	
	@RequestMapping("festival.ho")
	public String festivalView() {
		return "mainFestival";
	}
	
}
