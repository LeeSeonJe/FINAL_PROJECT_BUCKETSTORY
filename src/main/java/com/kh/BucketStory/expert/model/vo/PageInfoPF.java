package com.kh.BucketStory.expert.model.vo;

public class PageInfoPF extends PageInfo{
  
	private char check; //'Y/N'
	private String keyworkd; // 검색어
	
	public PageInfoPF() {
	}
	
	public PageInfoPF(char check, String keyworkd) {
		super();
		this.check = check;
		this.keyworkd = keyworkd;
	}

	public PageInfoPF(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int boardLimit, char check, String keyworkd) {
		super(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		this.check = check;
		this.keyworkd = keyworkd;
	}
	
	public PageInfoPF(PageInfo pi) {
		
	}

	@Override
	public String toString() {
		return super.toString() + 
			"PageInfoPF [check=" + check + ", keyworkd=" + keyworkd + "]";
	}
  
}
