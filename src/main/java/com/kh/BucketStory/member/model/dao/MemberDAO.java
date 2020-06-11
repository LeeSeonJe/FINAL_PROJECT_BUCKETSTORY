package com.kh.BucketStory.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;

@Repository("mDAO")
public class MemberDAO {

	public int bucketInsert(SqlSessionTemplate sqlSession, Media m, BucketList bL) {

		int result1 = sqlSession.insert("memberMapper.insertBucket", bL);
		int result2 = 0;
		if (result1 > 0) {
			result2 = sqlSession.insert("memberMapper.insertbMedia", m);
		}

		return result2;
	}

	public ArrayList<MemberMyBucketList> myBucketList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList) sqlSession.selectList("memberMapper.myBucketList", userId);
	}

	public int blogInsert(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("memberMapper.blogInsert", board);
	}
}
