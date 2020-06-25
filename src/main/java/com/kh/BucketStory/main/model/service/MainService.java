package com.kh.BucketStory.main.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.C_event;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.member.model.vo.Board;

public interface MainService {

	ArrayList<BucketList> selectBucketList();

	ArrayList<Media> selectBucketImg();

	int blLike(int bkNo, String userId);

	String blWish(int bkNo, String userId, String bucketId);

	ArrayList<WishList> selectWishList(String userId);

	int blShare(int bkNo, String userId);

	ArrayList<ShareBucket> selectShareList(String userId);

	ArrayList<Member> selectShareMList(int bkNo);

	ArrayList<Board> selectbMList(int bkNo, String nickName);

	ArrayList<BucketList> selectRecoBucketList();

	ArrayList<Board> selectBlogList();

	ArrayList<Member> selectAllMember();

	ArrayList<BucketList> selectAllBucket();

	ArrayList<BucketList> selectSearchBucket(String b);

	ArrayList<BucketList> selectSearchTag(String t);

	ArrayList<BucketList> selectRankBucketList();

	ArrayList<BucketList> selectCoBucket(String coId);

	int countDetailWhat(int bkNo, String coId);

	ArrayList<Company> selectDetailCompany(int bkNo);

	ArrayList<Festival> selectFestival(String year);

	ArrayList<Media> selectFmList();

	ArrayList<Company> selectCompany();

	ArrayList<Media> selectCompMedia();

	ArrayList<BucketList> selectDetailSup(String coId);

	ArrayList<C_event> selectCpFestival(String year);

	int deleteCoBucekt(int bkNo, String coId);

	ArrayList<C_event> selectCpEvent(int bkNo);

	ArrayList<Company> selectAllCompany();

	ArrayList<Company> selectSearchCompany(String c);

	int selectNickCheck(String nickName);

	int updateMember(Member m);

	int updatePwd(String userId, String encPwd);

}
