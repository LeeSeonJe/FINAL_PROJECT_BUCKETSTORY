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
import com.kh.BucketStory.admin.model.vo.Warning;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.expert.model.vo.Company;

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

	public ArrayList<Notify> boardCommentList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.boardCommentList", null, rowBounds);
		
//		ArrayList list = (ArrayList)sqlSession.selectList("adminMapper.boardselectList", null, rowBounds);
		
//		if(list.size() > 0){
//			return (ArrayList)sqlSession.selectList("adminMapper.replyselectList", null, rowBounds);
//		} else if(list.size() > 0){
//			return (ArrayList)sqlSession.selectList("adminMapper.comselectList", null, rowBounds);
//		} else {
//			throw new BoardException("리스트를 실패");
//		}
	}

	public int cautionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.cautionListCount");
	}
	
//	public int waringmember(SqlSessionTemplate sqlSession, int[] no, Member m) {
//		int result = 0;
//		
//		for(int i = 0; i < no.length; i++) {
//			
//			result += sqlSession.update("adminMapper.warningMember", no[i]);
//		}
//		
//		if(result == no.length) {
//			return sqlSession.update("adminMapper.cautionMember", m);
//		} else {
//			throw new BoardException("실패");
//		}
//	}

	public ArrayList<Notify> Memberlist(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.Memberlist", null, rowBounds);
	}

//	public int deleteMember(SqlSessionTemplate sqlSession, int[] no) {
//		int result = 0;
//		
//		for(int i = 0; i < no.length; i++) {
//			
//			result += sqlSession.update("adminMapper.deleteMember", no[i]);
//		}
//		
//		if(result == no.length) {
//			return result;
//		} else {
//			throw new BoardException("삭제에 실패하였습니다.");
//		}
//	}

	public int warningMember(SqlSessionTemplate sqlSession, List<String> no) {
		int result =  sqlSession.update("adminMapper.warningandcaution", no);
		
//		System.out.println("DAO 결과 값 " + result );
		
		if(result > 0) {
			return sqlSession.update("adminMapper.warningMember", no);
		} else {
			throw new BoardException("업데이트 실패");
		}
	}

	public int deleteMember(SqlSessionTemplate sqlSession, List<String> no) {
		int result = sqlSession.update("adminMapper.deleteNotify", no);
		
		if(result > 0) {
			return sqlSession.update("adminMapper.deleteMember", no);
		} else {
			throw new BoardException("회원  삭제 실패");
		}
			
	}

	public ArrayList<Company> companylist(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.companylist", null, rowBounds);
	}

	public int companyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.companyListCount");
	}

	public Company adminCompanyDetail(SqlSessionTemplate sqlSession, String c) {
		return sqlSession.selectOne("adminMapper.adminCompanyDetail", c);
	}

	public int companyanppoval(SqlSessionTemplate sqlSession, String c) {
		return sqlSession.update("adminMapper.companyanppoval", c);
	}

	public int uncompayanpporval(SqlSessionTemplate sqlSession, String c) {
		return sqlSession.update("adminMapper.uncompayanpporval", c);
	}

	public int boardCautionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.boardCautionListCount");
	}

	public ArrayList<Notify> boardCautionList(SqlSessionTemplate sqlSession, PageInfo pi) {
	
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.boardCautionList", null, rowBounds);
	}

	public Notify cautionview(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("adminMapper.cautionview", id);
	}

	public int warningboard(SqlSessionTemplate sqlSession, List<String> no) {
		int result = sqlSession.update("adminMapper.warningboard", no);
		
		if(result > 0) {
			return  sqlSession.update("adminMapper.warningMember", no);
		} else{
			throw new BoardException("신고회원 등록 실패");
		}
	}

	public int deleteMember2(SqlSessionTemplate sqlSession, List<String> no) {
		int result = sqlSession.update("adminMapper.deleteNotify2", no);
		
		if(result > 0) {
			return sqlSession.update("adminMapper.deleteMember2", no);
		} else {
			throw new BoardException("회원  삭제 실패");
		}
	}

	public adminQnA qnaviewAnswer(SqlSessionTemplate sqlSession, adminQnA a) {
		return sqlSession.selectOne("qnaviewAnswer", a);
	}

	public int getReplyCautionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getReplyCautionListCount");
	}

	public ArrayList<Notify> replyCautiontList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.replyCautiontList", null, rowBounds);
	}


	public adminQnA selectQna(SqlSessionTemplate sqlSession, int q_no) {
		return sqlSession.selectOne("adminMapper.selectQna", q_no);
	}

	public ArrayList<Warning> selectWarning(SqlSessionTemplate sqlSession, List<String> no) {
		ArrayList<Notify> nList = (ArrayList)sqlSession.selectList("adminMapper.selectNotify", no);
		ArrayList<Warning> list = new ArrayList<Warning>();
		for(Notify i : nList) {
			if(i.getBno() != 0) { // 게시글
				Warning w = sqlSession.selectOne("adminMapper.selectWarning", i);
				list.add(w);
			} else if(i.getCmno() != 0) { // 댓글
				Warning w = sqlSession.selectOne("adminMapper.selectWarning2", i);
				list.add(w);
			} else if(i.getRpno() != 0) { // 답글
				Warning w = sqlSession.selectOne("adminMapper.selectWarning3", i);
				list.add(w);
			}
		}
		
		
		return list;
	}













}
