package com.kh.BucketStory.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.C_event;
import com.kh.BucketStory.expert.model.vo.Company;
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

	public ArrayList<BucketList> selectRankBucketList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectRankBucketList");
	}

	public ArrayList<BucketList> selectCoBucket(SqlSessionTemplate sqlSession, String coId) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectCoBucket", coId);
	}

	public int countDetailWhat(SqlSessionTemplate sqlSession, int bkNo, String coId) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("bkNo", ""+bkNo);
		hashmap.put("coId", coId);
		return sqlSession.selectOne("mainMapper.countDetailWhat", hashmap);
	}

	public ArrayList<Company> selectDetailCompany(SqlSessionTemplate sqlSession, int bkNo) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectDetailCompany", bkNo);
	}

	public ArrayList<Festival> selectFestival(SqlSessionTemplate sqlSession, String year) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectFestival", year);
	}

	public ArrayList<Media> selectFmList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectFmList");
	}

	public ArrayList<Company> selectCompany(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectCompany");
	}

	public ArrayList<Media> selectCompMedia(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectCompMedia");
	}

	public ArrayList<BucketList> selectDetailSup(SqlSessionTemplate sqlSession, String coId) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectDetailSup", coId);
	}

	public ArrayList<C_event> selectCpFestival(SqlSessionTemplate sqlSession, String year) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectCpFestival", year);
	}

	public int deleteCoBucekt(SqlSessionTemplate sqlSession, int bkNo, String coId) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("bkNo", ""+bkNo);
		hashmap.put("coId", coId);
		return sqlSession.delete("mainMapper.deleteCoBucekt", hashmap);
	}

	public ArrayList<C_event> selectCpEvent(SqlSessionTemplate sqlSession, int bkNo) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectCpEvent", bkNo);
	}

	public ArrayList<Company> selectAllCompany(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectAllCompany");
	}

	public ArrayList<Company> selectSearchCompany(SqlSessionTemplate sqlSession, String c) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectSearchCompany", c);
	}

	
}
