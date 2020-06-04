package com.kh.BucketStory.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;

@Repository("mainDAO")
public class MainDAO {

	public ArrayList<BucketList> selectBucketList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectBucketList");
	}

	public ArrayList<Media> selectBLImg(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectBLImg");
	}

	public int blLike(SqlSessionTemplate sqlSession, int bkNo, String userId) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("bkNo", ""+bkNo);
		hashmap.put("userId", userId);
		int blLikeCheck = sqlSession.selectOne("mainMapper.blLikeCheck", hashmap);
		
		int blLike = 0;
		int result1 = 0;
		int result2 = 0;
		
		if(blLikeCheck > 0) {
			result1 = sqlSession.update("mainMapper.blLikeDown", bkNo);
			result2 = sqlSession.delete("mainMapper.deleteblLike", hashmap);
		} else {
			result1 = sqlSession.update("mainMapper.blLikeUp", bkNo);
			result2 = sqlSession.insert("mainMapper.insertblLike", hashmap);
		}
		
		if(result1 > 0 && result2 > 0) {
			blLike = sqlSession.selectOne("mainMapper.blLike", bkNo);
		} else {
			System.out.println("실패");
		}
		
		return blLike;
	}

	
}
