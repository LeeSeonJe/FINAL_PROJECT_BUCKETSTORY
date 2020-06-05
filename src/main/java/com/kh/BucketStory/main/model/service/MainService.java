package com.kh.BucketStory.main.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;

public interface MainService {

	ArrayList<BucketList> selectBucketList();

	ArrayList<Media> selectBucketImg();

	int blLike(int bkNo, String userId);

	String blWish(int bkNo, String userId);

	ArrayList<WishList> selectWishList(String userId);

	int blShare(int bkNo, String userId);

	ArrayList<ShareBucket> selectShareList(String userId);

}
