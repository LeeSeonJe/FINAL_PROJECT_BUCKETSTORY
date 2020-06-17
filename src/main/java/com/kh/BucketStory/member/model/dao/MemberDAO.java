package com.kh.BucketStory.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
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

	public ArrayList<MemberMyBucketList> myBucketList(SqlSessionTemplate sqlSession, String nickName) {
		return (ArrayList) sqlSession.selectList("memberMapper.myBucketList", nickName);
	}

	public int blogInsert(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("memberMapper.blogInsert", board);
	}
	
	public ArrayList<Board> getBoard(SqlSessionTemplate sqlSession, String userid, int bn) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("bn", bn);
		return (ArrayList) sqlSession.selectList("memberMapper.getBoard", map);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.getListCount", userId);
	}

	public ArrayList<MemberMyBucketList> myBucketListPage(SqlSessionTemplate sqlSession, String nickName, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("memberMapper.myBucketListPage", nickName, rowBounds);
	}

	public String getUserId(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.getUserId", nickName);
	}

	public Member getMEmber(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.getMember", nickName);
	}
}
