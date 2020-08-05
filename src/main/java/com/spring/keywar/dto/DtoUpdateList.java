package com.spring.keywar.dto;

public class DtoUpdateList {
	
	// 개인 정보 수정 전, 로그인이 된 회원 정보 불러오기
	String mId;
	String mPw;
	String mName;
	String cSex;
	String cAge;
	String mEmail;
	String mTelno;
	double cHeight;
	double cWeight;
	String mSports;
	String mArea;
	String rSex;
	int rAge1;
	int rAge2;
	String rArea;
	String rwClass1;
	String rwClass2;
	String mIntro;
	
	
	public DtoUpdateList(String mId, String mPw, String mName, String cSex, String cAge, String mEmail, String mTelno,
			double cHeight, double cWeight, String mSports, String mArea, String rSex, int rAge1, int rAge2,
			String rArea, String rwClass1, String rwClass2, String mIntro) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.cSex = cSex;
		this.cAge = cAge;
		this.mEmail = mEmail;
		this.mTelno = mTelno;
		this.cHeight = cHeight;
		this.cWeight = cWeight;
		this.mSports = mSports;
		this.mArea = mArea;
		this.rSex = rSex;
		this.rAge1 = rAge1;
		this.rAge2 = rAge2;
		this.rArea = rArea;
		this.rwClass1 = rwClass1;
		this.rwClass2 = rwClass2;
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


	public String getcSex() {
		return cSex;
	}


	public void setcSex(String cSex) {
		this.cSex = cSex;
	}


	public String getcAge() {
		return cAge;
	}


	public void setcAge(String cAge) {
		this.cAge = cAge;
	}


	public String getmEmail() {
		return mEmail;
	}


	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}


	public String getmTelno() {
		return mTelno;
	}


	public void setmTelno(String mTelno) {
		this.mTelno = mTelno;
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


	public String getmSports() {
		return mSports;
	}


	public void setmSports(String mSports) {
		this.mSports = mSports;
	}


	public String getmArea() {
		return mArea;
	}


	public void setmArea(String mArea) {
		this.mArea = mArea;
	}


	public String getrSex() {
		return rSex;
	}


	public void setrSex(String rSex) {
		this.rSex = rSex;
	}


	public int getrAge1() {
		return rAge1;
	}


	public void setrAge1(int rAge1) {
		this.rAge1 = rAge1;
	}


	public int getrAge2() {
		return rAge2;
	}


	public void setrAge2(int rAge2) {
		this.rAge2 = rAge2;
	}


	public String getrArea() {
		return rArea;
	}


	public void setrArea(String rArea) {
		this.rArea = rArea;
	}


	public String getRwClass1() {
		return rwClass1;
	}


	public void setRwClass1(String rwClass1) {
		this.rwClass1 = rwClass1;
	}


	public String getRwClass2() {
		return rwClass2;
	}


	public void setRwClass2(String rwClass2) {
		this.rwClass2 = rwClass2;
	}


	public String getmIntro() {
		return mIntro;
	}


	public void setmIntro(String mIntro) {
		this.mIntro = mIntro;
	}
	
	
	
	
}
