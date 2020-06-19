package com.kh.BucketStory.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.main.model.service.MainService;
import com.kh.BucketStory.member.model.vo.Board;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("main.ho")
	public ModelAndView Main(@RequestParam("menuNum") int menuNum, @RequestParam("category") int category,
						ModelAndView mv, HttpSession session) {
		
		String userId = null;
		if(session.getAttribute("loginUser") != null) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			userId = loginUser.getUserId();
		}
		
		
		ArrayList<Media> blImg = mainService.selectBucketImg();
		if(userId != null) {
			ArrayList<WishList> wishList = mainService.selectWishList(userId);
			ArrayList<ShareBucket> shareList = mainService.selectShareList(userId);
			mv.addObject("wishList", wishList);
			mv.addObject("shareList", shareList);
		}
		
		ArrayList<Board> blogList = mainService.selectBlogList();
		
		mv.addObject("blImg", blImg);
		mv.addObject("category", category);
		mv.addObject("blogList", blogList);
		
		if(menuNum == 1) {
			ArrayList<BucketList> bucketList = mainService.selectBucketList();
			mv.addObject("bucketList", bucketList);
			mv.setViewName("mainList");
		} else if(menuNum == 2) {
			mv.setViewName("mainRanking");
		} else if(menuNum == 3) {
			ArrayList<BucketList> bucketList = mainService.selectRecoBucketList();
			mv.addObject("bucketList", bucketList);
			mv.setViewName("mainRecomment");
		} else {
			mv.setViewName("mainCompany");
		}
		return mv;
	}
	
	@RequestMapping("Cmain.ho")
	public ModelAndView CompanyMain(@RequestParam("menuNum") int menuNum, @RequestParam("category") int category,
									ModelAndView mv, HttpSession session) {
		
		ArrayList<Media> blImg = mainService.selectBucketImg();
		ArrayList<Board> blogList = mainService.selectBlogList();
		
		mv.addObject("blImg", blImg);
		mv.addObject("category", category);
		mv.addObject("blogList", blogList);
		
		if(menuNum == 1) {
			ArrayList<BucketList> bucketList = mainService.selectBucketList();
			mv.addObject("bucketList", bucketList);
			mv.setViewName("CmainList");
		} else if(menuNum == 2) {
			mv.setViewName("CmainRanking");
		} else if(menuNum == 3) {
			ArrayList<BucketList> bucketList = mainService.selectRecoBucketList();
			mv.addObject("bucketList", bucketList);
			mv.setViewName("CmainRecomment");
		} else {
			mv.setViewName("CmainCompany");
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
	
	@RequestMapping("bkDetailMedia.ho")
	@ResponseBody
	public String BucketDetailImage(@RequestParam("bkNo") int bkNo) {
		
		ArrayList<Media> blImg = mainService.selectBucketImg();
		
		String returnString = "";
		for(int i=0;i<blImg.size();i++) {
			Media m = blImg.get(i);
			if(m.getBkno() == bkNo) {
				returnString = m.getMweb();
			}
		}
		return returnString;
	}
	
	@RequestMapping("bkDetailShare.ho")
	public void bucketDetailShare(@RequestParam("bkNo") int bkNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Member> ShareMList = mainService.selectShareMList(bkNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(ShareMList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("blogMedia.ho")
	public void bucketDetailBlogMedia(@RequestParam("bkNo") int bkNo, @RequestParam("nickName") String nickName, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Board> bMList = mainService.selectbMList(bkNo, nickName);
		ArrayList<String> list = new ArrayList<String>();
		for(Board b : bMList) {
			int val = b.getbContent().indexOf("blogUploade/");
			list.add(b.getbContent().substring(val + 12 , val + 66));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("bloginfo.ho")
	public void bucketBlogInfo(@RequestParam("bkNo") int bkNo, @RequestParam("nickName") String nickName, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Board> bMList = mainService.selectbMList(bkNo, nickName);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(bMList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("autosearch.ho")
	public void searchValues(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");

		ArrayList<Member> AllMember = mainService.selectAllMember();
		ArrayList<BucketList> AllBucket = mainService.selectAllBucket();
		
		ArrayList<String> searchList = new ArrayList<String>();
		for(Member m : AllMember) {
			searchList.add("m:"+m.getNickName());
		}
		for(BucketList b : AllBucket) {
			searchList.add("b:"+b.getBkName());
			String[] tags = b.getTag().split(",");
			for(String s : tags) {
				if(s != "") {
					searchList.add("t:"+s);
				}
			}
		}
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(searchList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("searchbucket.ho")
	public ModelAndView searchBucket(ModelAndView mv, @RequestParam("b") String b, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		ArrayList<Media> blImg = mainService.selectBucketImg();
		ArrayList<WishList> wishList = mainService.selectWishList(userId);
		ArrayList<ShareBucket> shareList = mainService.selectShareList(userId);
		ArrayList<Board> blogList = mainService.selectBlogList();
		
		ArrayList<BucketList> bucketList = mainService.selectSearchBucket(b);
		System.out.println(bucketList);
		
		mv.addObject("searchValue", b);
		mv.addObject("blImg", blImg);
		mv.addObject("wishList", wishList);
		mv.addObject("shareList", shareList);
		mv.addObject("blogList", blogList);
		mv.addObject("bucketList", bucketList);
		
		mv.setViewName("searchBucket");
		return mv;
	}
	
	@RequestMapping("searchTag.ho")
	public ModelAndView searchTag(ModelAndView mv, @RequestParam("t") String t, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		ArrayList<Media> blImg = mainService.selectBucketImg();
		ArrayList<WishList> wishList = mainService.selectWishList(userId);
		ArrayList<ShareBucket> shareList = mainService.selectShareList(userId);
		ArrayList<Board> blogList = mainService.selectBlogList();
		
		ArrayList<BucketList> bucketList = mainService.selectSearchTag(t);
		System.out.println(bucketList);
		
		mv.addObject("searchValue", t);
		mv.addObject("blImg", blImg);
		mv.addObject("wishList", wishList);
		mv.addObject("shareList", shareList);
		mv.addObject("blogList", blogList);
		mv.addObject("bucketList", bucketList);
		
		mv.setViewName("searchBucket");
		return mv;
	}
}
