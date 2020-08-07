package com.spring.keywar.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControllerMain {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/main")
	public String main(Model model) {
		
		return "mainScreen";
	}
	
	@RequestMapping("/fighterPage")
	public String fighterPage(Model model) {
		
		return "fighter/fighterPage";
	}
	
	@RequestMapping("/fighterSearch.kf")
	public String fighterSearch(Model model) {
		
		return "fighterSearch";
	}
	

}