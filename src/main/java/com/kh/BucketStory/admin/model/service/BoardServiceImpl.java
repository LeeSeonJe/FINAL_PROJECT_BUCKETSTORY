package com.kh.BucketStory.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.dao.BoardDAO;
import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;


@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertfestival(Festival f, Media m) {
		return bDAO.insertfestival(sqlSession, f, m);
	}

	@Override
	public int getListCount() {
		return bDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<adminQnA> adminQnAselectList(PageInfo pi) {
		return bDAO.adminQnAselectList(sqlSession, pi);
	}

	@Override
	public adminQnA adminqnadetail(int qno) {
		return bDAO.adminqnadetail(sqlSession, qno);
	}




}
