package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

public interface ExpertService2 {
	
	// Company ID를 가지고 결제내역을 조회한다.
//	ArrayList<Pay> selectPayList(String coid);

	//TEST
	String test(String coid);

	int getListCount();

	ArrayList<Pay> selectList(PageInfo pi);

	int insertPoint(Pay p);

	int getYPoint();

	int getNPoint();
}
