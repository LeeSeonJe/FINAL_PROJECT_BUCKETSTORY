package com.kh.BucketStory.bucket.model.vo;

public class C_eventNBucketList {
	private int eventnum;
	private String eventTitle;
	private String eventContent;
	private String eventImg;
	private String coId;
	private String eventDate;
	private int bkNo;
	private String bkName;
	
	public C_eventNBucketList() {}

	public C_eventNBucketList(int eventnum, String eventTitle, String eventContent, String eventImg, String coId,
			String eventDate, int bkNo, String bkName) {
		super();
		this.eventnum = eventnum;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventImg = eventImg;
		this.coId = coId;
		this.eventDate = eventDate;
		this.bkNo = bkNo;
		this.bkName = bkName;
	}

	public int getEventnum() {
		return eventnum;
	}

	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventImg() {
		return eventImg;
	}

	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}

	public String getCoId() {
		return coId;
	}

	public void setCoId(String coId) {
		this.coId = coId;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public int getBkNo() {
		return bkNo;
	}

	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}

	public String getBkName() {
		return bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
	}

	@Override
	public String toString() {
		return "C_eventNBucketList [eventnum=" + eventnum + ", eventTitle=" + eventTitle + ", eventContent="
				+ eventContent + ", eventImg=" + eventImg + ", coId=" + coId + ", eventDate=" + eventDate + ", bkNo="
				+ bkNo + ", bkName=" + bkName + "]";
	}
	
}
