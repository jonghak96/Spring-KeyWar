package com.spring.keywar.dao;

import java.util.ArrayList;

import com.spring.keywar.dto.DtoGym;
import com.spring.keywar.dto.DtoGymFile;

public interface DaoGym {
	
	// 초기 체육관 리스트.
	public int count_gymList();
	public ArrayList<DtoGym> gymList(int page);
	// 검색 체육관 리스트.
	public int count_gymSearch_mName(String searchWord);
	public int count_gymSearch_gAddress(String searchWord);
	public int count_gymSearch_mSports(String searchWord);
	public ArrayList<DtoGym> gymSearch_mName(String searchWord, int page);
	public ArrayList<DtoGym> gymSearch_gAddress(String searchWord, int page);
	public ArrayList<DtoGym> gymSearch_mSports(String searchWord, int page);
	// 체육관 상세 정보.
	public DtoGym gymContent(String mIdStr);
	// 체육관 이미지 리스트.
	public ArrayList<DtoGymFile> gymFile(String mId);
}
