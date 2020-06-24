package com.kh.BucketStory.expert.model.vo;

import java.sql.Date;

public class C_event {
	private int eventnum;
	private String eventTitle;
	private String eventContent;
	private String eventImg;
	private String coId;
	private Date startDate;
	private Date endDate;
	
	public C_event() {}

	
	public C_event(int eventnum, String eventTitle, String eventContent, String eventImg, String coId, Date startDate,
			Date endDate) {
		super();
		this.eventnum = eventnum;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventImg = eventImg;
		this.coId = coId;
		this.startDate = startDate;
		this.endDate = endDate;
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

	
	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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


	@Override
	public String toString() {
		return "C_event [eventnum=" + eventnum + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", eventImg=" + eventImg + ", coId=" + coId + ", startDate=" + startDate + ", endDate=" + endDate
				+ "]";
	}

	
	
	
}
