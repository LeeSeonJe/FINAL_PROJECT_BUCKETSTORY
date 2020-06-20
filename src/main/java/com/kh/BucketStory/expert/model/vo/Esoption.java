package com.kh.BucketStory.expert.model.vo;

import java.util.List;

public class Esoption {
	
	private int opno;
	private String es_no;
	private String optionName;
	private String optionPrice;
	
	public Esoption() {}

	public Esoption(int opno, String es_no, String optionName, String optionPrice) {
		super();
		this.opno = opno;
		this.es_no = es_no;
		this.optionName = optionName;
		this.optionPrice = optionPrice;
	}
	

	public int getOpno() {
		return opno;
	}

	public void setOpno(int opno) {
		this.opno = opno;
	}

	public String getEs_no() {
		return es_no;
	}

	public void setEs_no(String es_no) {
		this.es_no = es_no;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOptionPrice() {
		return optionPrice;
	}

	public void setOptionPrice(String optionPrice) {
		this.optionPrice = optionPrice;
	}

	@Override
	public String toString() {
		return "Esoption [opno=" + opno + ", es_no=" + es_no + ", optionName=" + optionName + ", optionPrice="
				+ optionPrice + "]";
	}
	
	
}

