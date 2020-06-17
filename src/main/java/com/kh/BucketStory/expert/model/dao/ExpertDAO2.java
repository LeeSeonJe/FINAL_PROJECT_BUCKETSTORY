package com.kh.BucketStory.expert.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

@Repository("exDAO2")
public class ExpertDAO2 {

//	public ArrayList<Pay> selectPayList(SqlSessionTemplate sqlSession, String coid) {
//		
//		List<Object> list = sqlSession.selectList("exMapper.selectPayList", coid);
//		
//		return null;
//	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("exMapper2.getListCount");
	}
	public int getListCount(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getListCount2",coId);
	}
	
	public ArrayList<Pay> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectList", null, rowBounds);
	}
	public ArrayList<Pay> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String coId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectList2", coId, rowBounds);
	}
	
	public int insertPoint(SqlSessionTemplate sqlSession, Pay p) {
		return sqlSession.insert("exMapper2.insertPoint", p);
	}

	public int getYPoint(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getYCount",coId);
	}
	public int getNPoint(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getNCount",coId);
	}
	public int insertQnA(SqlSessionTemplate sqlSession, adminQnA aQ) {
		return sqlSession.insert("exMapper2.insertQnA", aQ);
	}


}
