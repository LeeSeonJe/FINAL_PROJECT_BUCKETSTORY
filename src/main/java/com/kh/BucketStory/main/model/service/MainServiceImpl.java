package com.kh.BucketStory.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.main.model.dao.MainDAO;
import com.kh.BucketStory.member.model.vo.Board;

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

	@Override
	public String blWish(int bkNo, String userId) {
		return mainDAO.blWish(sqlSession, bkNo, userId);
	}

	@Override
	public ArrayList<WishList> selectWishList(String userId) {
		return mainDAO.selectWishList(sqlSession, userId);
	}

	@Override
	public int blShare(int bkNo, String userId) {
		return mainDAO.blShare(sqlSession, bkNo, userId);
	}

	@Override
	public ArrayList<ShareBucket> selectShareList(String userId) {
		return mainDAO.selectShareList(sqlSession, userId);
	}

	@Override
	public ArrayList<Member> selectShareMList(int bkNo) {
		return mainDAO.selectShareMList(sqlSession, bkNo);
	}

	@Override
	public ArrayList<Board> selectbMList(int bkNo) {
		return mainDAO.selectbMList(sqlSession, bkNo);
	}

}
