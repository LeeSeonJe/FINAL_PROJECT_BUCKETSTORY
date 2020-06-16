package com.kh.BucketStory.member.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;

public interface MemberService{

	int bucketInsert(Media m, BucketList bL);

	ArrayList<MemberMyBucketList> myBucketList(String userId);

	int blogInsert(Board board);

	ArrayList<Board> getBoard(Board b);

	int getListCount();

	ArrayList<MemberMyBucketList> myBucketListPage(String userId, PageInfo pi);	
	
}
