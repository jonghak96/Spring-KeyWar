package com.spring.keywar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ControllerMember {

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
					
		return "login";
	}
	
	// 체육관 회원가입 창
	@RequestMapping("/gymSignUp_view") 
	public String gymSignUp_view(Model model) {
		
		return "member/gymSignUp";
	}
	
	// 체육관 회원가입 정보
	@RequestMapping("/gymSignUp") 
	public String gymSignUp(HttpServletRequest request, Model model) {
		
		
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
		
		dao.writeGymDao((request.getParameter("number1") + "-" + request.getParameter("number2") + "-" + request.getParameter("number3")), 
						(request.getParameter("gArea") + request.getParameter("address")), 
						Integer.parseInt(request.getParameter("price")), 
						request.getParameter("id"));
		
		dao.writeTimeTableDao(request.getParameter("id"),
				  request.getParameter("timeTable1"),
				  request.getParameter("timeTable2"));
					
		return "login";
	}
	
	// 로그인 창
	@RequestMapping("/login") 
	public String login(Model model) {
			
		return "login/login";
	}
		
	// 로그인 데이터베이스 확인 후 있으면 mainScreen으로 로그인 아이디값을 가져감
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request, Model model) {
			
		DaoMember dao = sqlSession.getMapper(DaoMember.class);
		String loginId = dao.loginCheckDao(request.getParameter("mId"), request.getParameter("mPw"));
		if (loginId == null){
			return "login/loginFalse";
		}else {
			HttpSession session = request.getSession();

			session.setAttribute("loginId", loginId);
			
		return "mainScreen";
		}
	}
		
	// 아이디 찾기 창
	@RequestMapping("/loginIdFind") 
	public String loginIdFind(Model model) {
				
		return "login/loginIdFind";
	}
	
	// 아이디 찾기 - 아이디 찾은 화면으로 넘기기
	@RequestMapping("/findId")
	public String findId(HttpServletRequest request, Model model) {
		
		DaoMember dao = sqlSession.getMapper(DaoMember.class);
		String findId = dao.findId(request.getParameter("mName"), request.getParameter("mTelno"), request.getParameter("mEmail"));
		model.addAttribute("findId", findId);
		
		if (findId == null) {
			return "login/loginFalse";
		}else
		return "login/loginIdFind2";
	}
	
	// 비밀번호 찾기 창
	@RequestMapping("/loginPwFind") 
	public String loginPwFind(Model model) {
					
		return "login/loginPwFind";
	}	
	
	// 비밀번호 찾기 - 비밀번호 찾은 화면으로 넘기기
	@RequestMapping("/findPw")
	public String findPw(HttpServletRequest request, Model model) {
		
		DaoMember dao = sqlSession.getMapper(DaoMember.class);
		String findPw = dao.findPw(request.getParameter("mId"), request.getParameter("mName"), request.getParameter("mTelno"), request.getParameter("mEmail"));
		model.addAttribute("findPw", findPw);
		
		if (findPw == null) {
			return "login/loginFalse";
		}else
			return "login/loginPwFind2";
	}

	
	
}//----
