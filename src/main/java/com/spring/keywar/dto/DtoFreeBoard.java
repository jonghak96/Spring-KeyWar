package com.spring.keywar.dto;

import java.sql.Timestamp;

public class DtoFreeBoard {
	
	
	//Field
	
	int fbSeqno;
	String fbWriter;
	String fbTitle;
	Timestamp fbDate;
	int fbLike;
	int fbView;
	String fbContent;
	
	// member
	
	String mId;
	
	// freeBoareFile
	String ffPhotoPath;
	
	
	// Constructor
	public DtoFreeBoard() {
		// TODO Auto-generated constructor stub
	}



	// FreeBoard Content 보여주는 생성자
	public DtoFreeBoard(int fbSeqno, String mId, Timestamp fbDate, int fbLike, int fbView, String fbTitle, String fbContent) {
		super();
		this.fbSeqno = fbSeqno;
		this.mId = mId;
		this.fbTitle = fbTitle;
		this.fbDate = fbDate;
		this.fbLike = fbLike;
		this.fbView = fbView;
		this.fbContent = fbContent;
	}



	// 게시판 리스트 보여주는 생성자.
	public DtoFreeBoard(int fbSeqno, String mId, String fbTitle, Timestamp fbDate, int fbLike, int fbView) {
		super();
		this.fbSeqno = fbSeqno;
		this.mId = mId;
		this.fbTitle = fbTitle;
		this.fbDate = fbDate;
		this.fbLike = fbLike;
		this.fbView = fbView;
	}
	
	
	// 자유게시판 파일 불러오는 생성자.
	public DtoFreeBoard(String ffPhotoPath) {
		super();
		this.ffPhotoPath = ffPhotoPath;
	}


	
	// Method
	



	public int getFbSeqno() {
		return fbSeqno;
	}


	public void setFbSeqno(int fbSeqno) {
		this.fbSeqno = fbSeqno;
	}


	public String getFbWriter() {
		return fbWriter;
	}


	public void setFbWriter(String fbWriter) {
		this.fbWriter = fbWriter;
	}


	public String getFbTitle() {
		return fbTitle;
	}


	public void setFbTitle(String fbTitle) {
		this.fbTitle = fbTitle;
	}


	public Timestamp getFbDate() {
		return fbDate;
	}


	public void setFbDate(Timestamp fbDate) {
		this.fbDate = fbDate;
	}




	public int getFbLike() {
		return fbLike;
	}


	public void setFbLike(int fbLike) {
		this.fbLike = fbLike;
	}


	public int getFbView() {
		return fbView;
	}


	public void setFbView(int fbView) {
		this.fbView = fbView;
	}


	public String getFbContent() {
		return fbContent;
	}


	public void setFbContent(String fbContent) {
		this.fbContent = fbContent;
	}



	public String getmId() {
		return mId;
	}



	public void setmId(String mId) {
		this.mId = mId;
	}



	public String getFfPhotoPath() {
		return ffPhotoPath;
	}



	public void setFfPhotoPath(String ffPhotoPath) {
		this.ffPhotoPath = ffPhotoPath;
	}
	
	
	


}//----
