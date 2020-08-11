package com.spring.keywar.dao;

public interface DaoMember {
	
	// 회원가입 Dao
	public void writeMemberDao(String mId, String mPw, String mName, String mTelno, String mEmail, String mArea, String mIntro, String mSports, String mType);
	public void writeCustomerDao(String cSex, String cAge, String cPhoto, String cPhotoPath, double cHeight, double cWeight, String cwClass, String mId);
	public void writeTimeTableDao(String mId, String tTimeTable1, String tTimeTable2);
	public void writeGymDao(String gNumber, String gAddress, int gRentalPrice, String mId);
	public void writeReadyDao(String rSex, String rAge1, String rAge2, String rArea, String rwClass1, String rwClass2, String mId);
	public String loginCheckDao(String mId, String mPw);
	public String findId(String mName, String mTelno, String mEmail);
	public String findPw(String mId, String mName, String mTelno, String mEmail);
	public void customerWriteFile(String cPhoto, String cPhotoPath, String mId);
	
	
	
	
	
}
