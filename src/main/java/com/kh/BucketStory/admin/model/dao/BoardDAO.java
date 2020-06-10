package com.kh.BucketStory.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.admin.model.exception.BoardException;
import com.kh.BucketStory.admin.model.vo.Festival;
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



}
