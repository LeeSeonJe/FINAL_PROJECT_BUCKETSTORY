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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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

	// 전문가 메인페이지
	@RequestMapping("expertIntro.ex")
	public ModelAndView expertInfo2(ModelAndView mv, HttpSession session) {

		Company loginCom = (Company) session.getAttribute("loginCompany");
		// System.out.println(loginCom);

		// 기업/전문가 아이디
		String coId = loginCom.getCoId();
		System.out.println("기업아이디 :" + coId + "로 로그인하셨습니다.");

		// 상위 Top 5 포인트 보유왕
		ArrayList<Company> list = ExService2.selectTop5havingPoint();

		System.out.println(list);
		mv.addObject("list", list);
		mv.addObject("coid", coId);
		mv.setViewName("hp_intro");
		return mv;
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

//	@RequestMapping("helperView.ex")
//	public ModelAndView  goHelperView(@RequestParam("coid") String coId,
//			ModelAndView mv) {
//		Company company = ExService.selectCompanyInfo(coId);
//		mv.addObject("com", company);
//		mv.setViewName("hp_helperView");
//		return mv;
//	}

	// 기업소개 변경
	@RequestMapping("comUpdate.ex")
	public String comUpdate(HttpSession session, HttpServletRequest request,
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
			return "redirect:comUpdateSuccess.ex";
		} else {
			// resWriter(response,"fail");
			throw new ExpertException("기업소개 변경에 실패하였습니다.");
		}
	}

	@RequestMapping("comUpdateSuccess.ex")
	public ModelAndView comUpdate(HttpSession session, ModelAndView mv) {
		Company loginCom = (Company) session.getAttribute("loginCompany");
		mv.addObject("com", loginCom);
		mv.setViewName("hp_comUpdateSuccess");
		return mv;
	}

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

	@RequestMapping("helperUpdate.ex")
	public void helperUpdate(HttpSession session, HttpServletRequest request) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();

		String coName = request.getParameter("coName");
		String compaName = request.getParameter("compaName");
		String coIntro = request.getParameter("coIntro");

//		Company c = new Company(coId, coPwd, coName, compaName, apName, homePage,
//				coTel, enrollDate, status, approval, busiEmail, cpCheck,
//				checkImg, point, cateNum, coIntro, coInfo);

		// int result = ExService2.updateCompany(coName,compaName,coIntro);

		System.out.println("진입");

		System.out.println(coId + "," + coName + ", " + compaName);

	}

//	
//	// 헬퍼수정 페이지
	@RequestMapping("helperEdit.ex")
	public ModelAndView goHelperEdit(HttpSession session, ModelAndView mv) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		Company company = ExService.selectCompanyInfo(coId);

		mv.addObject("com", company);
		mv.setViewName("hp_helperEdit");
		return mv;
	}

