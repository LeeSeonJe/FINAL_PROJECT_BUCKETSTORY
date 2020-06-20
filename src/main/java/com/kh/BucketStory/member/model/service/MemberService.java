package com.kh.BucketStory.member.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.BoardComment;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;
import com.kh.BucketStory.member.model.vo.Reply;

public interface MemberService{

	int bucketInsert(Media m, BucketList bL);

	ArrayList<MemberMyBucketList> myBucketList(String nickName);

	int blogInsert(Board board);

	int getListCount(String string);

	ArrayList<MemberMyBucketList> myBucketListPage(String nickName, PageInfo pi);

	ArrayList<Board> getBoard(String nickName, int bn);

	Member getMember(String nickName);

	ArrayList<BoardComment> bCommentInsert(BoardComment boardComment);

	ArrayList<Reply> replyInsert(Reply reply);

	BoardComment bCommentUpdate(BoardComment boardComment);

	Reply replyUpdate(Reply reply);
	
	int commentDelete(Integer cmNo);

	int replyDelete(Integer rpNo);	
	
}
