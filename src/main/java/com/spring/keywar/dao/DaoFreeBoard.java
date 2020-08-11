package com.spring.keywar.dao;

import java.util.ArrayList;

import com.spring.keywar.dto.DtoFreeBoard;


public interface DaoFreeBoard {
	// 초기 자유게시판 리스트.
	public int count_freeboardList();
	public ArrayList<DtoFreeBoard> freeboardList(int page);
	// 검색 자유게시판 리스트.
	public int count_freeboardSearch_fbTitle(String searchWord);
	public int count_freeboardSearch_mId(String searchWord);
	public ArrayList<DtoFreeBoard> freeboardSearch_fbTitle(String searchWord, int page);
	public ArrayList<DtoFreeBoard> freeboardSearch_mId(String searchWord, int page);
	public void freeboardWrite(String fbTitle, String fbContent, String mId);
	public void freeboardWriteFile(String ffPhoto, String ffPhotoPath);
	public DtoFreeBoard freeboardContent(String fbSeqno);
	public void viewCount(String fbSeqno);
	public ArrayList<DtoFreeBoard> freeboardContentFile(String fbSeqno);
	
}
