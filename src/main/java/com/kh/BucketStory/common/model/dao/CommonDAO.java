package com.kh.BucketStory.common.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

@Transactional
@Repository("cDAO")
public class CommonDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("commonMapper.memberLogin", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("commonMapper.insertMember", m);
	}

	public Company companyLogin(SqlSessionTemplate sqlSession, Company c) {
		return (Company)sqlSession.selectOne("commonMapper.companyLogin", c);
	}
	
	public int insertCompany(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.insert("commonMapper.insertCompany", c);
	}

	public int idDuplicateCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("commonMapper.idDuplicateCheck", id);
	}

	public int idDuplicateCheck2(SqlSessionTemplate sqlSession, String id2) {
		return sqlSession.selectOne("commonMapper.idDuplicateCheck2", id2);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("commonMapper.nickCheck", nick);
	}
	
	public Member findAccount(SqlSessionTemplate sqlSession, String email) {
		return (Member) sqlSession.selectOne("commonMapper.findAccount", email);
	}

	public int getPw(SqlSessionTemplate sqlSession, String id, String email) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("id", id);
		hs.put("email", email);
		return sqlSession.selectOne("commonMapper.getPw", hs);
	}

	public int SearchPw(SqlSessionTemplate sqlSession, String id, String email, String joinCode) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("id", id);
		hs.put("email", email);
		hs.put("joinCode", joinCode);
		return sqlSession.selectOne("commonMapper.SearchPW", hs);
	}

	public Object update_pw(SqlSessionTemplate sqlSession, String joinCode) {
		return sqlSession.selectOne("commonMapper.update_pw", joinCode);
	}

	public String compareEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("commonMapper.compareEmail", email);
	}

	public String compareEmail2(SqlSessionTemplate sqlSession, String busiemail) {
		return sqlSession.selectOne("commonMapper.compareEmail2", busiemail);
	}
	
}
