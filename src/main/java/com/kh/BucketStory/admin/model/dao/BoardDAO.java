package com.kh.BucketStory.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.vo.Festival;

@Repository("bDAO")
public class BoardDAO {


	public int insertfestival(SqlSessionTemplate sqlSession, Festival f) {
		return sqlSession.insert("boardMapper.insertfestival", f);
	}


}
