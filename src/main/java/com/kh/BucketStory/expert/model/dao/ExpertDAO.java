package com.kh.BucketStory.expert.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.ComInBucket;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.EsRequest;

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

	public int insertBucket(SqlSessionTemplate sqlSession, Map<String, Object> hm) {
			return sqlSession.insert("exMapper.insertComBucket",hm);
	}

	public ArrayList<BucketList> selectComBucket(SqlSessionTemplate sqlSession, String coId) {
		return (ArrayList)sqlSession.selectList("exMapper.selectComBucket",coId);
	}

	public BucketList selectBucket(SqlSessionTemplate sqlSession, int bkNo) {
		return sqlSession.selectOne("exMapper.selectBucket", bkNo);
	}

	public int insertEsrequest(SqlSessionTemplate sqlSession, EsRequest er) {
		return sqlSession.insert("exMapper.insertEsrequest",er);
	}

	public ArrayList<EsRequest> selectEsRequest(SqlSessionTemplate sqlSession, String coId) {
		return (ArrayList)sqlSession.selectList("exMapper.selectEsRequest",coId);
	}

	public EsRequest RequestDetail(SqlSessionTemplate sqlSession, String esr_no) {
		return sqlSession.selectOne("exMapper.RequestDetail",esr_no);
	}
}
