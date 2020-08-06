package com.spring.keywar.dao;

public interface DaoMember {
	
	// 회원가입 Dao
	public void writeMemberDao(String mId, String mPw, String mName, String mTelno, String mEmail, String mArea, String mIntro, String mSports, String mType);
	public void writeCustomerDao(String cSex, String cAge, double cHeight, double cWeight, String cwClass, String mId);
	public void writeTimeTableDao(String mId, String tTimeTable1, String tTimeTable2);
	public void writeGymDao(String gNumber, String gAddress, int gRentalPrice, String mId);
	
	
	
	
	
	
}
