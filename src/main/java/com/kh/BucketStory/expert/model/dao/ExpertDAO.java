package com.kh.BucketStory.expert.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.expert.model.vo.Company;

@Repository("exDAO")
public class ExpertDAO {

	public Company selectCompanyInfo(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper.selectCompanyInfo", coId);
	}

}
