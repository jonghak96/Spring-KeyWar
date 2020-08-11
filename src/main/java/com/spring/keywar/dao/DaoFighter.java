package com.spring.keywar.dao;

import java.util.ArrayList;

import com.spring.keywar.dto.DtoMember;


public interface DaoFighter {
	// 초기 선수 리스트.
	public int count_fighterList();
	public ArrayList<DtoMember> fighterList(int page);
	// 검색 선수 리스트.
	public int count_fighterSearch_mId(String searchWord);
	public int count_fighterSearch_mArea(String searchWord);
	public int count_fighterSearch_mSports(String searchWord);
	public ArrayList<DtoMember> fighterSearch_mIdmArea(String searchCategory, String searchWord, int page);
	public ArrayList<DtoMember> fighterSearch_mSports(String searchWord, int page);
	
	public DtoMember fighterContent(String mIdStr);
}
