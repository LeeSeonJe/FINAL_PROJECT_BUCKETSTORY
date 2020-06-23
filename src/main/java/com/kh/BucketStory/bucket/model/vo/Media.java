package com.kh.BucketStory.bucket.model.vo;

public class Media {
	private int mnumber;
	private String morigin;
	private String mweb;
	private int imgvideo;
	private int muse;
	private int bkno;
	private int bno;
	private String coid;
	private int feno;
	private int esNo;
	
	public Media() {}

	public Media(int mnumber, String morigin, String mweb, int imgvideo, int muse, int bkno, int bno, String coid,
			int feno, int esNo) {
		super();
		this.mnumber = mnumber;
		this.morigin = morigin;
		this.mweb = mweb;
		this.imgvideo = imgvideo;
		this.muse = muse;
		this.bkno = bkno;
		this.bno = bno;
		this.coid = coid;
		this.feno = feno;
		this.esNo = esNo;
	}
	
	// 기업소개변경용
	public Media(String coid, String mweb, int imgvideo, int muse) {
		this.coid = coid;
		this.mweb = mweb;
		this.imgvideo = imgvideo;
		this.muse = muse;		
	}

	public int getMnumber() {
		return mnumber;
	}

	public void setMnumber(int mnumber) {
		this.mnumber = mnumber;
	}

	public String getMorigin() {
		return morigin;
	}

	public void setMorigin(String morigin) {
		this.morigin = morigin;
	}

	public String getMweb() {
		return mweb;
	}

	public void setMweb(String mweb) {
		this.mweb = mweb;
	}

	public int getImgvideo() {
		return imgvideo;
	}

	public void setImgvideo(int imgvideo) {
		this.imgvideo = imgvideo;
	}

	public int getMuse() {
		return muse;
	}

	public void setMuse(int muse) {
		this.muse = muse;
	}

	public int getBkno() {
		return bkno;
	}

	public void setBkno(int bkno) {
		this.bkno = bkno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getCoid() {
		return coid;
	}

	public void setCoid(String coid) {
		this.coid = coid;
	}

	public int getFeno() {
		return feno;
	}

	public void setFeno(int feno) {
		this.feno = feno;
	}

	public int getEsNo() {
		return esNo;
	}

	public void setEsNo(int esNo) {
		this.esNo = esNo;
	}

	@Override
	public String toString() {
		return "Media [mnumber=" + mnumber + ", morigin=" + morigin + ", mweb=" + mweb + ", imgvideo=" + imgvideo
				+ ", muse=" + muse + ", bkno=" + bkno + ", bno=" + bno + ", coid=" + coid + ", feno=" + feno + ", esNo="
				+ esNo + "]";
	}

	
	
}
