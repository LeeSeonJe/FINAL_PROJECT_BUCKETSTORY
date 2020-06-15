package com.kh.BucketStory.expert.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.expert.model.exception.ExpertException;
import com.kh.BucketStory.expert.model.service.ExpertService2;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;
import com.kh.BucketStory.expert.model.vo.pagination;

@Controller
public class ExpertController2 {
	
	// 의존성주입
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
	public String goHelperView() {
		return "hp_helperView";
	}
//	
//	// 헬퍼수정 페이지
	@RequestMapping("helperEdit.ex")
	public String goHelperEdit() {
		return "hp_helperEdit";
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
		
		int result = ExService2.insertPoint(p);

		if (result > 0) {
			return "redirect:pointList.ex";
		} else {
			throw new ExpertException("포인트 충전에 실패하였습니다.");
		}

	}
	
	// 포인트 충전페이지
	@RequestMapping("point.ex")
	public String goPoint() {
		return "hp_point";
	}
	
	// 포인트 내역 페이지
	@RequestMapping("pointList.ex")
	public ModelAndView boardList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

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
