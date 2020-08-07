package com.spring.keywar.dao;

import java.util.ArrayList;

import com.spring.keywar.dto.DtoMember;
import com.spring.keywar.dto.DtoMemberGym;




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
	// 선수 상세 정보.
	public DtoMember fighterContent(String mIdStr);
	// 체육관 리스트. (조건 붙으면 좋을 듯.)
	public ArrayList<DtoMemberGym> gymList();
}
