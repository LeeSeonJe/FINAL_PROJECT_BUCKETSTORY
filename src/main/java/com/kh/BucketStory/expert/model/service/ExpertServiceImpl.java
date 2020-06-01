package com.kh.BucketStory.expert.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
