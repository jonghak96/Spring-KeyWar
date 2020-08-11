package com.spring.keywar.dao;

import java.util.ArrayList;

import com.spring.keywar.dto.DtoFreeBoard;
import com.spring.keywar.dto.DtoFreeBoardComment;

public interface DaoFreeBoard {
	// 초기 자유게시판 리스트.
	public int count_freeboardList();
	public ArrayList<DtoFreeBoard> freeboardList(int page);
	// 검색 자유게시판 리스트.
	public int count_freeboardSearch_fbTitle(String searchWord);
	public int count_freeboardSearch_mId(String searchWord);
	public ArrayList<DtoFreeBoard> freeboardSearch_fbTitle(String searchWord, int page);
	public ArrayList<DtoFreeBoard> freeboardSearch_mId(String searchWord, int page);
	// 자유게시판 글쓰기.
	public void freeboardWrite(String fbTitle, String fbContent, String mId);
	public void freeboardWriteFile(String ffPhoto, String ffPhotoPath);
	// 자유게시판 내용.
	public DtoFreeBoard freeboardContent(String fbSeqno);
	// 자유게시판 내용 사진첨부.
	public ArrayList<DtoFreeBoard> freeboardContentFile(String fbSeqno);
	// 자유게시판 삭제.
	public void freeboardDelete(String fbSeqno);
	// 자유게시판 수정.
	public void freeboardUpdate(String fbTitle, String fbContent, String fbSeqno);
	// 자유게시판 조회수. 좋아요.
	public void viewCount(String fbSeqno);
	public void likeCount(String fbSeqno);
	// 자유게시판 댓글 쓰기.
	public void freeboardCommentWrite(String fcContent, String fbSeqno, String mId);
	public ArrayList<DtoFreeBoardComment> freeboardCommentContent(String fbSeqno);
	public void freeboardCommentDelete(String fcSeqno);
	public void freeboardCommentUpdate(String fcContent, String fcSeqno);
}
