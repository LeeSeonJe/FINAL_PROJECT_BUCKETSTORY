package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.ComInBucket;
import com.kh.BucketStory.expert.model.vo.Company;

public interface ExpertService {

	Company selectCompanyInfo(String coId);

	int updateExInfo(Company com);

	ArrayList<BucketList> selectCateList(int catenum);

	int insertBucket(Map<String, Object> hm);

	ArrayList<BucketList> selectComBucket(String coId);

}
