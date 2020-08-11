package com.spring.keywar.dto;

import java.sql.Timestamp;

public class DtoBoardComment {

	// BoardComment
	int cSeqno;
	String cWriter;
	String cContent;
	Timestamp cDate;
	
	
	
	
	// Constructor
	
	public DtoBoardComment() {
		// TODO Auto-generated constructor stub
	}

	// 댓글 불러오는 생성자.
	public DtoBoardComment(int cSeqno, String cWriter, String cContent, Timestamp cDate) {
		super();
		this.cSeqno = cSeqno;
		this.cWriter = cWriter;
		this.cContent = cContent;
		this.cDate = cDate;
	}

	
	
	
	// Method
	public int getcSeqno() {
		return cSeqno;
	}

	public void setcSeqno(int cSeqno) {
		this.cSeqno = cSeqno;
	}

	public String getcWriter() {
		return cWriter;
	}

	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Timestamp getcDate() {
		return cDate;
	}

	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}
	
	
	
	
	
	
	
	
	
	
}//----
