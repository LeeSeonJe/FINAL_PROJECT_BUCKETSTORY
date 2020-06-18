package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

public interface ExpertService2 {
	
	int getListCount();

	int getListCount(String coId);
	
	ArrayList<Pay> selectList(PageInfo pi);

	ArrayList<Pay> selectList(PageInfo pi, String coId);
	
	int insertPoint(Pay p);

	int getYPoint(String coId);

	int getNPoint(String coId);
	
	// 질문 QnA
	int insertQnA(adminQnA aQ);

	int getListQnACount(String coId);

	ArrayList<adminQnA> selectQnAList(PageInfo pi, String coId);

	// 기업 소개변경
	int updateCompany(Company c);

}
