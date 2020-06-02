package com.kh.BucketStory.expert.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.expert.model.vo.Company;

public interface ExpertService {

	Company selectCompanyInfo(String coId);

	int updateExInfo(Company com);

	ArrayList<BucketList> selectCateList(int catenum);

}
