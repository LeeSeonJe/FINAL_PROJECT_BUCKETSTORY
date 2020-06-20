package com.kh.BucketStory.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.admin.model.vo.Notify;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;

public interface BoardService {

	int insertfestival(Festival f, Media m);

	int getListCount();

	ArrayList<adminQnA> adminQnAselectList(PageInfo pi);

	adminQnA adminqnadetailview(int qno);

	adminQnA adminqnaUpdate(int qno);

	int adminqnaUpdatedetail(adminQnA a);

	ArrayList<Notify> notifyselectList(PageInfo pi);

	int getcautionListCount();

//	int waringmember(int[] no_no);

//	int warningMember(List<String> no);

	int warningMember(int[] no);












}
