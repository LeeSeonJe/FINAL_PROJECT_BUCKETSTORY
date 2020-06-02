package com.kh.BucketStory.expert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.expert.model.vo.Company;

@Repository("exDAO")
public class ExpertDAO {

	public Company selectCompanyInfo(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper.selectCompanyInfo", coId);
	}

	public int updateExInfo(SqlSessionTemplate sqlSession, Company com) {
		return sqlSession.update("exMapper.updateExInfo", com);
	}

	public ArrayList<BucketList> selectCateList(SqlSessionTemplate sqlSession, int catenum) {
		return (ArrayList)sqlSession.selectList("exMapper.selectCateList", catenum);
	}

}
