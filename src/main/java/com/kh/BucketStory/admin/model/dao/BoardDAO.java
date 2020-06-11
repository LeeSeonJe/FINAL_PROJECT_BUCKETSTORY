package com.kh.BucketStory.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.exception.BoardException;
import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;

@Repository("bDAO")
public class BoardDAO {


	public int insertfestival(SqlSessionTemplate sqlSession, Festival f, Media m) {
		int result = sqlSession.insert("boardMapper.insertfestival", f);
		if(result > 0) {
			return sqlSession.insert("boardMapper.insertfestivalimg", m);
		} else {
			throw new BoardException("게시물 등록에 실패하였습니다.");
		}
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<adminQnA> adminQnAselectList(SqlSessionTemplate sqlSession, PageInfo pi) {
	
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.adminQnAselectList", null, rowBounds);
	}

	public adminQnA adminqnadetail(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("boardMapper.adminqnadetail", qno);
	}



}
