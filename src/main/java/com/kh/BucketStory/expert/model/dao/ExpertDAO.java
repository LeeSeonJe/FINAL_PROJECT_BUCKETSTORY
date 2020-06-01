package com.kh.BucketStory.expert.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.expert.model.vo.Company;

@Repository("exDAO")
public class ExpertDAO {

	public Company selectCompanyInfo(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper.selectCompanyInfo", coId);
	}

	public int updateExInfo(SqlSessionTemplate sqlSession, Company com) {
		System.out.println(com.getCoId());
		return sqlSession.update("exMapper.updateExInfo", com);
	}

}
