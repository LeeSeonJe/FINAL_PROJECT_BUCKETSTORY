package com.kh.BucketStory.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.vo.Notify;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.BoardComment;
import com.kh.BucketStory.member.model.vo.Follow;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;
import com.kh.BucketStory.member.model.vo.Reply;

@Repository("mDAO")
public class MemberDAO {

	public int bucketInsert(SqlSessionTemplate sqlSession, Media m, BucketList bL) {

		int result1 = sqlSession.insert("memberMapper.insertBucket", bL);
		int result2 = 0;
		if (result1 > 0) {
			result2 = sqlSession.insert("memberMapper.insertbMedia", m);
		}

		return result2;
	}

	public ArrayList<MemberMyBucketList> myBucketList(SqlSessionTemplate sqlSession, String nickName) {
		return (ArrayList) sqlSession.selectList("memberMapper.myBucketList", nickName);
	}

	public int blogInsert(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("memberMapper.blogInsert", board);
	}

	public ArrayList<Board> getBoard(SqlSessionTemplate sqlSession, String userid, int bn) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("bn", bn);
		return (ArrayList) sqlSession.selectList("memberMapper.getBoard", map);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.getListCount", userId);
	}

	public ArrayList<MemberMyBucketList> myBucketListPage(SqlSessionTemplate sqlSession, String nickName, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("memberMapper.myBucketListPage", nickName, rowBounds);
	}

	public String getUserId(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.getUserId", nickName);
	}

	public Member getMEmber(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.getMember", nickName);
	}

	public ArrayList<BoardComment> bCommentInsert(SqlSessionTemplate sqlSession, BoardComment boardComment) {
		int result = sqlSession.insert("memberMapper.bCommentInsert", boardComment);
		if (result > 0) {
			ArrayList<BoardComment> bCommentList = (ArrayList) sqlSession.selectList("memberMapper.getBoardCommentList",
					boardComment);
			return bCommentList;
		}
		return null;
	}

	public ArrayList<Reply> replyInsert(SqlSessionTemplate sqlSession, Reply reply) {
		int result = sqlSession.insert("memberMapper.replyInsert", reply);
		if (result > 0) {
			ArrayList<Reply> replyList = (ArrayList) sqlSession.selectList("memberMapper.getReplyList", reply);
			return replyList;
		}
		return null;
	}

	public BoardComment bCommentUpdate(SqlSessionTemplate sqlSession, BoardComment boardComment) {
		int result = sqlSession.update("memberMapper.bCommentUpdate", boardComment);
		if (result > 0) {
			BoardComment bc = sqlSession.selectOne("memberMapper.getBoardComment", boardComment);
			return bc;
		}
		return null;
	}

	public Reply replyUpdate(SqlSessionTemplate sqlSession, Reply reply) {
		int result = sqlSession.update("memberMapper.replyUpdate", reply);
		if (result > 0) {
			Reply r = sqlSession.selectOne("memberMapper.getReply", reply);
			return r;
		}
		return null;
	}

	public int commentDelete(SqlSessionTemplate sqlSession, Integer cmNo) {
		return sqlSession.update("memberMapper.commentDelete", cmNo);
	}

	public int replyDelete(SqlSessionTemplate sqlSession, Integer rpNo) {
		return sqlSession.update("memberMapper.replyDelete", rpNo);
	}

	public ArrayList<WishList> getWishList(SqlSessionTemplate sqlSession, String userid) {
		return (ArrayList) sqlSession.selectList("memberMapper.getWishList", userid);
	}

	public ArrayList<Follow> getFollowingList(SqlSessionTemplate sqlSession, String userid) {
		return (ArrayList) sqlSession.selectList("memberMapper.getFollowingList", userid);
	}

	public ArrayList<Follow> getFollowerList(SqlSessionTemplate sqlSession, String userid) {
		return (ArrayList) sqlSession.selectList("memberMapper.getFollowerList", userid);
	}

	public int followCheck(SqlSessionTemplate sqlSession, String userId2, String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId2", userId2);
		map.put("userId", userId);
		return sqlSession.selectOne("memberMapper.followCheck", map);
	}

	public int follow(SqlSessionTemplate sqlSession, Follow follow) {
		return sqlSession.insert("memberMapper.follow", follow);
	}

	public int unfollow(SqlSessionTemplate sqlSession, Follow follow) {
		return sqlSession.delete("memberMapper.unfollow", follow);
	}

	public int bReportCheck(SqlSessionTemplate sqlSession, Notify n) {
		return sqlSession.selectOne("memberMapper.bReportCheck", n);
	}

	public int cReportCheck(SqlSessionTemplate sqlSession, Notify n) {
		return sqlSession.selectOne("memberMapper.cReportCheck", n);
	}

	public int rReportCheck(SqlSessionTemplate sqlSession, Notify n) {
		return sqlSession.selectOne("memberMapper.rReportCheck", n);
	}

	public int bReportInsert(SqlSessionTemplate sqlSession, Notify n) {
		return sqlSession.insert("memberMapper.bReportInsert", n);
	}

	public int cReportInsert(SqlSessionTemplate sqlSession, Notify n) {
		return sqlSession.insert("memberMapper.cReportInsert", n);
	}

	public int rReportInsert(SqlSessionTemplate sqlSession, Notify n) {
		return sqlSession.insert("memberMapper.rReportInsert", n);
	}
}
