package com.kh.BucketStory.member.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.vo.Notify;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.member.model.dao.MemberDAO;
import com.kh.BucketStory.member.model.vo.BLike;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.BoardComment;
import com.kh.BucketStory.member.model.vo.Follow;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;
import com.kh.BucketStory.member.model.vo.Reply;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int bucketInsert(Media m, BucketList bL) {
		return mDAO.bucketInsert(sqlSession, m, bL);
	}

	@Override
	public ArrayList<MemberMyBucketList> myBucketList(String nickName) {
		return mDAO.myBucketList(sqlSession, nickName);
	}

	@Override
	public int blogInsert(Board board) {
		return mDAO.blogInsert(sqlSession, board);
	}

	@Override
	public int getListCount(String userId) {
		return mDAO.getListCount(sqlSession, userId);
	}

	@Override
	public ArrayList<MemberMyBucketList> myBucketListPage(String nickName, PageInfo pi) {
		return mDAO.myBucketListPage(sqlSession, nickName, pi);
	}

	@Override
	public ArrayList<Board> getBoard(String nickName, int bn) {
		String userid = mDAO.getUserId(sqlSession, nickName);
		return mDAO.getBoard(sqlSession, userid, bn);
	}

	@Override
	public Member getMember(String nickName) {
		return mDAO.getMEmber(sqlSession, nickName);
	}

	@Override
	public ArrayList<BoardComment> bCommentInsert(BoardComment boardComment) {
		return mDAO.bCommentInsert(sqlSession, boardComment);
	}

	@Override
	public ArrayList<Reply> replyInsert(Reply reply) {
		return mDAO.replyInsert(sqlSession, reply);
	}

	@Override
	public BoardComment bCommentUpdate(BoardComment boardComment) {
		return mDAO.bCommentUpdate(sqlSession, boardComment);
	}

	@Override
	public Reply replyUpdate(Reply reply) {
		return mDAO.replyUpdate(sqlSession, reply);
	}

	@Override
	public int commentDelete(Integer cmNo) {
		return mDAO.commentDelete(sqlSession, cmNo);
	}

	@Override
	public int replyDelete(Integer rpNo) {
		return mDAO.replyDelete(sqlSession, rpNo);
	}

	@Override
	public ArrayList<WishList> getWishList(String nickName) {
		String userid = mDAO.getUserId(sqlSession, nickName);
		return mDAO.getWishList(sqlSession, userid);
	}

	@Override
	public ArrayList<Follow> getFollowingList(String nickName) {
		String userid = mDAO.getUserId(sqlSession, nickName);
		return mDAO.getFollowingList(sqlSession, userid);
	}

	@Override
	public ArrayList<Follow> getFollowerList(String nickName) {
		String userid = mDAO.getUserId(sqlSession, nickName);
		return mDAO.getFollowerList(sqlSession, userid);
	}

	@Override
	public int followCheck(String nickName, String userId) {
		String userid2 = mDAO.getUserId(sqlSession, nickName);
		return mDAO.followCheck(sqlSession, userid2, userId);
	}

	@Override
	public int follow(Follow follow) {
		return mDAO.follow(sqlSession, follow);
	}

	@Override
	public int unfollow(Follow follow) {
		return mDAO.unfollow(sqlSession, follow);
	}

	@Override
	public int bReportCheck(Notify n) {
		return mDAO.bReportCheck(sqlSession, n);
	}

	@Override
	public int cReportCheck(Notify n) {
		return mDAO.cReportCheck(sqlSession, n);
	}

	@Override
	public int rReportCheck(Notify n) {
		return mDAO.rReportCheck(sqlSession, n);
	}

	@Override
	public int bReportInsert(Notify n) {
		return mDAO.bReportInsert(sqlSession, n);
	}

	@Override
	public int cReportInsert(Notify n) {
		return mDAO.cReportInsert(sqlSession, n);
	}

	@Override
	public int rReportInsert(Notify n) {
		return mDAO.rReportInsert(sqlSession, n);
	}

	@Override
	public int bLikeAdd(BLike bl) {
		return mDAO.bLikeAdd(sqlSession, bl);
	}

	@Override
	public int bLikeDel(BLike bl) {
		return mDAO.bLikeDel(sqlSession, bl);
	}

	@Override
	public int bLikeCheck(BLike bl) {
		return mDAO.bLikeCheck(sqlSession, bl);
	}

	@Override
	public Board getUpdateBoard(Integer bNo) {
		return mDAO.getUpdateBoard(sqlSession, bNo);
	}

	@Override
	public int bUpdate(Board board) {
		return mDAO.bUpdate(sqlSession, board);
	}

	@Override
	public int blogDelte(Board board) {
		return mDAO.blogDelte(sqlSession, board);
	}

	@Override
	public BucketList getBucket(Integer bkNo) {
		return mDAO.getBucket(sqlSession, bkNo);
	}

	@Override
	public int bucketUpdate(Media m, BucketList bL) {
		return mDAO.bucketUpdate(sqlSession, m, bL);
	}

	@Override
	public int profileChange(Member mb) {
		return mDAO.profileChange(sqlSession, mb);
	}

	@Override
	public int dateUpdate(String userid, int bkNo) {
		return mDAO.dateUpdate(sqlSession, userid, bkNo);
	}

	@Override
	public String getUserId(String nickName) {
		return mDAO.getUserId(sqlSession, nickName);
	}

}
