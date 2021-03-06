package com.kh.BucketStory.expert.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.exception.BoardException;
import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.ComInBucket;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.C_event;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.EsRequest;
import com.kh.BucketStory.expert.model.vo.Esoption;
import com.kh.BucketStory.expert.model.vo.Estimate;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;
import com.kh.BucketStory.member.model.vo.Board;

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

	public int insertBucket(SqlSessionTemplate sqlSession, ComInBucket hm) {
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

	public int insertEstimate(SqlSessionTemplate sqlSession, Estimate es, ArrayList<Media> media) {
		int result = sqlSession.insert("exMapper.insertEstimate",es);
		if(result>0) {
			int result2 =0;
			for(Media m : media) {
				result2 = sqlSession.insert("exMapper.insertEsmedia", m);
			}
			return result2;
		}else {
			return result;
		}
	}

	public int insertEsMedia(SqlSessionTemplate sqlSession, Media media) {
		return sqlSession.insert("exMapper.insertEsmedia", media);
	}

	public ArrayList<Estimate> selectEstimateList(SqlSessionTemplate sqlSession, String coId,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("exMapper.selectEstimateList", coId,rowBounds);
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

	public ArrayList<Estimate> selectMakingEstimateList(SqlSessionTemplate sqlSession, String coId, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("exMapper.selectMakingEstimateList",coId,rowBounds);
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

	public ArrayList<Estimate> selectCompleteEstimateList(SqlSessionTemplate sqlSession, String coId,PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("exMapper.selectCompleteEstimateList", coId,rowBounds);
	}

	public ArrayList<Estimate> selectUserEstimate(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("exMapper.selectUserEstimate", userId);
	}

	public ArrayList<Estimate> selectMyEstimate(SqlSessionTemplate sqlSession, Map<String, String> m) {
		return (ArrayList)sqlSession.selectList("exMapper.selectMyEstimatimate",m);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Estimate es) {
		return sqlSession.update("exMapper.insertReview", es);
	}

	public int insertEvent(SqlSessionTemplate sqlSession, C_event ce) {
		return sqlSession.insert("exMapper.insertEvent",ce);
	}

	public int deleteEstimate(SqlSessionTemplate sqlSession, int es_no) {
		return sqlSession.update("exMapper.deleteEstimate",es_no);
	}

	public int getEsListCount(SqlSessionTemplate sqlSession, String string) {
		return sqlSession.selectOne("exMapper.getEsreqListCount",string);
	}

	public ArrayList<EsRequest> selectEsRequest(SqlSessionTemplate sqlSession, String coId, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper.selectEsRequest", coId, rowBounds);
	}

	public int EsListCount(SqlSessionTemplate sqlSession, Map<String, String> status) {
		return sqlSession.selectOne("exMapper.EsListCount", status);
	}

	public Media selectproImg(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper.selectcoProImg", coId);
	}

	public Media selectbkImg(SqlSessionTemplate sqlSession, int bkNo) {
		return sqlSession.selectOne("exMapper.selectbkImg",bkNo);
	}

	public ArrayList<Estimate> selectEstimateAddLsit(SqlSessionTemplate sqlSession, PageInfo pi,
			Map<String, String> status) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("exMapper.selectEstimateAddList", status, rowBounds);
	}
}

