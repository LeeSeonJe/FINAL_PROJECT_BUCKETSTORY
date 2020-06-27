package com.kh.BucketStory.common.model.service;

import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

public interface CommonService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	Company companyLogin(Company c);
	
	int insertCompany(Company c);

	int idDuplicateCheck(String id);

	int idDuplicateCheck2(String id2);
	
	int nickCheck(String nick);
	
	static void updateInfo(String name, String string, String password) {
		
	}

	Member findAccount(String email);

	String compareEmail(String email);

	int getPw(String id, String email);

	int SearchPw(String id, String email, String joinCode);

	void update_pw(String joinCode);

	String compareEmail2(String busiemail);


	

}
