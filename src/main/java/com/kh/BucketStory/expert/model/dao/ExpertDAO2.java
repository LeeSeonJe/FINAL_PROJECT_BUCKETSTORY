package com.kh.BucketStory.expert.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;

@Repository("exDAO2")
public class ExpertDAO2 {

//	public ArrayList<Pay> selectPayList(SqlSessionTemplate sqlSession, String coid) {
//		
//		List<Object> list = sqlSession.selectList("exMapper.selectPayList", coid);
//		
//		return null;
//	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("exMapper.getListCount");
	}

	public ArrayList<Pay> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("exMapper.selectList", null, rowBounds);
	}

//	<select id = "getListCount" resultType ="_int">
//	select count(*)
//	from PAY
//	</select>
//
//	<select id="selectList" resultMap = "boardResultSet">
//	select *
//	from PAY
//	order by bid desc
//	</select>
	
}
