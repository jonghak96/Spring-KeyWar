package com.spring.keywar.dao;

import java.util.ArrayList;

import com.spring.keywar.dto.DtoMatch;
import com.spring.keywar.dto.DtoMemberCustomer;
import com.spring.keywar.dto.DtoMemberGym;

public interface DaoMatch {

	public void matchInsert(String myId, String rival, String gymSeqno, String date);
	public void matchIngChange(String matchSeqno, int mType);
	public void matchIngCancle(String matchSeqno);
	
	public ArrayList<Integer> matchListMemberSeqno(String mType, String myId);
	public DtoMemberCustomer matchListMember(int mSeqno, int cSeqno);

	public ArrayList<Integer> matchListRivalSeqno(String mType, String myId);

	public ArrayList<Integer> matchListGymSeqno(String mType, String myId);
	public DtoMemberGym matchListGym(int mSeqno, int cSeqno);
	
	public ArrayList<DtoMatch> matchListSeqno(String mType, String mId);
}
