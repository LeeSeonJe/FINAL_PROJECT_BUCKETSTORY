package com.kh.BucketStory.expert.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.expert.model.exception.ExpertException;
import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.service.ExpertService2;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;
import com.kh.BucketStory.expert.model.vo.pagination;

@Controller
public class ExpertController2 {
	
	// 의존성주입
	@Autowired
	private ExpertService ExService;
	
	@Autowired
	private ExpertService2 ExService2;
	
	// 테스트
	@RequestMapping("gogo.ex")
	public String expertInfo1() {
		return "hp_common";
	}
	
	// 전문가 메인페이지
	@RequestMapping("expertIntro.ex")
	public String expertInfo2() {
		return "hp_intro";
	}
	
	// 헬퍼뷰어 페이지
	@RequestMapping("helperView.ex")
	public ModelAndView  goHelperView(@RequestParam("coid") String coId,
			ModelAndView mv) {
		Company company = ExService.selectCompanyInfo(coId);
		mv.addObject("com", company);
		mv.setViewName("hp_helperView");
		return mv;
	}
	
//	<!-- 	coId 기업아이디 -->
//	<!-- 	coPwd 비밀번호 -->
//	<!-- 	coName 기업명-->
//	<!-- 	compaName 업종명 -->
//	<!-- 	apName 신청자이름 -->
//	<!-- 	homePage 홈페이지 -->
//	<!-- 	coTel 전화번호 -->
//	<!-- 	enrollDate 가입날짜 -->
//	<!-- 	status -->
//	<!-- 	approval 승인여부 -->
//	<!--    busiEmail 이메일 -->
//	<!-- 	cpCheck 기업전문가여부 -->
//	<!-- 	checkImg 인증사진 -->
//	<!--    point 포인트 -->
//	<!-- 	cateNum 카테고리 번호 -->
//	<!-- 	coIntro 업체소개-->
//	<!--    coInfo 업체정보-->

	/*
	 * 		public Company(String coId, String coName, String homePage, String coTel, Date enrollDate, String busiEmail,
				int cpCheck, String checkImg, int cateNum, String coIntro, String coInfo) {
			super();
			this.coId = coId;
			this.coName = coName;
			this.homePage = homePage;
			this.coTel = coTel;
			this.enrollDate = enrollDate;
			this.busiEmail = busiEmail;
			this.cpCheck = cpCheck;
			this.checkImg = checkImg;
			this.cateNum = cateNum;
			this.coIntro = coIntro;
			this.coInfo = coInfo;
		}
	 */
	@RequestMapping("helperUpdate.ex")
	public void helperUpdate(HttpServletRequest request) {
		
	    String coId = request.getParameter("coId");
	    System.out.println(coId);
		String coName = request.getParameter("coName");
		String compaName = request.getParameter("compaName");
		String coIntro = request.getParameter("coIntro");
		
//		Company c = new Company()
		

		 int result = ExService2.updateCompany(coName,compaName,coIntro);
		 
		 
		System.out.println("진입");
		
		System.out.println(coName + ", " + compaName);

	}
	
//	
//	// 헬퍼수정 페이지
	@RequestMapping("helperEdit.ex")
	public ModelAndView goHelperEdit(@RequestParam("coid") String coId,
			ModelAndView mv)  {
		
		Company company = ExService.selectCompanyInfo(coId);
		mv.addObject("com", company);
		mv.setViewName("hp_helperEdit");
		return mv;
	}
	
	// 헬퍼버킷리스트 페이지
	@RequestMapping("helperBucketList.ex")
	public String goHelperBucketList() {
		return "hp_helperBucketList";
	}
	
	
	@RequestMapping("ptest.ex")
	public void test(@ModelAttribute Pay p,HttpServletRequest request) {
		System.out.println(p.toString());
	}
	
	// 포인트 충전
	@RequestMapping("pinsert.ex")
	public String pointInsert(@ModelAttribute Pay p,HttpServletRequest request) {
		
		System.out.println(p);
		
		// PAY 테이블에 Point 집어넣기
		int result = ExService2.insertPoint(p);

		// COMPANY 테이블에 보유 포인트 갱신
		/* update COMPANY set POINT = POINT + p.getPa_pay()
		   where COID = p.getCoid() */
		
		
		if (result > 0) {
			return "redirect:pointList.ex";
		} else {
			throw new ExpertException("포인트 충전에 실패하였습니다.");
		}

	}
	
	// 포인트 충전페이지(coid)
	@RequestMapping("point.ex")
	public ModelAndView goPoint(@RequestParam("coid") String coId,
								ModelAndView mv) {

		if(ExService2.getListCount(coId) > 0) {
			mv.addObject("hp", getPoint(coId));
		}else {
			mv.addObject("hp", 0);
		}
		
		mv.addObject("coId",coId);
		mv.setViewName("hp_point");
		return mv;
	}
	
	// 보유 포인트(coId)
	public int getPoint(String coId) {
		int yPoint = ExService2.getYPoint(coId); // 충전 포인트
		int nPoint = ExService2.getNPoint(coId); // 사용 포인트
		return yPoint - nPoint;
	}
	
	
	// 포인트 내역 페이지(전체)
	@RequestMapping("pointList.ex")
	public ModelAndView pointList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = ExService2.getListCount();
		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		ArrayList<Pay> list = ExService2.selectList(pi);
		
		if (list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);			
			mv.setViewName("hp_pointListAll");
		} else {
			throw new ExpertException("포인트 내역 조회에 실패했습니다.");
		}
		return mv;
	}
	
	
	// 포인트 내역 페이지(coid)
	// 테스팅
	// http://localhost:9480/BucketStory/pointList2.ex?coid=TEST
	// http://localhost:9480/BucketStory/pointList2.ex?coid=KH_ACADEMY
	
	@RequestMapping(value = "pointList2.ex", method = RequestMethod.GET)
		public ModelAndView pointList(@RequestParam("coid") String coId,
									  @RequestParam(value = "page", required = false) Integer page, ModelAndView mv){

			int currentPage = 1;
			if (page != null) {
				currentPage = page;
			}

			int listCount = ExService2.getListCount(coId);
			PageInfo pi = pagination.getPageInfo(currentPage, listCount);
			ArrayList<Pay> list = ExService2.selectList(pi, coId);
//			System.out.println(list);
			if (list != null) {
				// list, pi, view
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.addObject("coId", coId);
				if(listCount > 0) {
					mv.addObject("hp", getPoint(coId));
				}else { // 포인트 내역이 없으면
					mv.addObject("hp", 0);
				}
				mv.setViewName("hp_pointList");
			} else {
				throw new ExpertException("포인트 내역 조회에 실패했습니다.");
			}
			return mv;
		}
		
	
	
	// 헬퍼 qna 문의 페이지
	@RequestMapping("helperSendQnA.ex")
	public String goHelperSendQnA() {
		return "hp_sendQnA";
	}
	
	// 헬퍼 qna 문의확인 페이지
	@RequestMapping("helperQnA.ex")
	public String goHelperQnA() {
		return "hp_QnA";
	}
}
