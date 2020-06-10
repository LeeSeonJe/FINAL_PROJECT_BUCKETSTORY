package com.kh.BucketStory.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.dao.BoardDAO;
import com.kh.BucketStory.admin.model.vo.Festival;


@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertfestival(Festival f) {
		return bDAO.insertfestival(sqlSession, f);
	}



}
