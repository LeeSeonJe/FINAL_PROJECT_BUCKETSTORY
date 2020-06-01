package com.kh.BucketStory.expert.model.service;

import com.kh.BucketStory.expert.model.vo.Company;

public interface ExpertService {

	Company selectCompanyInfo(String coId);

	int updateExInfo(Company com);

}
