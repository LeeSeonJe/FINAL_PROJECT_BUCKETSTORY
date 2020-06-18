package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.expert.model.dao.ExpertDAO2;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

@Service("ExService2")
public class ExpertServiceImpl2 implements ExpertService2 {

	@Autowired
	private ExpertDAO2 exDAO2;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return exDAO2.getListCount(sqlSession);
	}
	@Override
	public int getListCount(String coId) {
		return exDAO2.getListCount(sqlSession,coId);
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
	public ArrayList<adminQnA> selectQnAList(PageInfo pi, String coId) {
		return exDAO2.selectQnAList(sqlSession, pi, coId);
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

}
