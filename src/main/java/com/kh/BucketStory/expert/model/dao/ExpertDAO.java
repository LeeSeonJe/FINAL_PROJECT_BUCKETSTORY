package com.kh.BucketStory.expert.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.ComInBucket;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.EsRequest;
import com.kh.BucketStory.expert.model.vo.Esoption;
import com.kh.BucketStory.expert.model.vo.Estimate;

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

	public Member selectMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("commonMapper.memberLogin", userId);
	}

	public int insertEstimate(SqlSessionTemplate sqlSession, Estimate es) {
		return sqlSession.insert("exMapper.insertEstimate",es);
	}

	public int insertEsMedia(SqlSessionTemplate sqlSession, Media media) {
		return sqlSession.insert("exMapper.insertEsmedia", media);
	}

	public ArrayList<Estimate> selectEstimateList(SqlSessionTemplate sqlSession, String coId) {
		return (ArrayList)sqlSession.selectList("exMapper.selectEstimateList", coId);
	}

	public Estimate selectEstimate(SqlSessionTemplate sqlSession, String esno) {
		return sqlSession.selectOne("exMapper.selectEstimate",esno);
	}

	public EsRequest selectEsRequestOne(SqlSessionTemplate sqlSession, int esr_no) {
		return sqlSession.selectOne("exMapper.selectEsRequestOne",esr_no);
	}

	public ArrayList<Media> selectMediaList(SqlSessionTemplate sqlSession, int es_no) {
		return (ArrayList)sqlSession.selectList("exMapper.selectMediaList",es_no);
	}

	public ArrayList<Estimate> selectMakingEstimateList(SqlSessionTemplate sqlSession, String coId) {
		return (ArrayList)sqlSession.selectList("exMapper.selectMakingEstimateList",coId);
	}

	public int updateEstimate(SqlSessionTemplate sqlSession, Estimate es) {
		return sqlSession.update("exMapper.updateEstimate", es);
	}

	public int deleteMedia(SqlSessionTemplate sqlSession, String mnumber) {
		return sqlSession.delete("exMapper.deleteMedia", mnumber);
	}

	public int updateEsRequestPosition(SqlSessionTemplate sqlSession, int esr_no) {
		return sqlSession.update("exMapper.updateEsRequestPosition", esr_no);
	}

	public int updateEsmedia(SqlSessionTemplate sqlSession, Media media) {
		return sqlSession.insert("exMapper.updateEsmedia", media);
	}

	public ArrayList<Media> selectAllBucketMediaList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("exMapper.selectBucketMedia");
	}

	public ArrayList<Estimate> selectCompleteEstimateList(SqlSessionTemplate sqlSession, String coId) {
		return (ArrayList)sqlSession.selectList("exMapper.selectCompleteEstimateList", coId);
	}

	public ArrayList<Estimate> selectUserEstimate(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("exMapper.selectUserEstimate", userId);
	}

	
}
