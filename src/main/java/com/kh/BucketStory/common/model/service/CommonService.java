package com.kh.BucketStory.common.model.service;

import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

public interface CommonService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	Company companyLogin(Company c);
	
	

}
