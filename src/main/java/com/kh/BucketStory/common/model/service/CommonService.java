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
	
	int nickNameCheck(String nick);
	
	Member findAccount(String email);

	String compareEmail(String email);

	int SearchPw(String id, String email, String joinCode);

	String compareEmail2(String busiemail);

	int emailCheck(String email);

	int idEmailCheck(String userId, String email);

	int mempwdChange(String userId, String newPwd);

	int CidEmailCheck(String userId, String email);

	int conpwdChange(String userId, String encPwd);

}
