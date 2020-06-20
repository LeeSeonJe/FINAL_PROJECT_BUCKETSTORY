package com.kh.BucketStory.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.common.model.dao.CommonDAO;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

@Service("cService")
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member memberLogin(Member m) {
		return cDAO.memberLogin(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return cDAO.insertMember(sqlSession, m);
	}

	@Override
	public Company companyLogin(Company c) {
		return cDAO.companyLogin(sqlSession, c);
	}
	
	@Override
	public int insertCompany(Company c) {
		return cDAO.insertCompany(sqlSession, c);
	}

	@Override
	public int idDuplicateCheck(String id) {
		return cDAO.idDuplicateCheck(sqlSession, id);
	}

	@Override
	public Member findAccount(String email) {
		return cDAO.findAccount(sqlSession, email);
	}

}
