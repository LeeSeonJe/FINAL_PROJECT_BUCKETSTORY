package com.kh.BucketStory.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.dao.BoardDAO;
import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.admin.model.vo.Notify;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;


@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertfestival(Festival f, Media m) {
		return bDAO.insertfestival(sqlSession, f, m);
	}

	@Override
	public int getListCount() {
		return bDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<adminQnA> adminQnAselectList(PageInfo pi) {
		return bDAO.adminQnAselectList(sqlSession, pi);
	}

	@Override
	public adminQnA adminqnadetailview(int qno) {
		return bDAO.adminqnadetailview(sqlSession, qno);
	}

	@Override
	public adminQnA adminqnaUpdate(int qno) {
		return bDAO.adminqnaUpdate(sqlSession, qno);
	}

	@Override
	public int adminqnaUpdatedetail(adminQnA a) {
		return bDAO.adminqnaUpdatedetail(sqlSession, a);
	}

	@Override
	public ArrayList<Notify> notifyselectList(PageInfo pi) {
		return bDAO.notifyselectList(sqlSession, pi);
	}

	@Override
	public int getcautionListCount() {
		return bDAO.cautionListCount(sqlSession);
	}

//	@Override
//	public int warningMember(int[] no) {
//		return bDAO.waringmember(sqlSession, no);
//	}

	@Override
	public ArrayList<Notify> Memberlist(PageInfo pi) {
		return bDAO.Memberlist(sqlSession, pi);
	}

	@Override
	public int warningMember(List<String> no) {
		return bDAO.warningMember(sqlSession, no);
	}
	
//	@Override
//	public int deleteMember(int[] no) {
//		return bDAO.deleteMember(sqlSession, no);
//	}

	@Override
	public int deleteMember(List<String> no) {
		return bDAO.deleteMember(sqlSession, no);
	}

	@Override
	public ArrayList<Company> companylist(PageInfo pi) {
		return bDAO.companylist(sqlSession, pi);
	}

	@Override
	public int companyListCount() {
		return bDAO.companyListCount(sqlSession);
	}

	@Override
	public Company adminCompanyDetail(String c) {
		return bDAO.adminCompanyDetail(sqlSession, c);
	}

	@Override
	public int companyanppoval(String c) {
		return bDAO.companyanppoval(sqlSession, c);
	}

	@Override
	public int uncompayanpporval(String c) {
		return bDAO.uncompayanpporval(sqlSession, c);
	}

	@Override
	public int boardCautionListCount() {
		return bDAO.boardCautionListCount(sqlSession);
	}

	@Override
	public ArrayList<Notify> boardCautionList(PageInfo pi) {
		return bDAO.boardCautionList(sqlSession, pi);
	}

	@Override
	public Notify cautionview(String id) {
		return bDAO.cautionview(sqlSession, id);
	}

	@Override
	public int warningboard(List<String> no) {
		return bDAO.warningboard(sqlSession, no);
	}











}
