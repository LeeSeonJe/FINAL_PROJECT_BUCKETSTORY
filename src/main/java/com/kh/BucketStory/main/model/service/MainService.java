package com.kh.BucketStory.main.model.service;

import java.util.ArrayList;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;

public interface MainService {

	ArrayList<BucketList> selectBucketList();

	ArrayList<Media> selectBucketImg();

	int blLike(int bkNo, String userId);

}
