package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.expert.model.dao.ExpertDAO2;
import com.kh.BucketStory.expert.model.vo.Category;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

@Service("ExService2")
public class ExpertServiceImpl2 implements ExpertService2 {

	@Autowired
	private ExpertDAO2 exDAO2;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//
	@Override
	public int getListCount() {
		return exDAO2.getListCount(sqlSession);
	}
	@Override
	public int getListCount(String coId) {
		return exDAO2.getListCount(sqlSession,coId);
	}
	@Override
	public int getListCountY(String coId) {
		return exDAO2.getListCountY(sqlSession,coId);
	}
	@Override
	public int getListCountN(String coId) {
		return exDAO2.getListCountN(sqlSession,coId);
	}

	@Override
	public ArrayList<Pay> selectList(PageInfo pi) {
		return exDAO2.selectList(sqlSession, pi);
	}
	@Override
	public ArrayList<Pay> selectList(PageInfo pi, String coId) {
		return exDAO2.selectList(sqlSession, pi,coId);
	}
	@Override
	public ArrayList<Pay> selectListY(PageInfo pi, String coId) {
		return exDAO2.selectListY(sqlSession, pi,coId);
	}
	@Override
	public ArrayList<Pay> selectListN(PageInfo pi, String coId) {
		return exDAO2.selectListN(sqlSession, pi,coId);
	}

	
	
	@Override
	public int insertPoint(Pay p) {
		return  exDAO2.insertPoint(sqlSession, p);
	}

	@Override
	public int getYPoint(String coId) {
		return exDAO2.getYPoint(sqlSession,coId);
	}

	@Override
	public int getNPoint(String coId) {
		return exDAO2.getNPoint(sqlSession,coId);
	}

	@Override
	public int insertQnA(adminQnA aQ) {
		return exDAO2.insertQnA(sqlSession,aQ);
	}

	@Override
	public int getListQnACount(String coId) {
		return exDAO2.getListQnACount(sqlSession,coId);
	}
	@Override
	public int getListQnACountY(String coId) {
		return exDAO2.getListQnACountY(sqlSession,coId);
	}
	@Override
	public int getListQnACountN(String coId) {
		return exDAO2.getListQnACountN(sqlSession,coId);
	}

	@Override
	public ArrayList<adminQnA> selectQnAList(PageInfo pi, String coId) {
		return exDAO2.selectQnAList(sqlSession, pi, coId);
	}
	
	@Override
	public ArrayList<adminQnA> selectQnAListY(PageInfo pi, String coId) {
		return exDAO2.selectQnAListY(sqlSession, pi, coId);
	}
	@Override
	public ArrayList<adminQnA> selectQnAListN(PageInfo pi, String coId) {
		return exDAO2.selectQnAListN(sqlSession, pi, coId);
	}

	
	@Override
	public int updateCompany(Company c) {
		return exDAO2.updateCompany(sqlSession,c);
	}
	@Override
	public int updateCompanyPoint(Company c) {
		return exDAO2.updateComapnyPoint(sqlSession,c);	
	}
	@Override
	public ArrayList<Company> selectTop5havingPoint() {
		return exDAO2.selectTop5havingPoint(sqlSession);
	}
	// 카테고리 이름
	@Override
	public Category selectCateName(int cateNum) {
		return exDAO2.selectCateName(sqlSession, cateNum);
	}
	@Override
	public int updatehelper(Company c) {
		return exDAO2.updatehelper(sqlSession, c);
	}
	@Override
	public adminQnA getQnANo(int q_no) {
		return exDAO2.getQnAno(sqlSession, q_no);
	}
	@Override
	public int deleteQnA(int q_no) {
		return exDAO2.deleteQnA(sqlSession,q_no);
	}
	@Override
	public int updateQnA(adminQnA aQ) {
		return exDAO2.updateQnA(sqlSession,aQ);
	}
	
	
	// 회원 QnA

	@Override
	public int getListMQnACount(String userId) {
		return exDAO2.getListMQnACount(sqlSession,userId);
	}
	@Override
	public int getListMQnACountN(String userId) {
		return exDAO2.getListMQnACountN(sqlSession,userId);
	}
	@Override
	public int getListMQnACountY(String userId) {
		return exDAO2.getListMQnACountY(sqlSession,userId);
	}

	@Override
	public ArrayList<adminQnA> selectMQnAList(PageInfo pi, String userId) {
		return exDAO2.selectMQnAList(sqlSession, pi, userId);
	}
	@Override
	public ArrayList<adminQnA> selectMQnAListY(PageInfo pi, String userId) {
		return exDAO2.selectMQnAListY(sqlSession, pi, userId);
	}

	@Override
	public ArrayList<adminQnA> selectMQnAListN(PageInfo pi, String userId) {
		return exDAO2.selectMQnAListN(sqlSession, pi, userId);
	}
	@Override
	public int insertMQnA(adminQnA aQ) {
		return exDAO2.insertMQnA(sqlSession,aQ);
	}

	@Override
	public Company selectCompanyInfo2(String coId) {
		return exDAO2.selectCompanyInfo2(sqlSession, coId);
		
	}
	
	@Override
	public int goPhoto(Media media) {
		return exDAO2.goPhoto(sqlSession,media);
	}
	@Override
	public Media getPhoto(String coId) {
		return exDAO2.getPhoto(sqlSession,coId);
	}



}
