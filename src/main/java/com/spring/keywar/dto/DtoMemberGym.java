package com.spring.keywar.dto;

import java.sql.Timestamp;

public class DtoMemberGym {
	
	// Feild
	// member
	int mSeqno;
	String mId;
	String mPW;
	String mName;
	String mTelno;
	String mEmail;
	String mArea;
	String mIntro;
	Timestamp mDate;
	String mSports;
	// gym
	int gSeqno;
	String gNumber;
	String gAddress;
	int gRentalPrice;
	int gRentalNum;
	int member_mSeqno;
	// timeTable
	int t_member_mSeqno;
	String tTimeTable1;
	String tTimeTable2;
	
		
	public DtoMemberGym(int mSeqno, String mName, String gAddress, int gRentalPrice) {
		super();
		this.mSeqno = mSeqno;
		this.mName = mName;
		this.gAddress = gAddress;
		this.gRentalPrice = gRentalPrice;
	}

	public DtoMemberGym(String mName, String gAddress, int gRentalPrice) {
		super();
		this.mName = mName;
		this.gAddress = gAddress;
		this.gRentalPrice = gRentalPrice;
	}	

	public DtoMemberGym(int mSeqno, String mName, String gAddress, int gRentalPrice, String tTimeTable1,
			String tTimeTable2) {
		super();
		this.mSeqno = mSeqno;
		this.mName = mName;
		this.gAddress = gAddress;
		this.gRentalPrice = gRentalPrice;
		this.tTimeTable1 = tTimeTable1;
		this.tTimeTable2 = tTimeTable2;
	}

	public DtoMemberGym(String mName, String mTelno, String mSports, String gNumber, String gAddress,
			int gRentalPrice) {
		super();
		this.mName = mName;
		this.mTelno = mTelno;
		this.mSports = mSports;
		this.gNumber = gNumber;
		this.gAddress = gAddress;
		this.gRentalPrice = gRentalPrice;
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
	public int getgSeqno() {
		return gSeqno;
	}
	public void setgSeqno(int gSeqno) {
		this.gSeqno = gSeqno;
	}
	public String getgNumber() {
		return gNumber;
	}
	public void setgNumber(String gNumber) {
		this.gNumber = gNumber;
	}
	public String getgAddress() {
		return gAddress;
	}
	public void setgAddress(String gAddress) {
		this.gAddress = gAddress;
	}
	public int getgRentalPrice() {
		return gRentalPrice;
	}
	public void setgRentalPrice(int gRentalPrice) {
		this.gRentalPrice = gRentalPrice;
	}
	public int getgRentalNum() {
		return gRentalNum;
	}
	public void setgRentalNum(int gRentalNum) {
		this.gRentalNum = gRentalNum;
	}

	public int getMember_mSeqno() {
		return member_mSeqno;
	}

	public void setMember_mSeqno(int member_mSeqno) {
		this.member_mSeqno = member_mSeqno;
	}

	public int getT_member_mSeqno() {
		return t_member_mSeqno;
	}

	public void setT_member_mSeqno(int t_member_mSeqno) {
		this.t_member_mSeqno = t_member_mSeqno;
	}

	public String gettTimeTable1() {
		return tTimeTable1;
	}

	public void settTimeTable1(String tTimeTable1) {
		this.tTimeTable1 = tTimeTable1;
	}

	public String gettTimeTable2() {
		return tTimeTable2;
	}

	public void settTimeTable2(String tTimeTable2) {
		this.tTimeTable2 = tTimeTable2;
	}
	
	
	
}
