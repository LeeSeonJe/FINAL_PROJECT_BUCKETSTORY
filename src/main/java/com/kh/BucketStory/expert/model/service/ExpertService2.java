package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.expert.model.vo.Category;
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

	int updateCompanyPoint(Company c);

	// 상위 Top5 포인트 보유왕
	ArrayList<Company> selectTop5havingPoint();

	int getListCountY(String coId);

	int getListCountN(String coId);

	ArrayList<Pay> selectListY(PageInfo pi, String coId);

	ArrayList<Pay> selectListN(PageInfo pi, String coId);

	Category selectCateName(int cateNum);

	int updatehelper(Company c);

	int getListQnACountY(String coId);

	int getListQnACountN(String coId);

	ArrayList<adminQnA> selectQnAListY(PageInfo pi, String coId);

	ArrayList<adminQnA> selectQnAListN(PageInfo pi, String coId);

	adminQnA getQnANo(int q_no);

	int deleteQnA(int q_no);

	int updateQnA(adminQnA aQ);

	// 회원용 QnA
	int getListMQnACount(String userId);

	ArrayList<adminQnA> selectMQnAList(PageInfo pi, String userId);

	ArrayList<adminQnA> selectMQnAListY(PageInfo pi, String userId);

	int getListMQnACountN(String userId);

	ArrayList<adminQnA> selectMQnAListN(PageInfo pi, String userId);

	int getListMQnACountY(String userId);

	int insertMQnA(adminQnA aQ);

	Company selectCompanyInfo2(String coId);

	int goPhoto(Media media);

	Media getPhoto(String coId);

	



}
