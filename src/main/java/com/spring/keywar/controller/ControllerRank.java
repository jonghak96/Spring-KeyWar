package com.spring.keywar.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.keywar.dao.DaoRank;

@Controller
public class ControllerRank {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/rankingList") 
	public String rankingList(Model model) {
		
		DaoRank dao = sqlSession.getMapper(DaoRank.class);
		
		model.addAttribute("list", dao.rankingList());
		
		return "rank/fighterListTop3";
	}	
	
	
	
}//----
