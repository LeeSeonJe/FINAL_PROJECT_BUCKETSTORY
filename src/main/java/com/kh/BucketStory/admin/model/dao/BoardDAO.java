package com.kh.BucketStory.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.exception.BoardException;
import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.admin.model.vo.Notify;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;

@Repository("bDAO")
public class BoardDAO {


	public int insertfestival(SqlSessionTemplate sqlSession, Festival f, Media m) {
		int result = sqlSession.insert("adminMapper.insertfestival", f);
		if(result > 0) {
			return sqlSession.insert("adminMapper.insertfestivalimg", m);
		} else {
			throw new BoardException("게시물 등록에 실패하였습니다.");
		}
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	public ArrayList<adminQnA> adminQnAselectList(SqlSessionTemplate sqlSession, PageInfo pi) {
	
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminQnAselectList", null, rowBounds);
	}

	public adminQnA adminqnadetailview(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("adminMapper.adminqnadetailview", qno);
	}

	public adminQnA adminqnaUpdate(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("adminMapper.adminqnaUpdate", qno);
	}

	public int adminqnaUpdatedetail(SqlSessionTemplate sqlSession, adminQnA a) {
		return sqlSession.update("adminMapper.adminqnaUpdatedetail", a);
	}

	public ArrayList<Notify> notifyselectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.notifyselectList", null, rowBounds);
	}

	public int cautionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.cautionListCount");
	}
	
	public int waringmember(SqlSessionTemplate sqlSession, int[] no) {
		int result = 0;
		
		for(int i = 0; i < no.length; i++) {
			
			result += sqlSession.update("adminMapper.warningMember", no[i]);
		}
		
		if(result == no.length) {
			return result;
		} else {
			throw new BoardException("실패");
		}
	}

	public ArrayList<Notify> Memberlist(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.Memberlist", null, rowBounds);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, int[] no) {
		int result = 0;
		
		for(int i = 0; i < no.length; i++) {
			
			result += sqlSession.update("adminMapper.deleteMember", no[i]);
		}
		
		if(result == no.length) {
			return result;
		} else {
			throw new BoardException("삭제에 실패하였습니다.");
		}
	}










}
