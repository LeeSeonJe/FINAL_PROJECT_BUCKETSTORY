package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.expert.model.dao.ExpertDAO2;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

@Service("ExService2")
public class ExpertServiceImpl2 implements ExpertService2 {

	@Autowired
	private ExpertDAO2 exDAO2;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String test(String coid) {
		return null;
	}

	@Override
	public int getListCount() {
		return exDAO2.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Pay> selectList(PageInfo pi) {
		return exDAO2.selectList(sqlSession, pi);
	}

	@Override
	public int insertPoint(Pay p) {
		return  exDAO2.insertPoint(sqlSession, p);
	}




}