//	// 헬퍼수정 페이지
	@RequestMapping("helperEdit2.ex")
	public ModelAndView goHelperEdit2(HttpSession session, ModelAndView mv) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		Company company = ExService.selectCompanyInfo(coId);

		mv.addObject("com", company);
		mv.setViewName("hp_helperEdit2");
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
	public String pointInsert(HttpSession session, @ModelAttribute Pay p, HttpServletRequest request) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		System.out.println(p);

		// PAY 테이블에 Point 집어넣기
		int result = ExService2.insertPoint(p);

		Company c = new Company();

		c.setCoId(coId);
		c.setPoint(getPoint(coId));

		// Company 에 보유포인트 갱신
		int result2 = ExService2.updateCompanyPoint(c);

		if (result > 0 && result2 > 0) {
//			System.out.println("완료");
			return "redirect:point.ex";
		} else {
			throw new ExpertException("실패하였습니다.");
		}

	}

	// 포인트 충전페이지(coid)
	@RequestMapping("point.ex")
	public ModelAndView goPoint(HttpSession session, ModelAndView mv) {
		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();

		if (ExService2.getListCount(coId) > 0) {
			mv.addObject("hp", getPoint(coId));
		} else {
			mv.addObject("hp", 0);
		}

		mv.addObject("coId", coId);
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
//	@RequestMapping("pointList.ex")
//	public ModelAndView pointList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
//
//		int currentPage = 1;
//		if (page != null) {
//			currentPage = page;
//		}
//
//		int listCount = ExService2.getListCount();
//		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
//		ArrayList<Pay> list = ExService2.selectList(pi);
//		
//		if (list != null) {
//			// list, pi, view
//			mv.addObject("list", list);
//			mv.addObject("pi", pi);			
//			mv.setViewName("hp_pointListAll");
//		} else {
//			throw new ExpertException("포인트 내역 조회에 실패했습니다.");
//		}
//		return mv;
//	}

	@RequestMapping("pointListAll.ex")
	public ModelAndView pointList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpServletRequest request) {
		char check = request.getParameter("check").charAt(0);
		String keyword = request.getParameter("keyword");

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
	@RequestMapping(value = "pointList.ex", method = RequestMethod.GET)
	public ModelAndView pointList(HttpSession session, @RequestParam(value = "page", required = false) Integer page,
			ModelAndView mv) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = ExService2.getListCount(coId);

		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		ArrayList<Pay> list = ExService2.selectList(pi, coId);
		if (list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("coId", coId);
			
			
			if (listCount > 0) {
				mv.addObject("hp", getPoint(coId));
			} else { // 포인트 내역이 없으면
				mv.addObject("hp", 0);
			}
			mv.setViewName("hp_pointList");
		} else {
			throw new ExpertException("포인트 내역 조회에 실패했습니다.");
		}
		return mv;
	}

	// 포인트 내역 페이지 (필터링)
	@RequestMapping(value = "pointListYN.ex", method = RequestMethod.GET)
	public ModelAndView pointList(HttpSession session, @RequestParam(value = "search") String search,
			@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = 0;
		ArrayList<Pay> list = null;
		PageInfo pi = null;
		int uPoint = 0;
		
		//System.out.println(search);
		
		if(search.equals("all")) {
			listCount = ExService2.getListCount(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectList(pi, coId);
			uPoint = getPoint(coId);
		}
		if (search.equals("Y")) {
			listCount = ExService2.getListCountY(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectListY(pi, coId);
			uPoint = ExService2.getYPoint(coId); 
		}
		if (search.equals("N")) {
			listCount = ExService2.getListCountN(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectListN(pi, coId);
			uPoint = ExService2.getNPoint(coId); 
		}
		
		if (list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("coId", coId);
			mv.addObject("search",search);
	
			if (listCount > 0) {
				mv.addObject("hp", uPoint);
			} else { 
				mv.addObject("hp", 0);
			}
			mv.setViewName("hp_pointListYN");
		} else {
			throw new ExpertException("포인트 내역 조회에 실패했습니다.");
		}
		return mv;
	}

	// 헬퍼 qna 문의 페이지
	@RequestMapping("helperSendQnA.ex")
	public String goHelperSendQnA() {
		// String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		return "hp_sendQnA";
	}

	// 헬퍼 qna 문의확인 페이지
	@RequestMapping("helperQnA.ex")
	public String goHelperQnA() {
		return "hp_QnAList";
	}

	// qna 문의 : ajax 방식으로 변경
	@RequestMapping("insertQnAjax.ex")
	public void insertQnAjax(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("진입");
		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		adminQnA aQ = new adminQnA(title, content, null, coId);
		int result = ExService2.insertQnA(aQ);

		if (result > 0) {
//			System.out.println("성공");
			resWriter(response, "ok");
		} else {
			resWriter(response, "fail");
		}
	}

	// Qna 내역 페이지
	@RequestMapping(value = "helperQnaList.ex", method = RequestMethod.GET)
	public ModelAndView showQnAList(HttpSession session, @RequestParam(value = "page", required = false) Integer page,
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
			mv.setViewName("hp_QnAList");
		} else {
			throw new ExpertException("QnA 내역 조회에 실패했습니다.");
		}
		return mv;
	}

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

}
