package com.spring.keywar.dto;

import java.io.FileInputStream;
import java.sql.Timestamp;

public class DtoGym {
	
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
	FileInputStream gPhoto;
	String gPhotoPath;
	
	// timeTable
	String tTimeTable;
	
	// Constructor
	public DtoGym() {
		// TODO Auto-generated constructor stub
	}

	
	
	// list
	public DtoGym(String mId, String mName, String gAddress, String mSports, int gRentalPrice, String gNumber) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.gAddress = gAddress;
		this.mSports = mSports;
		this.gRentalPrice = gRentalPrice;
		this.gNumber = gNumber;
	}

	
	
	
	// Content
	public DtoGym(String gPhotoPath, String mName, String mId, String gAddress, String gNumber, String mSports, int gRentalPrice, int gRentalNum, String mIntro) {
		super();
		this.gPhotoPath = gPhotoPath;
		this.mId = mId;
		this.mName = mName;
		this.mIntro = mIntro;
		this.mSports = mSports;
		this.gNumber = gNumber;
		this.gAddress = gAddress;
		this.gRentalPrice = gRentalPrice;
		this.gRentalNum = gRentalNum;
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

	public String gettTimeTable() {
		return tTimeTable;
	}

	public void settTimeTable(String tTimeTable) {
		this.tTimeTable = tTimeTable;
	}



	public FileInputStream getgPhoto() {
		return gPhoto;
	}



	public void setgPhoto(FileInputStream gPhoto) {
		this.gPhoto = gPhoto;
	}



	public String getgPhotoPath() {
		return gPhotoPath;
	}



	public void setgPhotoPath(String gPhotoPath) {
		this.gPhotoPath = gPhotoPath;
	}
	
	
	
	
	
	
}
