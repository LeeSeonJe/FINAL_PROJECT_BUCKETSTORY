package com.kh.BucketStory.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.main.model.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDAO mainDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<BucketList> selectBucketList() {
		return mainDAO.selectBucketList(sqlSession);
	}

	@Override
	public ArrayList<Media> selectBucketImg() {
		return mainDAO.selectBLImg(sqlSession);
	}

	@Override
	public int blLike(int bkNo, String userId) {
		return mainDAO.blLike(sqlSession, bkNo, userId);
	}

}
