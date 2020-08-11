package com.spring.keywar.dto;

import java.io.FileInputStream;
import java.sql.Timestamp;

public class DtoMember {
	
	// Feild
	// member
	int mSeqno;
	String mType;
	String mId;
	String mPW;
	String mName;
	String mTelno;
	String mEmail;
	String mArea;
	String mIntro;
	Timestamp mDate;
	String mSports;
	
	// customer
	int cSeqno;
	String cSex;
	int cAge;
	int cWin;
	int cLose;
	int cDraw;
	Double cHeight;
	Double cWeight;
	String cwClass;
	String cPhotoPath;
	FileInputStream cPhoto;
	
	// photo
	
	
	// Constructor
	public DtoMember() {
		// TODO Auto-generated constructor stub
	}

	// 선수 정보 리스트 불러오기.
	public DtoMember(String mId, int cWin, int cDraw, int cLose, String mArea, Double cHeight, Double cWeight, String mSports) {
		super();
		this.mId = mId;
		this.mArea = mArea;
		this.mSports = mSports;
		this.cWin = cWin;
		this.cLose = cLose;
		this.cDraw = cDraw;
		this.cHeight = cHeight;
		this.cWeight = cWeight;
	}

	// 선수 상세정보 리스트 불러오기.
	public DtoMember(String cPhotoPath, String mId, String mName, String cSex, int cAge, String mArea, int cWin, int cDraw, int cLose, Double cHeight, Double cWeight, String cwClass, String mSports, String mIntro) {
		super();
		this.cPhotoPath = cPhotoPath;
		this.mId = mId;
		this.mName = mName;
		this.mArea = mArea;
		this.mIntro = mIntro;
		this.mSports = mSports;
		this.cSex = cSex;
		this.cAge = cAge;
		this.cWin = cWin;
		this.cLose = cLose;
		this.cDraw = cDraw;
		this.cHeight = cHeight;
		this.cWeight = cWeight;
		this.cwClass = cwClass;
	}
	

	// Method
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


	public String getmPW() {
		return mPW;
	}


	public void setmPW(String mPW) {
		this.mPW = mPW;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	public String getmTelno() {
		return mTelno;
	}


	public void setmTelno(String mTelno) {
		this.mTelno = mTelno;
	}


	public String getmEmail() {
		return mEmail;
	}


	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}


	public String getmArea() {
		return mArea;
	}


	public void setmArea(String mArea) {
		this.mArea = mArea;
	}


	public String getmIntro() {
		return mIntro;
	}


	public void setmIntro(String mIntro) {
		this.mIntro = mIntro;
	}


	public Timestamp getmDate() {
		return mDate;
	}


	public void setmDate(Timestamp mDate) {
		this.mDate = mDate;
	}


	public String getmSports() {
		return mSports;
	}


	public void setmSports(String mSports) {
		this.mSports = mSports;
	}


	public int getcSeqno() {
		return cSeqno;
	}


	public void setcSeqno(int cSeqno) {
		this.cSeqno = cSeqno;
	}


	public String getcSex() {
		return cSex;
	}


	public void setcSex(String cSex) {
		this.cSex = cSex;
	}


	public int getcAge() {
		return cAge;
	}


	public void setcAge(int cAge) {
		this.cAge = cAge;
	}


	public int getcWin() {
		return cWin;
	}


	public void setcWin(int cWin) {
		this.cWin = cWin;
	}


	public int getcLose() {
		return cLose;
	}


	public void setcLose(int cLose) {
		this.cLose = cLose;
	}


	public int getcDraw() {
		return cDraw;
	}


	public void setcDraw(int cDraw) {
		this.cDraw = cDraw;
	}


	public Double getcHeight() {
		return cHeight;
	}


	public void setcHeight(Double cHeight) {
		this.cHeight = cHeight;
	}


	public Double getcWeight() {
		return cWeight;
	}


	public void setcWeight(Double cWeight) {
		this.cWeight = cWeight;
	}


	public String getCwClass() {
		return cwClass;
	}


	public void setCwClass(String cwClass) {
		this.cwClass = cwClass;
	}

	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}

	public String getcPhotoPath() {
		return cPhotoPath;
	}

	public void setcPhotoPath(String cPhotoPath) {
		this.cPhotoPath = cPhotoPath;
	}

	public FileInputStream getcPhoto() {
		return cPhoto;
	}

	public void setcPhoto(FileInputStream cPhoto) {
		this.cPhoto = cPhoto;
	}
	
	
	
	
	
	
	
	
}
