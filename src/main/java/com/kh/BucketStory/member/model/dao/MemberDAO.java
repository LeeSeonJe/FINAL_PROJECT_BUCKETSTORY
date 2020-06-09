package com.kh.BucketStory.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;

@Repository("mDAO")
public class MemberDAO {

	public int bucketInsert(SqlSessionTemplate sqlSession, Media m, BucketList bL) {
		
		int result1 = sqlSession.insert("memberMapper.insertBucket", bL);
		int result2 = 0;
		if(result1 > 0) {
			result2 = sqlSession.insert("memberMapper.insertbMedia", m);
		}
		
		return result2;
	}
	
	

}
