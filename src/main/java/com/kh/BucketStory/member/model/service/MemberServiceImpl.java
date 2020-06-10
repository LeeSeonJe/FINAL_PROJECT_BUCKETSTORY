package com.kh.BucketStory.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.member.model.dao.MemberDAO;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int bucketInsert(Media m, BucketList bL) {
		return mDAO.bucketInsert(sqlSession, m, bL);
	}

	@Override
	public ArrayList<MemberMyBucketList> myBucketList(String userId) {
		return mDAO.myBucketList(sqlSession, userId);
	}

//	@Override
//	public ArrayList<Media> myBucketListMedia(ArrayList<BucketList> bucketList) {
//		return mDAO.myBucketListMedia(sqlSession, bucketList);
//	}

	
}
