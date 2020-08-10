package com.spring.keywar.dto;

import java.io.FileInputStream;

public class DtoMemberCustomer {
	
	int mSeqno;
	String mType;
	String mId;
	String mPw;
	String mName;
	String mTelno;
	String mEmail;
	String mArea;
	String mIntro;
	String mData;
	String mSports;
	int cSeqno;
	String cSex;
	int cAge;
	FileInputStream cPhoto;
	String cPhotoPath;
	double cHeight;
	double cWeight;
	String cwClass;
	int cWin;
	int cLose;
	int cDraw;
	int member_mSeqno;
	
	
//	public KDtoMemberCustomer(int mSeqno, String mId, String mSports, int cAge, double cHeight, double cWeight,
//			int cWin, int cLose, int cDraw, int member_mSeqno) {
//		super();
//		this.mSeqno = mSeqno;
//		this.mId = mId;
//		this.mSports = mSports;
//		this.cAge = cAge;
//		this.cHeight = cHeight;
//		this.cWeight = cWeight;
//		this.cWin = cWin;
//		this.cLose = cLose;
//		this.cDraw = cDraw;
//		this.member_mSeqno = member_mSeqno;
//	}

	// 메인에서 1,2,3등 불러오기.
	public DtoMemberCustomer(String mId, String mSports, int cAge, double cHeight, double cWeight, int cWin, int cLose,
			int cDraw, String cPhotoPath) {
		super();
		this.mId = mId;
		this.mSports = mSports;
		this.cAge = cAge;
		this.cHeight = cHeight;
		this.cWeight = cWeight;
		this.cWin = cWin;
		this.cLose = cLose;
		this.cDraw = cDraw;
		this.cPhotoPath = cPhotoPath;
	}
	
	
	public DtoMemberCustomer(String mId, String mArea, String mSports, int cAge, double cHeight, double cWeight,
			String cwClass, int cWin, int cLose, int cDraw) {
		super();
		this.mId = mId;
		this.mArea = mArea;
		this.mSports = mSports;
		this.cAge = cAge;
		this.cHeight = cHeight;
		this.cWeight = cWeight;
		this.cwClass = cwClass;
		this.cWin = cWin;
		this.cLose = cLose;
		this.cDraw = cDraw;
	}


	// Method.
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

	public String getmSports() {
		return mSports;
	}

	public void setmSports(String mSports) {
		this.mSports = mSports;
	}

	public int getcAge() {
		return cAge;
	}

	public void setcAge(int cAge) {
		this.cAge = cAge;
	}

	public double getcHeight() {
		return cHeight;
	}

	public void setcHeight(double cHeight) {
		this.cHeight = cHeight;
	}

	public double getcWeight() {
		return cWeight;
	}

	public void setcWeight(double cWeight) {
		this.cWeight = cWeight;
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

	public int getMember_mSeqno() {
		return member_mSeqno;
	}

	public void setMember_mSeqno(int member_mSeqno) {
		this.member_mSeqno = member_mSeqno;
	}


	public String getmType() {
		return mType;
	}


	public void setmType(String mType) {
		this.mType = mType;
	}


	public String getmPw() {
		return mPw;
	}


	public void setmPw(String mPw) {
		this.mPw = mPw;
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


	public String getmData() {
		return mData;
	}


	public void setmData(String mData) {
		this.mData = mData;
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


	public FileInputStream getcPhoto() {
		return cPhoto;
	}


	public void setcPhoto(FileInputStream cPhoto) {
		this.cPhoto = cPhoto;
	}


	public String getcPhotoPath() {
		return cPhotoPath;
	}


	public void setcPhotoPath(String cPhotoPath) {
		this.cPhotoPath = cPhotoPath;
	}


	public String getCwClass() {
		return cwClass;
	}


	public void setCwClass(String cwClass) {
		this.cwClass = cwClass;
	}
	
}//----
