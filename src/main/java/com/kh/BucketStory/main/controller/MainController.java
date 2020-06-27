package com.kh.BucketStory.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.bucket.model.vo.Alarm;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.service.CommonService;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.C_event;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.main.model.service.MainService;
import com.kh.BucketStory.member.model.vo.Board;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private CommonService cService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
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
			ArrayList<BucketList> bucketList = mainService.selectRankBucketList();
			mv.addObject("bucketList", bucketList);
			mv.setViewName("mainRanking");
		} else if(menuNum == 3) {
			ArrayList<BucketList> bucketList = mainService.selectRecoBucketList();
			mv.addObject("bucketList", bucketList);
			mv.setViewName("mainRecomment");
		} else {
			ArrayList<Company> cList = mainService.selectCompany();
			ArrayList<Media> mList = mainService.selectCompMedia();
			mv.addObject("cList", cList);
			mv.addObject("mList", mList);
			mv.setViewName("mainCompany");
		}
		return mv;
	}
	
	@RequestMapping("myInfo.ho")
	public String myInfoView() {
		return "myInfo";
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
	public void BucketWish(@RequestParam("bkNo") int bkNo,@RequestParam("bucketId") String bucketId, HttpSession session, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String UserId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		String wishCheck = mainService.blWish(bkNo, UserId, bucketId);
		
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
	public ModelAndView festivalView(@RequestParam("year") String year, ModelAndView mv, @RequestParam("check") int check) {
		if(check == 1) {
			ArrayList<Festival> fList = mainService.selectFestival(year);
			ArrayList<Media> mList = mainService.selectFmList();
			mv.addObject("fList", fList);
			mv.addObject("mList", mList);
			mv.addObject("year", year);
			mv.setViewName("mainFestival");
		} else if(check == 2) {
			ArrayList<C_event> fList = mainService.selectCpFestival(year);
			mv.addObject("fList", fList);
			mv.addObject("year", year);
			mv.setViewName("mainCpFestival");
		}
		
		return mv;
	}
	
	@RequestMapping("deleteCoBucket.ho")
	public String deleteCoBucekt(@RequestParam("bkNo") int bkNo, HttpSession session) {
		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		
		int result = mainService.deleteCoBucekt(bkNo, coId);
		
		return "redirect:helperBucket.ho";
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
		ArrayList<Company> AllCompany = mainService.selectAllCompany();
		
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
		for(Company c : AllCompany) {
			searchList.add("c:"+c.getCoName());
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
		
		ArrayList<BucketList> bucketList = mainService.selectSearchBucket(b);
		
		mv.addObject("searchValue", b);
		mv.addObject("blImg", blImg);
		mv.addObject("blogList", blogList);
		mv.addObject("bucketList", bucketList);
		
		mv.setViewName("searchBucket");
		return mv;
	}
	
	@RequestMapping("searchTag.ho")
	public ModelAndView searchTag(ModelAndView mv, @RequestParam("t") String t, HttpSession session) {
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
		
		ArrayList<BucketList> bucketList = mainService.selectSearchTag(t);
		
		mv.addObject("searchValue", t);
		mv.addObject("blImg", blImg);
		mv.addObject("blogList", blogList);
		mv.addObject("bucketList", bucketList);
		
		mv.setViewName("searchBucket");
		return mv;
	}
	
	@RequestMapping("searchCompany.ho")
	public ModelAndView searchCompany(ModelAndView mv, @RequestParam("c") String c) {
		ArrayList<Company> cList = mainService.selectSearchCompany(c);
		ArrayList<Media> mList = mainService.selectCompMedia();
		
		System.out.println(cList);
		
		mv.addObject("searchValue", c);
		mv.addObject("cList", cList);
		mv.addObject("mList", mList);
		mv.setViewName("searchCompany");
		return mv;
	}
	
	@RequestMapping("helperBucket.ho")
	public String helperBucketView(Model m,HttpSession session) {
		
		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		ArrayList<Media> blImg = mainService.selectBucketImg();
		ArrayList<Board> blogList = mainService.selectBlogList();
		
		ArrayList<BucketList> bucketList = mainService.selectCoBucket(coId);
		
		m.addAttribute("bucketList", bucketList);
		m.addAttribute("blogList", blogList);
		m.addAttribute("blImg", blImg);
		
		return "HelperBucket";
	}
	
	@RequestMapping("bkDetailWhatAdd.ho")
	@ResponseBody
	public String bucketDetailWhatAdd(@RequestParam("bkNo") int bkNo, HttpSession session) {
		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		
		String returnString = "";
		
		int result = mainService.countDetailWhat(bkNo, coId);
		if(result > 0) {
			returnString = "1";
		} else {
			returnString = "0";
		}
		
		return returnString;
	}
	
	@RequestMapping("bkDetailCompany.ho")
	public void bkDetailCompany(@RequestParam("bkNo") int bkNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Company> list = mainService.selectDetailCompany(bkNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("cpDetailSup.ho")
	public void cpDetilaSup(@RequestParam("coId") String coId, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<BucketList> list = mainService.selectDetailSup(coId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("bkDetailCpFestival.ho")
	public void bkDetailCpFestival(@RequestParam("bkNo") int bkNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<C_event> list = mainService.selectCpEvent(bkNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("nickCheck.ho")
	@ResponseBody
	public String nickCheck(@RequestParam("nickName") String nickName) {
		String returnString = null;
		
		int count = mainService.selectNickCheck(nickName);
		if(count > 0) {
			returnString = "fail";
		} else {
			returnString = "success";
		}
		return returnString;
	}
	
	@RequestMapping("updateMember.ho")
	public String updateMember(@ModelAttribute Member m, HttpSession session,
							   @RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		m.setUserId(userId);
		
		String phone = "010-"+phone1+"-"+phone2;
		m.setPhone(phone);
		
		int result = mainService.updateMember(m);
		if(result > 0) {
			Member member = new Member();
			member.setUserId(userId);
			Member loginUser = cService.memberLogin(member); 
			session.setAttribute("loginUser", loginUser);
		} else {
			System.out.println("업데이트 실패");
		}
		return "myInfo";
	}
	
	@RequestMapping("passCheck.ho")
	@ResponseBody
	public String passCheck(@RequestParam("nowPw") String nowPw, HttpSession session) {
		String returnString = null;
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(bcryptPasswordEncoder.matches(nowPw, loginUser.getUserPwd())) {
			returnString = "success";
		} else {
			returnString = "fail";
		}
		
		return returnString;
	}
	
	@RequestMapping("updatePassword.ho")
	public String updatePassword(@RequestParam("pw") String pw, HttpSession session) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		String encPwd = bcryptPasswordEncoder.encode(pw);
		
		int result = mainService.updatePwd(userId, encPwd);
		if(result>0) {
			Member member = new Member();
			member.setUserId(userId);
			Member loginUser = cService.memberLogin(member); 
			session.setAttribute("loginUser", loginUser);
		} else {
			System.out.println("비번 업데이트 실패");
		}
		return "myInfo";
	}
	
	@RequestMapping("selectAlert.ho")
	public void selectAlert(HttpSession session, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<Alarm> list = mainService.selectAlert(userId);
		System.out.println(list);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
