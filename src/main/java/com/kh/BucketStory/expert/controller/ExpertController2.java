package com.kh.BucketStory.expert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExpertController2 {
	
	// 테스트
	@RequestMapping("gogo.ex")
	public String expertInfo2() {
		return "gogo";
	}
	
	// 전문가 메인페이지
	
	
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
	
	// 포인트 충전페이지
	@RequestMapping("point.ex")
	public String goPoint() {
		return "hp_point";
	}
	
	// 포인트 내역 페이지
	@RequestMapping("pointList.ex")
	public String goPointList() {
		return "hp_pointList";
	}
	
	
	
	
	
}
