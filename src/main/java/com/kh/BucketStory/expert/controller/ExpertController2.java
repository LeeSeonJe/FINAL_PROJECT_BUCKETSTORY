package com.kh.BucketStory.expert.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.admin.model.vo.adminQnA;
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
	public ModelAndView expertInfo2(ModelAndView mv, HttpSession session) { 
		
		Company loginCom = (Company)session.getAttribute("loginCompany");
		
		// System.out.println(loginCom);
		
		// 기업 아이디
		String coId = loginCom.getCoId();
		
		System.out.println("기업아이디 :" + coId +"로 로그인하셨습니다.");
		
		mv.addObject("coid",coId);
		mv.setViewName("hp_intro");
		return mv;
	}
	
	
	
	// 헬퍼뷰어 페이지
	@RequestMapping("helperView.ex")
	public ModelAndView  goHelperView(HttpSession session,
			ModelAndView mv) {
		
		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		
		Company company = ExService.selectCompanyInfo(coId);
		mv.addObject("com", company);
		mv.setViewName("hp_helperView");
		return mv;
	}
	
	
//	@RequestMapping("helperView.ex")
//	public ModelAndView  goHelperView(@RequestParam("coid") String coId,
//			ModelAndView mv) {
//		Company company = ExService.selectCompanyInfo(coId);
//		mv.addObject("com", company);
//		mv.setViewName("hp_helperView");
//		return mv;
//	}
	
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
	public Company(String coId, String coPwd, String coName, String compaName, String apName, String homePage,
			String coTel, Date enrollDate, String status, String approval, String busiEmail, int cpCheck,
			String checkImg, int point, int cateNum, String coIntro, String coInfo) {
		super();
		this.coId = coId;
		this.coPwd = coPwd;
		this.coName = coName;
		this.compaName = compaName;
		this.apName = apName;
		this.homePage = homePage;
		this.coTel = coTel;
		this.enrollDate = enrollDate;
		this.status = status;
		this.approval = approval;
		this.busiEmail = busiEmail;
		this.cpCheck = cpCheck;
		this.checkImg = checkImg;
		this.point = point;
		this.cateNum = cateNum;
		this.coIntro = coIntro;
		this.coInfo = coInfo;
	}
	
	생성자 하나 더 만들어ㅇ
	 */
	

	@RequestMapping("helperUpdate.ex")
	public void helperUpdate(HttpSession session, HttpServletRequest request) {
		

		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		
		String coName = request.getParameter("coName");
		String compaName = request.getParameter("compaName");
		String coIntro = request.getParameter("coIntro");
		
//		Company c = new Company(coId, coPwd, coName, compaName, apName, homePage,
//				coTel, enrollDate, status, approval, busiEmail, cpCheck,
//				checkImg, point, cateNum, coIntro, coInfo);
		
		

	//	 int result = ExService2.updateCompany(coName,compaName,coIntro);
		 
		 
		System.out.println("진입");
		
		System.out.println(coId +"," + coName + ", " + compaName);

	}
	
//	
//	// 헬퍼수정 페이지
	@RequestMapping("helperEdit.ex")
	public ModelAndView goHelperEdit(HttpSession session,
			ModelAndView mv)  {
		
		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		Company company = ExService.selectCompanyInfo(coId);
		
		mv.addObject("com", company);
		mv.setViewName("hp_helperEdit");
		return mv;
	}
	
	// 헬퍼수정 비번일치확인
	@RequestMapping("helperPwdCheck.ex")
	public void helperPwdCheck() {
		
//		if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
//			
//			
//		}
			
	}
	
	// 헬퍼버킷리스트 페이지
	@RequestMapping("helperBucketList.ex")
	public String goHelperBucketList() {
		return "hp_helperBucketList";
	}
	
	// 포인트 충전
	@RequestMapping("pinsert.ex")
	public String pointInsert(HttpSession session,
							  @ModelAttribute Pay p,
							  HttpServletRequest request) {
		
		//String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		System.out.println(p);
		
		// PAY 테이블에 Point 집어넣기
		int result = ExService2.insertPoint(p);
		
		//ExService2.updateCompanyPoint(coId, getPoint(coId));
		
		// COMPANY 테이블에 보유 포인트 갱신
		/* update COMPANY set POINT = POINT + p.getPa_pay()
		   where COID = p.getCoid() */
		
		if (result > 0) {
//			System.out.println("완료");
			return "redirect:point.ex";
		} else {
			throw new ExpertException("포인트 충전에 실패하였습니다.");
		}

	}
	
	// 포인트 충전페이지(coid)
	@RequestMapping("point.ex")
	public ModelAndView goPoint(HttpSession session,
								ModelAndView mv) {
		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
	
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
	
	
	// 포인트 내역 페이지	
	@RequestMapping(value = "pointList2.ex", method = RequestMethod.GET)
		public ModelAndView pointList(HttpSession session,
									  @RequestParam(value = "page", required = false) Integer page, ModelAndView mv){

		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
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
	//	String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		return "hp_sendQnA";
	}
	
	// 헬퍼 qna 문의확인 페이지
	@RequestMapping("helperQnA.ex")
	public String goHelperQnA() {
		return "hp_QnA";
	}

	@RequestMapping("insertQnA.ex")
	public String insertQnA(HttpSession session,HttpServletRequest request) {
		System.out.println("진입");
		
		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		
		//System.out.println(today);
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		adminQnA aQ = new adminQnA(title,content,null,coId);
//		adminQnA aQ = new adminQnA(9999,title,content,null,'N',null,null,null,coId);
		
		
		int result = ExService2.insertQnA(aQ);
		
		if (result > 0) {
			System.out.println("질문 완료");
			return "hp_sendQnASuccess";
		} else {
			throw new ExpertException("질문에 실패하였습니다.");
		}
	}
	
	@RequestMapping("insertQnAS.ex")
	public String goHelperQnASuccess() {
		return "hp_sendQnASuccess";
	}
	
}
