package com.spring.keywar.dto;

public class DtoUpdateListGym {
	
	String mId;
	String mPw;
	String mName;
	String mSports;
	int gRentalPrice;
	String mEmail;
	String gNumber;
	String mTelno;
	String mArea;
	String gAddress;
	String mIntro;
	
	
	public DtoUpdateListGym(String mId, String mPw, String mName, String mSports, int gRentalPrice, String mEmail,
			String gNumber, String mTelno, String mArea, String gAddress, String mIntro) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mSports = mSports;
		this.gRentalPrice = gRentalPrice;
		this.mEmail = mEmail;
		this.gNumber = gNumber;
		this.mTelno = mTelno;
		this.mArea = mArea;
		this.gAddress = gAddress;
		this.mIntro = mIntro;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
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


	public String getmSports() {
		return mSports;
	}


	public void setmSports(String mSports) {
		this.mSports = mSports;
	}


	public int getgRentalPrice() {
		return gRentalPrice;
	}


	public void setgRentalPrice(int gRentalPrice) {
		this.gRentalPrice = gRentalPrice;
	}


	public String getmEmail() {
		return mEmail;
	}


	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}


	public String getgNumber() {
		return gNumber;
	}


	public void setgNumber(String gNumber) {
		this.gNumber = gNumber;
	}


	public String getmTelno() {
		return mTelno;
	}


	public void setmTelno(String mTelno) {
		this.mTelno = mTelno;
	}


	public String getmArea() {
		return mArea;
	}


	public void setmArea(String mArea) {
		this.mArea = mArea;
	}


	public String getgAddress() {
		return gAddress;
	}


	public void setgAddress(String gAddress) {
		this.gAddress = gAddress;
	}


	public String getmIntro() {
		return mIntro;
	}


	public void setmIntro(String mIntro) {
		this.mIntro = mIntro;
	}
	
	

}
