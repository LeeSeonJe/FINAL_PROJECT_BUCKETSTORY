package com.kh.BucketStory.member.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;

public interface MemberService{

	int bucketInsert(Media m, BucketList bL);

	ArrayList<MemberMyBucketList> myBucketList(String userId);

//	ArrayList<Media> myBucketListMedia(ArrayList<BucketList> bucketList);
	
	
}
