package com.kh.BucketStory.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.member.model.vo.Board;

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

	public String blWish(SqlSessionTemplate sqlSession, int bkNo, String userId) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("bkNo", ""+bkNo);
		hashmap.put("userId", userId);
		
		int blWishCheck = sqlSession.selectOne("mainMapper.blWishCheck", hashmap);
		int result = 0;
		String resultString = null;
		
		if(blWishCheck > 0) {
			result = sqlSession.delete("mainMapper.deleteWish", hashmap);
			if(result > 0) {
				resultString = "등록";
			} else {
				System.out.println("실패");
			}
		} else {
			result = sqlSession.insert("mainMapper.insertWish", hashmap);
			if(result > 0) {
				resultString = "취소";
			} else {
				System.out.println("실패");
			}
		}
		
		
		return resultString;
	}

	public ArrayList<WishList> selectWishList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectWishList", userId);
	}

	public int blShare(SqlSessionTemplate sqlSession, int bkNo, String userId) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("bkNo", ""+bkNo);
		hashmap.put("userId", userId);
		
		return sqlSession.insert("mainMapper.blShere", hashmap);
	}

	public ArrayList<ShareBucket> selectShareList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectShereList", userId);
	}

	public ArrayList<Member> selectShareMList(SqlSessionTemplate sqlSession, int bkNo) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectShareMList", bkNo);
	}

	public ArrayList<Board> selectbMList(SqlSessionTemplate sqlSession, int bkNo, String nickName) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("bkNo", ""+bkNo);
		hashmap.put("nickName", nickName);
		return (ArrayList)sqlSession.selectList("mainMapper.selectbMList", hashmap);
	}

	public ArrayList<BucketList> selectRecoBucketList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectRecoBucketList");
	}

	public ArrayList<Board> selectBlogList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectBlogList");
	}

	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectAllMember");
	}

	public ArrayList<BucketList> selectAllBucket(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectAllBucket");
	}

	public ArrayList<BucketList> selectSearchBucket(SqlSessionTemplate sqlSession, String b) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectSearchBucket", b);
	}

	public ArrayList<BucketList> selectSearchTag(SqlSessionTemplate sqlSession, String t) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectSearchTag", t);
	}

	
}
