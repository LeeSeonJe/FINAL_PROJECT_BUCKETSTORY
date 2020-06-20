package com.kh.BucketStory.expert.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.expert.model.exception.ExpertException;
import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.service.ExpertService2;
import com.kh.BucketStory.expert.model.vo.Category;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.pagination;

@Controller
public class ExpertController2H {
	// 의존성주입
		@Autowired
		private ExpertService ExService;

		@Autowired
		private ExpertService2 ExService2;

		@Autowired
		private BCryptPasswordEncoder bcryptPasswordEncoder;
		
		// Ajax용
		private static void resWriter(HttpServletResponse response, String msg) {
			try {
				PrintWriter out = response.getWriter();
				out.append(msg);
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		/*
		 *  -----------------------------------------------------------------------------------------------
		 *  헬퍼 메인페이지
		 *  	ModelAndView mv, 
		 *  	HttpSession session, 
		 *  	@RequestParam(value = "result") 
		 *  	@Nullable String result
		 *  -----------------------------------------------------------------------------------------------
		 */
	
		@RequestMapping("expertIntro.ex")
		public ModelAndView expertInfo2(ModelAndView mv, HttpSession session,
										@RequestParam(value = "result") @Nullable String result) {

			Company loginCom = (Company) session.getAttribute("loginCompany");
			// System.out.println(loginCom);

			// 기업/전문가 아이디
			String coId = loginCom.getCoId();
			System.out.println("기업아이디 :" + coId + "로 로그인하셨습니다.");

			// 상위 Top 5 포인트 보유왕
			ArrayList<Company> list = ExService2.selectTop5havingPoint();
		//	System.out.println(list);
		
			Company company = ExService.selectCompanyInfo(coId);
			
		// 카테고리 이름가져오기
			Category cateName = ExService2.selectCateName(company.getCateNum());
			
			mv.addObject("com", company);
			mv.addObject("cateName", cateName.getCateName());
			mv.addObject("result", result);
			mv.addObject("list", list);
			mv.setViewName("hp_intro");
			return mv;
		}
/*
		@RequestMapping("expertIntro.ex")
		public ModelAndView expertInfo2(ModelAndView mv, HttpSession session,
										@RequestParam(value = "page", required = false) Integer page,
										@RequestParam(value = "result") @Nullable String result) {

			Company loginCom = (Company) session.getAttribute("loginCompany");
			// System.out.println(loginCom);

			// 기업/전문가 아이디
			String coId = loginCom.getCoId();
			System.out.println("기업아이디 :" + coId + "로 로그인하셨습니다.");

			// 상위 Top 5 포인트 보유왕
			ArrayList<Company> list = ExService2.selectTop5havingPoint();
		//	System.out.println(list);
		
			Company company = ExService.selectCompanyInfo(coId);
			
			
		// 카테고리 이름가져오기
			Category cateName = ExService2.selectCateName(company.getCateNum());
			
			mv.addObject("com", company);
			mv.addObject("cateName", cateName.getCateName());
			mv.addObject("result", result);
			mv.addObject("list", list);
			
			int currentPage = 1;
			if (page != null) {
				currentPage = page;
			}
			
			
			int listCount = ExService2.getListQnACount(coId);
			PageInfo pi = pagination.getPageInfo(currentPage, listCount);
			ArrayList<adminQnA> qlist = ExService2.selectQnAList(pi, coId);
			if (qlist != null) {
				mv.addObject("qlist", qlist);
				mv.addObject("pi", pi);
				//mv.addObject("coId", coId);
			} else {
				throw new ExpertException("QnA 내역 조회에 실패했습니다.");
			}

				mv.setViewName("hp_intro");
			return mv;
		}
*/		

		
		
		
		/* -----------------------------------------------------------------------------------------------
		 *  기업소개 변경
		 *  	HttpSession session
		 *  	HttpServletRequest request
		 *  	@RequestParam("uploadFile") MultipartFile uploadFile
		 * -----------------------------------------------------------------------------------------------
		 */
		@RequestMapping("comUpdate.ex")
		public String comUpdate(HttpSession session, HttpServletRequest request, /*HttpServletResponse response,*/
				@RequestParam("uploadFile") MultipartFile uploadFile) {

			String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
			String coName = request.getParameter("coName");
			// String checkImg = request.getParameter("checkImg");
			String compaName = request.getParameter("compaName");
			String coIntro = request.getParameter("coIntro");
			int cateNum = Integer.parseInt(request.getParameter("cateNum"));
			String checkImg = null;

			if (uploadFile != null && !uploadFile.isEmpty()) {
				checkImg = saveFile(uploadFile, request);
			}
			Company c = new Company(coId, coName, compaName, checkImg, cateNum, coIntro);

			System.out.println("기업소개변경");
			System.out.println(c);
			int result = ExService2.updateCompany(c);

			if (result > 0) {
				// resWriter(response,"ok");
				// return "redirect:comUpdateSuccess.ex";
				// return "redirect:helperEdit2.ex?result=ok";
				return "redirect:expertIntro.ex?result=ok";
			} else {
				 //resWriter(response,"fail");
				throw new ExpertException("정보 변경에 실패하였습니다.");
			}
		
		}
		
		/* -----------------------------------------------------------------------------------------------
		 *  기업소개 변경에 들어갈 파일 저장
		 * -----------------------------------------------------------------------------------------------
		 */
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\muploadFiles";

			File folder = new File(savePath);

			if (!folder.exists()) {
				folder.mkdirs();
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
			String renamePath = folder + "//" + renameFileName;

			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			return renameFileName;
		}
		
		/*
		 * -----------------------------------------------------------------------------------------------
		 * 헬퍼 회원정보 업데이트
		 * 		HttpSession session
		 * 		HttpServletRequest request
		 * -----------------------------------------------------------------------------------------------
		 */
		
		@RequestMapping("helperUpdate.ex")
		public String helperUpdate(HttpSession session, HttpServletRequest request) {

			String coId = ((Company) session.getAttribute("loginCompany")).getCoId();

			//암호화
			String coPwd = bcryptPasswordEncoder.encode(request.getParameter("coPwd"));
			
			String homePage = request.getParameter("homePage");
			String coTel = request.getParameter("coTel");
			String busiEmail = request.getParameter("busiEmail");
			
			Company c = new Company(coId, coPwd, homePage, coTel, busiEmail);

			int result = ExService2.updatehelper(c);
			if(result > 0) {
				return "redirect:expertIntro.ex?result=ok";
			} else {
				 //resWriter(response,"fail");
				throw new ExpertException("정보변경에 실패하였습니다.");
			}
			
		}

		/*
		 * -----------------------------------------------------------------------------------------------
		 * 헬퍼 비번 일치확인 : 오류
		 * -----------------------------------------------------------------------------------------------
		 */
		@RequestMapping("helperPwdCheck.ex")
		public void helperPwdCheck(HttpSession session,
								   @RequestParam(value = "npwd") String coPwd,
								   HttpServletResponse response) {

			String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
			if(bcryptPasswordEncoder.matches(coPwd,coId)){
				resWriter(response, "ok");
			}else {
				resWriter(response, "fail");
			}
		}
		
		
		// 헬퍼뷰어 페이지
		@RequestMapping("helperView.ex")
		public ModelAndView goHelperView(HttpSession session, ModelAndView mv) {
	
			String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
			Company company = ExService.selectCompanyInfo(coId);
			mv.addObject("com", company);
			mv.setViewName("hp_helperView");
			return mv;
		}
		

		// 헬퍼버킷리스트 페이지
		@RequestMapping("helperBucketList.ex")
		public String goHelperBucketList() {
			return "hp_helperBucketList";
		}
//		// 헬퍼수정 페이지
//		@RequestMapping("helperEdit.ex")
//		public ModelAndView goHelperEdit(HttpSession session, ModelAndView mv) {
//
//			String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
//			Company company = ExService.selectCompanyInfo(coId);
//
//			mv.addObject("com", company);
//			mv.setViewName("hp_helperEdit");
//			return mv;
//		}

		/*
		 * @RequestMapping("insertQnA.ex") public void insertQnA(HttpSession
		 * session,HttpServletRequest request) { System.out.println("진입");
		 * 
		 * String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		 * 
		 * //System.out.println(today);
		 * 
		 * String title = request.getParameter("title"); String content =
		 * request.getParameter("content");
		 * 
		 * adminQnA aQ = new adminQnA(title,content,null,coId); // adminQnA aQ = new
		 * adminQnA(9999,title,content,null,'N',null,null,null,coId);
		 * 
		 * 
		 * int result = ExService2.insertQnA(aQ);
		 * 
		 * if (result > 0) { System.out.println("질문 완료"); //return "hp_sendQnASuccess";
		 * } else { throw new ExpertException("질문에 실패하였습니다."); } }
		 * 
		 * @RequestMapping("insertQnAS.ex") public String goHelperQnASuccess() { return
		 * "hp_sendQnASuccess"; }
		 */

		
		/*
		 *  ----------------------------------------------------------------------------------------
		 *  헬퍼 qna 문의 페이지
		 *  ----------------------------------------------------------------------------------------
		 */
		
		// qna 문의 페이지로 이동
		@RequestMapping("helperQnA.ex")
		public ModelAndView goHelperSendQnAt(HttpSession session, 
							@RequestParam(value = "page", required = false) Integer page,
							ModelAndView mv) {

			String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
			int currentPage = 1;
			if (page != null) {
				currentPage = page;
			}

			int listCount = ExService2.getListQnACount(coId);
			PageInfo pi = pagination.getPageInfo(currentPage, listCount);
			ArrayList<adminQnA> list = ExService2.selectQnAList(pi, coId);

			if (list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.addObject("coId", coId);
			mv.setViewName("hp_QnA");
			} else {
				throw new ExpertException("QnA 내역 조회에 실패했습니다.");
			}
			return mv;
		}
		
		// qna 문의 페이지로 이동
		@RequestMapping("helperSendQnA.ex")
		public String goHelperSendQnA() {
			// String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
			return "hp_sendQnA";
		}

		// qna 문의 전송 : ajax 방식으로 변경
		@RequestMapping("insertQnAjax.ex")
		public void insertQnAjax(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

			System.out.println("진입");
			String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			adminQnA aQ = new adminQnA(title, content, null, coId);
			int result = ExService2.insertQnA(aQ);

			if (result > 0) {
//				System.out.println("성공");
				resWriter(response, "ok");
			} else {
				resWriter(response, "fail");
			}
		}

		/*  -------------------------------------------------------------------------------------------------
		 *  Qna 내역 페이지
		 *  -------------------------------------------------------------------------------------------------
		 */
		@RequestMapping(value = "helperQnaList.ex", method = RequestMethod.GET)
		public ModelAndView showQnAList(HttpSession session, 
								@RequestParam(value = "page", required = false) Integer page,
								@RequestParam(value = "search") @Nullable String search,
				ModelAndView mv) {

			String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
			
			int currentPage = 1;
			if (page != null) {
				currentPage = page;
			}
			
			int listCount = 0;
			PageInfo pi = null;
			ArrayList<adminQnA> list = null;
			
			
			if(search.equals("all")) {
				listCount = ExService2.getListQnACount(coId);
				pi = pagination.getPageInfo(currentPage, listCount);
				list = ExService2.selectQnAList(pi, coId);
			}
			if(search.equals("Y")) {
				listCount = ExService2.getListQnACountY(coId);
				pi = pagination.getPageInfo(currentPage, listCount);
				list = ExService2.selectQnAListY(pi, coId);
			}
			if(search.equals("N")) {
				listCount = ExService2.getListQnACountN(coId);
				pi = pagination.getPageInfo(currentPage, listCount);
				list = ExService2.selectQnAListN(pi, coId);
			}

			if (list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.addObject("coId", coId);
				mv.addObject("search",search);
				mv.setViewName("hp_QnAList");
			} else {
				throw new ExpertException("QnA 내역 조회에 실패했습니다.");
			}
			return mv;
		}
		
		
		
}
