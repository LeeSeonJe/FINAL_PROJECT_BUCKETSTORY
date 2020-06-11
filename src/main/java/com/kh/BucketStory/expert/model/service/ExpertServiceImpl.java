package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.ComInBucket;
import com.kh.BucketStory.expert.model.dao.ExpertDAO;
import com.kh.BucketStory.expert.model.vo.Company;

@Service("ExService")
public class ExpertServiceImpl implements ExpertService {

	@Autowired
	private ExpertDAO exDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Company selectCompanyInfo(String coId) {
		return exDAO.selectCompanyInfo(sqlSession,coId);
	}
	@Override
	public int updateExInfo(Company com) {
		return exDAO.updateExInfo(sqlSession,com);
	}
	@Override
	public ArrayList<BucketList> selectCateList(int catenum) {
		return exDAO.selectCateList(sqlSession,catenum);
	}
	
	@Override
	public int insertBucket(Map<String, Object> hm) {
		return exDAO.insertBucket(sqlSession, hm);
	}
	@Override
	public ArrayList<BucketList> selectComBucket(String coId) {
		return exDAO.selectComBucket(sqlSession,coId);
	}
}
