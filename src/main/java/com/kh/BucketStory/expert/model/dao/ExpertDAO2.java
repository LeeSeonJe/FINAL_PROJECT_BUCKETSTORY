package com.kh.BucketStory.expert.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.expert.model.vo.Pay;

@Repository("exDAO2")
public class ExpertDAO2 {

	public ArrayList<Pay> selectPayList(SqlSessionTemplate sqlSession, String coid) {
		
		List<Object> list = sqlSession.selectList("exMapper.selectPayList", coid);
		
		return null;
	}

	
}
