package com.kh.BucketStory.expert.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.expert.model.vo.Category;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

@Repository("exDAO2")
public class ExpertDAO2 {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("exMapper2.getListCountAll");
	}
	public int getListCount(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getListCount",coId);
	}
	public int getListCountY(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getListCountY",coId);
	}
	public int getListCountN(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getListCountN",coId);
	}
	
	public ArrayList<Pay> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectListAll", null, rowBounds);
	}
	public ArrayList<Pay> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String coId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectList", coId, rowBounds);
	}
	public ArrayList<Pay> selectListY(SqlSessionTemplate sqlSession, PageInfo pi, String coId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectListY", coId, rowBounds);
	}
	public ArrayList<Pay> selectListN(SqlSessionTemplate sqlSession, PageInfo pi, String coId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectListN", coId, rowBounds);
	}
	
	// Point 
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
	
	// Company
	public int updateCompany(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.update("exMapper2.updateCompany", c);
	}
	public int updateComapnyPoint(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.update("exMapper2.updateCompanyPoint", c);
	}
	public ArrayList<Company> selectTop5havingPoint(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("exMapper2.selectTop5havingPoint");
	}
	public Category selectCateName(SqlSessionTemplate sqlSession, int cateNum) {
		return sqlSession.selectOne("exMapper2.selectCateName",cateNum);
	}
	public int updatehelper(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.update("exMapper2.updatehelper", c);
	}
	public adminQnA getQnAno(SqlSessionTemplate sqlSession, int q_no) {
		return sqlSession.selectOne("exMapper2.selectQnAno", q_no);
	}
	public int deleteQnA(SqlSessionTemplate sqlSession, int q_no) {
		return sqlSession.delete("exMapper2.deleteQnA", q_no);
	}
	public int updateQnA(SqlSessionTemplate sqlSession, adminQnA aQ) {
		return sqlSession.update("exMapper2.updateQnA", aQ);
	}
	
	// QNA 리스트 게시판(기업용)
	public int getListQnACount(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getListQnACount",coId);
	}
	public int getListQnACountY(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getListQnACountY",coId);
	}
	public int getListQnACountN(SqlSessionTemplate sqlSession, String coId) {
		return sqlSession.selectOne("exMapper2.getListQnACountN",coId);
	}
	public ArrayList<adminQnA> selectQnAList(SqlSessionTemplate sqlSession, PageInfo pi, String coId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectQnAList", coId, rowBounds);
	}
	public ArrayList<adminQnA> selectQnAListY(SqlSessionTemplate sqlSession, PageInfo pi, String coId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectQnAListY", coId, rowBounds);
	}
	public ArrayList<adminQnA> selectQnAListN(SqlSessionTemplate sqlSession, PageInfo pi, String coId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectQnAListN", coId, rowBounds);
	}
	
	// QNA 리스트 게시판(회원용)
	public int getListMQnACount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("exMapper2.getListMQnACount",userId);
	}

	public int getListMQnACountN(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("exMapper2.getListMQnACountN",userId);
	}
	public int getListMQnACountY(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("exMapper2.getListMQnACountY",userId);
	}
	
	public ArrayList<adminQnA> selectMQnAListN(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectQnAListN", userId, rowBounds);
	}
	public ArrayList<adminQnA> selectMQnAListY(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectQnAListY", userId, rowBounds);
	}
	public ArrayList<adminQnA> selectMQnAList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper2.selectQnAList", userId, rowBounds);
	}





}
