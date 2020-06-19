package com.kh.BucketStory.member.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.member.model.dao.MemberDAO;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.BoardComment;
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

}
