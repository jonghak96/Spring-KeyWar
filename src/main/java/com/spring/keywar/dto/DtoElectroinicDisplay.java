package com.spring.keywar.dto;

public class DtoElectroinicDisplay {

	String challenger;
	String enemy;
	String gymName;
	String mFightDate;
	String mArea;
	String gRentalNum;
	
	public DtoElectroinicDisplay(String challenger, String enemy, String gymName, String mFightDate, String mArea,
			String gRentalNum) {
		super();
		this.challenger = challenger;
		this.enemy = enemy;
		this.gymName = gymName;
		this.mFightDate = mFightDate;
		this.mArea = mArea;
		this.gRentalNum = gRentalNum;
	}
	
	public String getChallenger() {
		return challenger;
	}
	public void setChallenger(String challenger) {
		this.challenger = challenger;
	}
	public String getEnemy() {
		return enemy;
	}
	public void setEnemy(String enemy) {
		this.enemy = enemy;
	}
	public String getGymName() {
		return gymName;
	}
	public void setGymName(String gymName) {
		this.gymName = gymName;
	}
	public String getmFightDate() {
		return mFightDate;
	}
	public void setmFightDate(String mFightDate) {
		this.mFightDate = mFightDate;
	}
	public String getmArea() {
		return mArea;
	}
	public void setmArea(String mArea) {
		this.mArea = mArea;
	}
	public String getgRentalNum() {
		return gRentalNum;
	}
	public void setgRentalNum(String gRentalNum) {
		this.gRentalNum = gRentalNum;
	}	
}
