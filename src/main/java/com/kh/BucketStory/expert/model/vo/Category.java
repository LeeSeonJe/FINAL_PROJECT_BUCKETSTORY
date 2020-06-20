package com.kh.BucketStory.expert.model.vo;

/**
 * @author gun
 *
 */
public class Category {
	private int cateNum;
	private String cateName;
	
	public Category() {
	}

	public Category(int cateNum, String cateName) {
		super();
		this.cateNum = cateNum;
		this.cateName = cateName;
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	@Override
	public String toString() {
		return "Category [cateNum=" + cateNum + ", cateName=" + cateName + "]";
	}
	
	
	
}
