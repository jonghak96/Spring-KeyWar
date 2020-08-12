package com.spring.keywar.dao;

import java.util.ArrayList;

import com.spring.keywar.dto.DtoBoardComment;
import com.spring.keywar.dto.DtoVideoBoard;


public interface DaoVideoBoard {

	// 초기 영상게시판 리스트.
	public int count_videoboardList();
	public ArrayList<DtoVideoBoard> videoboardList(int page);
	// 검색 영상게시판 리스트.
	public int count_videoboardSearch_bTitle(String searchWord);
	public int count_videoboardSearch_mId(String searchWord);
	public ArrayList<DtoVideoBoard> videoboardSearch_bTitle(String searchWord, int page);
	public ArrayList<DtoVideoBoard> videoboardSearch_mId(String searchWord, int page);
	// 작성자가 체육관인지 체크. 
	public int gymIdCheck(String seesionID);
	// 영상게시판 글쓰기.
	public void videoboardWrite(String bTitle, String bContent, String mId);
	public void videoboardWriteFile(String fPhotoPath, String fVideo, String fVideoPath, String mId);
	// 영상게시판 내용.
	public DtoVideoBoard videoboardContent(String bSeqno);
	
	// 영상게시판 내용 사진첨부.
	public ArrayList<DtoVideoBoard> videoboardContentFile(String fbSeqno);
	// 영상게시판 삭제.
	public void videoboardDelete(String bSeqno);
	// 영상게시판 수정.
	public void videoboardUpdate(String bTitle, String bContent, String bSeqno);
	// 영상게시판 조회수. 좋아요.
	public void viewCount(String bSeqno);
	public void likeCount(String bSeqno);
	// 영상게시판 댓글 쓰기.
	public void videoboardCommentWrite(String cContent, String bSeqno, String mId);
	public ArrayList<DtoBoardComment> videoboardCommentContent(String bSeqno); // ok.
	public void videoboardCommentDelete(String cSeqno);
	public void videoboardCommentUpdate(String cContent, String cSeqno);
}
