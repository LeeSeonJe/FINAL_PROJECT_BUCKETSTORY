package com.kh.BucketStory.member.model.service;

import com.kh.BucketStory.member.model.vo.Member;

public interface MemberService{

	Member memberLogin(Member m);
	
	int insertMember(Member m);
	
	
}
