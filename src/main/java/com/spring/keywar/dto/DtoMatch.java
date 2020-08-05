package com.spring.keywar.dto;

public class DtoMatch {

	// match
	int matchSeqno;
	int member_Seqno;
	int rival_Seqno;
	int gym_Seqno;
	String mFightDate;
	String mSuccess;
	int mWinSeqno;
	int mLoseSeqno;
	
	
	
	public DtoMatch(int matchSeqno, String mSuccess) {
		super();
		this.matchSeqno = matchSeqno;
		this.mSuccess = mSuccess;
	}

	public DtoMatch(int matchSeqno, int member_Seqno, String mSuccess) {
		super();
		this.matchSeqno = matchSeqno;
		this.member_Seqno = member_Seqno;
		this.mSuccess = mSuccess;
	}
	
	public int getMatchSeqno() {
		return matchSeqno;
	}
	public void setMatchSeqno(int matchSeqno) {
		this.matchSeqno = matchSeqno;
	}
	public int getMember_Seqno() {
		return member_Seqno;
	}
	public void setMember_Seqno(int member_Seqno) {
		this.member_Seqno = member_Seqno;
	}
	public int getRival_Seqno() {
		return rival_Seqno;
	}
	public void setRival_Seqno(int rival_Seqno) {
		this.rival_Seqno = rival_Seqno;
	}
	public int getGym_Seqno() {
		return gym_Seqno;
	}
	public void setGym_Seqno(int gym_Seqno) {
		this.gym_Seqno = gym_Seqno;
	}
	public String getmFightDate() {
		return mFightDate;
	}
	public void setmFightDate(String mFightDate) {
		this.mFightDate = mFightDate;
	}
	public String getmSuccess() {
		return mSuccess;
	}
	public void setmSuccess(String mSuccess) {
		this.mSuccess = mSuccess;
	}	
}
