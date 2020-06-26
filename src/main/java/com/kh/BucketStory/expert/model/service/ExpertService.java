package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.ComInBucket;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.C_event;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.EsRequest;
import com.kh.BucketStory.expert.model.vo.Esoption;
import com.kh.BucketStory.expert.model.vo.Estimate;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.member.model.vo.Board;

public interface ExpertService {

	Company selectCompanyInfo(String coId);

	int updateExInfo(Company com);

	ArrayList<BucketList> selectCateList(int catenum);

	int insertBucket(ComInBucket hm);

	ArrayList<BucketList> selectComBucket(String coId);

	BucketList selectBucket(int bkNo);

	int insertEsrequest(EsRequest er);

	ArrayList<EsRequest> selectEsRequest(String coId);

	EsRequest RequestDetail(String esr_no);

	Member selectMember(String userId);

	int insertEstimate(Estimate es, ArrayList<Media> media);

	int insertEsmedia(Media media);

	ArrayList<Estimate> selectEstimteList(PageInfo pi, String coId);

	Estimate selectEstimate(String esno);

	EsRequest selectEsRequestOne(int esr_no);

	ArrayList<Media> selectMediaList(int es_no);

	ArrayList<Estimate> selectMakingEstimteList(PageInfo pi, String coId);

	int updateEstimate(Estimate es);

	int deleteMedia(String mnumber);

	int updateEsRequestPosition(int esr_no);

	int updateEsmedia(Media media);

	ArrayList<Media> selectAllBucketMediaList();

	ArrayList<Estimate> selectCompleteEstimteList(PageInfo pi, String coId);

	ArrayList<Estimate> selectUserEstimate(String userId);

	ArrayList<Estimate> selectMyEstimate(Map<String, String> m);

	int insertReview(Estimate es);

	int insertEvent(C_event ce);

	int deleteEstimate(int es_no);

	int getEsListCount(String coId);

	ArrayList<EsRequest> selectEsRequest(PageInfo pi, String coId);

	int makingEsListCount(String coId, int status);

	int EsListCount(Map<String, String> status);

	Media selectproImg(String coId);



	
}
