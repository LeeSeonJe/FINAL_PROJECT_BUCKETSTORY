package com.kh.BucketStory.common.model.dao;

import org.apache.catalina.User;
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
		return sqlSession.selectOne("commonMapper.checkIdDup", id);
	}

	public Member findAccount(SqlSessionTemplate sqlSession, String email) {
		return (Member) sqlSession.selectOne("commonMapper.findAccount", email);
	}

	
}
