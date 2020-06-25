package com.kh.BucketStory.common.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.common.model.dao.CommonDAO;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;
import com.sun.javafx.collections.MappingChange.Map;

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
	public int idDuplicateCheck2(String id2) {
		return cDAO.idDuplicateCheck2(sqlSession, id2);
	}

	@Override
	public int nickNameCheck(String nick) {
		return cDAO.nickNameCheck(sqlSession, nick);
	}
	@Override
	public Member findAccount(String email) {
		return cDAO.findAccount(sqlSession, email);
	}

	@Override
	public String compareEmail(String email) {
		return cDAO.compareEmail(sqlSession, email);
	}
	
	@Override
	public String compareEmail2(String busiemail) {
		return cDAO.compareEmail2(sqlSession, busiemail);
	}

	@Override
	public int getPw(String id, String email) {
		return cDAO.getPw(sqlSession, id, email);
	}

	@Override
	public int SearchPw(String id, String email, String joinCode) {
		return cDAO.SearchPw(sqlSession, id, email, joinCode);
	}

	@Override
	public void update_pw(String joinCode) {
		
	}

	
}
