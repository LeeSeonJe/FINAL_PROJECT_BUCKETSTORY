package com.kh.BucketStory.expert.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.exception.ExpertException;
import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.service.ExpertService2;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;
import com.kh.BucketStory.expert.model.vo.pagination;

@Controller
public class ExpertController2QNA {

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
	
	/*
	 *  ----------------------------------------------------------------------------------------
	 *  헬퍼 qna 문의 페이지
	 *  ----------------------------------------------------------------------------------------
	 */
	
	// qna 문의 전송(coid): ajax 방식으로 변경
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
	
	// qna 문의 전송(user) : ajax 방식으로 변경
	@RequestMapping("insertMQnAjax.ex")
	public void insertMQnAjax(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("진입");
		String userId = ((Member) session.getAttribute("loginUser")).getUserId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		adminQnA aQ = new adminQnA(title, content, userId,null);
		int result = ExService2.insertMQnA(aQ);

		if (result > 0) {
//			System.out.println("성공");
			resWriter(response, "ok");
		} else {
			resWriter(response, "fail");
		}
	}
	
	@RequestMapping("helperQnaDelete.ex")
	public void deleteQnA(@RequestParam(value="q_no") int q_no, 
							HttpServletResponse response) {
		
		int result = ExService2.deleteQnA(q_no);

		if (result > 0) {
//			System.out.println("성공");
			resWriter(response, "ok");
		} else {
			resWriter(response, "fail");
		}
	}
	@RequestMapping("helperQnaUpdate.ex")
	public void updateQnA(HttpSession session, @RequestParam(value="q_no") int q_no, 
							HttpServletRequest request,
							HttpServletResponse response) {
	
		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		String title = request.getParameter("q_title");
		String content = request.getParameter("q_content");
		
		adminQnA aQ = new adminQnA(q_no, title, content);
		
		int result = ExService2.updateQnA(aQ);

		if (result > 0) {
//			System.out.println("성공");
			resWriter(response, "ok");
		} else {
			resWriter(response, "fail");
		}
	}

	/*  -------------------------------------------------------------------------------------------------
	 *  Qna 상세 페이지
	 *  -------------------------------------------------------------------------------------------------
	 */
//	@SuppressWarnings("unchecked")
	@RequestMapping(value = "helperQnaDetail.ex", method = RequestMethod.GET)
	@ResponseBody
	public void showQnADetail(HttpServletResponse response,
							@RequestParam(value = "q_no") int q_no) {
			
		adminQnA q = ExService2.getQnANo(q_no);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(q, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/*  -------------------------------------------------------------------------------------------------
	 *  Qna 페이지(기업용)
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
	
	
	/*  -------------------------------------------------------------------------------------------------
	 *  Qna 페이지(일반회원용)
	 *  -------------------------------------------------------------------------------------------------
	 */
	@RequestMapping(value = "helperMQnaList.ex", method = RequestMethod.GET)
	public ModelAndView showMQnAList(HttpSession session, 
							@RequestParam(value = "page", required = false) Integer page,
							@RequestParam(value = "search") @Nullable String search,
			ModelAndView mv) {

		String userId = ((Member) session.getAttribute("loginUser")).getUserId();
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		int listCount = 0;
		PageInfo pi = null;
		ArrayList<adminQnA> list = null;
		
		if(search.equals("all")) {
			listCount = ExService2.getListMQnACount(userId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectMQnAList(pi, userId);
		}
		if(search.equals("Y")) {
			listCount = ExService2.getListMQnACountY(userId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectMQnAListY(pi, userId);
		}
		if(search.equals("N")) {
			listCount = ExService2.getListMQnACountN(userId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectMQnAListN(pi, userId);
		}

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("userId", userId);
			mv.addObject("search",search);
			mv.setViewName("hp_MQnAList");
		} else {
			throw new ExpertException("QnA 내역 조회에 실패했습니다.");
		}
		return mv;
	}
	
	


}
