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
	
	// 메인스크린
	@RequestMapping("/main")
	public String main(Model model) {
		
		return "mainScreen";
	}
	
	// 선수정보 페이지로 이동
	@RequestMapping("/fighterPage")
	public String fighterPage(Model model) {
		
		return "fighter/fighterPage";
	}
	
	// 비밀번호 찾기 창
	@RequestMapping("/gymPage") 
	public String loginPwFind(Model model) {
					
		return "gym/gymPage";
	}	
	
	// 로그아웃
	@RequestMapping("/logout") 
	public String logout(Model model) {
		
		return "login/logout";
	}	
	
	

}
