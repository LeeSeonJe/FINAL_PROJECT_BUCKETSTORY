package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

public interface ExpertService2 {
	
	// Company ID를 가지고 결제내역을 조회한다.
//	ArrayList<Pay> selectPayList(String coid);

	//TEST
	String test(String coid);

	int getListCount();
	int getListCount(String coId);
	
	ArrayList<Pay> selectList(PageInfo pi);
	ArrayList<Pay> selectList(PageInfo pi, String coId);
	
	int insertPoint(Pay p);

	int getYPoint(String coId);

	int getNPoint(String coId);
	
	// 질문
	int insertQnA(adminQnA aQ);

}
