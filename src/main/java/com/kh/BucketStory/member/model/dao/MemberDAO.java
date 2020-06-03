package com.kh.BucketStory.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int bucketInsert(SqlSessionTemplate sqlSession, Media m, BucketList bL) {
		
		int result1 = sqlSession.insert("memberMapper.insertBucket", bL);
		int result2 = 0;
		if(result1 > 0) {
			result2 = sqlSession.insert("memberMapper.insertbMedia", m);
		}
		
		return result2;
	}
	
	

}
