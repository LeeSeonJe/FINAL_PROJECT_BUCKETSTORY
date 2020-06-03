package com.kh.BucketStory.member.model.service;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.member.model.vo.Member;

public interface MemberService{

	Member memberLogin(Member m);
	
	int insertMember(Member m);

	int bucketInsert(Media m, BucketList bL);
	
	
}
