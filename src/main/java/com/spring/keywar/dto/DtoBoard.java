package com.spring.keywar.dto;

import java.sql.Timestamp;

public class DtoBoard {
	

	// board
	int bSeqno;
	String bTitle;
	String bContent;
	Timestamp bDate;
	int bView;
	int bLike;
	
	// member
	int mSeqno;
	String mId;
	
	// boareFile
	String fPhotoPath;
	String fVideoPath;
	
	
		
	
	
	// Constructor
	public DtoBoard() {
		// TODO Auto-generated constructor stub
	}
	

	// 영상게시판 리스트 올려주는 생성자.
	public DtoBoard(String fPhotoPath, int bSeqno, String mId, String bTitle, Timestamp bDate, int bView) {
		super();
		this.fPhotoPath = fPhotoPath;
		this.bSeqno = bSeqno;
		this.mId = mId;
		this.bTitle = bTitle;
		this.bDate = bDate;
		this.bView = bView;
	}

	// 영상게시판 컨텐트
	public DtoBoard(int bSeqno, String fVideoPath, String mId, Timestamp bDate, int bLike, int bView, String bTitle, String bContent) {
		super();
		this.bSeqno = bSeqno;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bView = bView;
		this.bLike = bLike;
		this.mId = mId;
		this.fVideoPath = fVideoPath;
	}


	public int getbSeqno() {
		return bSeqno;
	}


	public void setbSeqno(int bSeqno) {
		this.bSeqno = bSeqno;
	}


	public String getbTitle() {
		return bTitle;
	}


	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public String getbContent() {
		return bContent;
	}


	public void setbContent(String bContent) {
		this.bContent = bContent;
	}


	public Timestamp getbDate() {
		return bDate;
	}


	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}


	public int getbView() {
		return bView;
	}


	public void setbView(int bView) {
		this.bView = bView;
	}


	public int getbLike() {
		return bLike;
	}


	public void setbLike(int bLike) {
		this.bLike = bLike;
	}


	public int getmSeqno() {
		return mSeqno;
	}


	public void setmSeqno(int mSeqno) {
		this.mSeqno = mSeqno;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public String getfPhotoPath() {
		return fPhotoPath;
	}


	public void setfPhotoPath(String fPhotoPath) {
		this.fPhotoPath = fPhotoPath;
	}


	public String getfVideoPath() {
		return fVideoPath;
	}


	public void setfVideoPath(String fVideoPath) {
		this.fVideoPath = fVideoPath;
	}
	
	
	
	
	
	
	
	
	
}//----
