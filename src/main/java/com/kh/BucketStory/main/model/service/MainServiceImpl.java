package com.kh.BucketStory.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.bucket.model.vo.Alarm;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.C_event;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.main.model.dao.MainDAO;
import com.kh.BucketStory.member.model.vo.Board;

import oracle.net.aso.a;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDAO mainDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<BucketList> selectBucketList() {
		return mainDAO.selectBucketList(sqlSession);
	}

	@Override
	public ArrayList<Media> selectBucketImg() {
		return mainDAO.selectBLImg(sqlSession);
	}

	@Override
	public int blLike(int bkNo, String userId) {
		return mainDAO.blLike(sqlSession, bkNo, userId);
	}
	
	@Override
	public ArrayList<WishList> selectWishList(String userId) {
		return mainDAO.selectWishList(sqlSession, userId);
	}

	@Override
	public int blShare(int bkNo, String userId) {
		return mainDAO.blShare(sqlSession, bkNo, userId);
	}

	@Override
	public ArrayList<ShareBucket> selectShareList(String userId) {
		return mainDAO.selectShareList(sqlSession, userId);
	}

	@Override
	public ArrayList<Member> selectShareMList(int bkNo) {
		return mainDAO.selectShareMList(sqlSession, bkNo);
	}

	@Override
	public ArrayList<BucketList> selectRecoBucketList() {
		return mainDAO.selectRecoBucketList(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBlogList() {
		return mainDAO.selectBlogList(sqlSession);
	}

	@Override
	public ArrayList<Board> selectbMList(int bkNo, String nickName) {
		return mainDAO.selectbMList(sqlSession, bkNo, nickName);
	}

	@Override
	public ArrayList<Member> selectAllMember() {
		return mainDAO.selectAllMember(sqlSession);
	}

	@Override
	public ArrayList<BucketList> selectAllBucket() {
		return mainDAO.selectAllBucket(sqlSession);
	}

	@Override
	public ArrayList<BucketList> selectSearchBucket(String b) {
		return mainDAO.selectSearchBucket(sqlSession, b);
	}

	@Override
	public ArrayList<BucketList> selectSearchTag(String t) {
		return mainDAO.selectSearchTag(sqlSession, t);
	}

	@Override
	public ArrayList<BucketList> selectRankBucketList() {
		return mainDAO.selectRankBucketList(sqlSession);
	}

	@Override
	public ArrayList<BucketList> selectCoBucket(String coId) {
		return mainDAO.selectCoBucket(sqlSession, coId);
	}

	@Override
	public int countDetailWhat(int bkNo, String coId) {
		return mainDAO.countDetailWhat(sqlSession, bkNo, coId);
	}

	@Override
	public ArrayList<Company> selectDetailCompany(int bkNo) {
		return mainDAO.selectDetailCompany(sqlSession, bkNo);
	}

	@Override
	public ArrayList<Festival> selectFestival(String year) {
		return mainDAO.selectFestival(sqlSession, year);
	}

	@Override
	public ArrayList<Media> selectFmList() {
		return mainDAO.selectFmList(sqlSession);
	}

	@Override
	public ArrayList<Company> selectCompany() {
		return mainDAO.selectCompany(sqlSession);
	}

	@Override
	public ArrayList<Media> selectCompMedia() {
		return mainDAO.selectCompMedia(sqlSession);
	}

	@Override
	public ArrayList<BucketList> selectDetailSup(String coId) {
		return mainDAO.selectDetailSup(sqlSession, coId);
	}

	@Override
	public ArrayList<C_event> selectCpFestival(String year) {
		return mainDAO.selectCpFestival(sqlSession, year);
	}

	@Override
	public int deleteCoBucekt(int bkNo, String coId) {
		return mainDAO.deleteCoBucekt(sqlSession, bkNo, coId);
	}

	@Override
	public ArrayList<C_event> selectCpEvent(int bkNo) {
		return mainDAO.selectCpEvent(sqlSession, bkNo);
	}

	@Override
	public ArrayList<Company> selectAllCompany() {
		return mainDAO.selectAllCompany(sqlSession);
	}

	@Override
	public ArrayList<Company> selectSearchCompany(String c) {
		return mainDAO.selectSearchCompany(sqlSession, c);
	}

	@Override
	public int selectNickCheck(String nickName) {
		return mainDAO.selectNickCheck(sqlSession, nickName);
	}

	@Override
	public int updateMember(Member m) {
		return mainDAO.updateMember(sqlSession, m);
	}

	@Override
	public int updatePwd(String userId, String encPwd) {
		return mainDAO.updatePwd(sqlSession, userId, encPwd);
	}

	@Override
	public String blWish(int bkNo, String userId, String bucketId) {
		return mainDAO.blWish(sqlSession, bkNo, userId, bucketId);
	}

	@Override
	public ArrayList<Alarm> selectAlert(String userId) {
		return mainDAO.selectAlert(sqlSession, userId);
	}

	@Override
	public ArrayList<Alarm> selectCAlert(String coId) {
		return mainDAO.selectCAlert(sqlSession, coId);
	}

	@Override
	public int insertAlert(Alarm alert) {
		return mainDAO.insertAlert(sqlSession, alert);
	}

	@Override
	public int insertCAlert(Alarm alert) {
		return mainDAO.insertCAlert(sqlSession, alert);
	}

	@Override
	public int alertCheck(Integer aNum) {
		return mainDAO.alertCheck(sqlSession, aNum);
	}

	@Override
	public int alertDelete(Integer aNum) {
		return mainDAO.alertDelete(sqlSession, aNum);
	}

}
