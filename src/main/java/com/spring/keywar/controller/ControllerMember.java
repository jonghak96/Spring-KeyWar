package com.spring.keywar.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.keywar.dao.DaoMember;


@Controller
public class ControllerMember {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 선수/ 체육관 회원가입 선택 창
	@RequestMapping("/signUp_view") 
	public String write_view(Model model) {
		
		return "member/signUpSelect";
	}
	
	// 선수 회원가입 창
	@RequestMapping("/memberSignUp_view") 
	public String memberSignUp_view(Model model) {
		
		return "member/memberSignUp";
	}

	// 회원가입 정보 입력
	@RequestMapping("/customerSignUp") 
	public String cstomerSignUp(HttpServletRequest request, Model model) {
		
		DaoMember dao = sqlSession.getMapper(DaoMember.class);
		dao.writeMemberDao(request.getParameter("id"), 
							request.getParameter("pw"), 
							request.getParameter("name"), 
							(request.getParameter("telno") + "-" + request.getParameter("telno2") + "-" + request.getParameter("telno3")), 
							(request.getParameter("email1") + "@" + request.getParameter("email2")), 
							request.getParameter("area"), 
							request.getParameter("intro"), 
							request.getParameter("sports"), 
							request.getParameter("type"));
		
		dao.writeCustomerDao(request.getParameter("sex"), 
							request.getParameter("age"), 
							Double.valueOf(request.getParameter("height")), 
							Double.valueOf(request.getParameter("weight")), 
							request.getParameter("wClass"),
							request.getParameter("id"));
					
		return "redirect:member/memberSignUp";
	}
	
	// 체육관 회원가입 창
	@RequestMapping("/gymSignUp_view") 
	public String gymSignUp_view(Model model) {
		
		return "member/gymSignUp";
	}
	
	// 체육관 회원가입 정보
	@RequestMapping("/gymSignUp") 
	public String gymSignUp(HttpServletRequest request, Model model) {
		System.out.println("짐다오시작");
		
		DaoMember dao = sqlSession.getMapper(DaoMember.class);
		dao.writeMemberDao(request.getParameter("id"), 
							request.getParameter("pw"), 
							request.getParameter("name"), 
							(request.getParameter("telno") + "-" + request.getParameter("telno2") + "-" + request.getParameter("telno3")), 
							(request.getParameter("email1") + "@" + request.getParameter("email2")), 
							request.getParameter("area"), 
							request.getParameter("intro"), 
							request.getParameter("sports"), 
							request.getParameter("type"));
		System.out.println("멤버 회원가입했고" + request.getParameter("id"));
		
		dao.writeGymDao((request.getParameter("number1") + "-" + request.getParameter("number2") + "-" + request.getParameter("number3")), 
						(request.getParameter("gArea") + request.getParameter("address")), 
						Integer.parseInt(request.getParameter("price")), 
						request.getParameter("id"));
		System.out.println("체육관 회원가입도 했고" + request.getParameter("price"));
		
		dao.writeTimeTableDao(request.getParameter("id"),
				  request.getParameter("timeTable1"),
				  request.getParameter("timeTable2"));
		System.out.println("타임테이블마저 했는데" + request.getParameter("timeTable1"));
					
		return "redirect:member/memberSignUp";
	}
	
	
	
	
	
}//----
