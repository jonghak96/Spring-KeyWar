package com.spring.keywar.dao;

public interface DaoMatch {

	// 매칭 완료 후, 전적 갱신.
	public void matchCompleted(String gym_mId, String member_mId, String rival_mId);
	
}
