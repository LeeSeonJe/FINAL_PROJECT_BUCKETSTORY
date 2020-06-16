package com.kh.BucketStory.common.model.service;

import org.apache.catalina.User;

import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

public interface CommonService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	Company companyLogin(Company c);
	
	int insertCompany(Company c);

	int idDuplicateCheck(String id);

	static void updateInfo(String name, String string, String password) {
		
	}

	Member findAccount(String email);
}
