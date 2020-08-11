package com.spring.keywar.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.keywar.dao.DaoMember;
import com.spring.keywar.service.FileUploadService;


@Controller
public class ControllerMember {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	ServletContext servletContext;
	
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
	public String cstomerSignUp(HttpServletRequest request, Model model, @RequestParam("files") MultipartFile files) {		
		
		System.out.println(files);
		
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
		
		// 동적 저장 장소.
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/");
				String url = fileUploadService.restore(files, uploadPath);
				model.addAttribute("url", url);
				
				// 파일 첨부하기. (파일은 일단 절대값 넣음)
		
		dao.writeCustomerDao(request.getParameter("sex"), 
							request.getParameter("age"), 
							"123",
							url,
							Double.valueOf(request.getParameter("height")), 
							Double.valueOf(request.getParameter("weight")), 
							request.getParameter("wClass"),
							request.getParameter("id"));
		
		dao.writeReadyDao(
						  request.getParameter("rSex"),
						  request.getParameter("rAge1"),
						  request.getParameter("rAge2"),
						  request.getParameter("rArea"),
						  request.getParameter("rwClass1"),
						  request.getParameter("rwClass2"),
						  request.getParameter("id"));
					
		return "login/login";
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
					
		return "login/login";
	}
	
	// 로그인 창
	@RequestMapping("/login") 
	public String login(Model model) {
			
		return "login/login";
	}
		
	// 로그인 데이터베이스 확인
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request, Model model) {
			
		DaoMember dao = sqlSession.getMapper(DaoMember.class);
		String loginId = dao.loginCheckDao(request.getParameter("mId"), request.getParameter("mPw"));
		if (loginId == null){
			return "login/loginFalse";
		}else {
			HttpSession session = request.getSession();     // 세션 객체만들기

			session.setAttribute("loginId", loginId);
			return "mainScreen";
		}
	}
		
	// 아이디 찾기 창
	@RequestMapping("/loginIdFind") 
	public String loginIdFind(Model model) {
				
		return "login/loginIdFind";
	}
	
	// 아이디 찾기
	@RequestMapping("/findId")
	public String findId(HttpServletRequest request, Model model) {
		
		DaoMember dao = sqlSession.getMapper(DaoMember.class);
		String findId = dao.findId(request.getParameter("mName"), request.getParameter("mTelno"), request.getParameter("mEmail"));
		model.addAttribute("mId", findId);
		
		if (findId == null) 
			return "login/loginFalse";
		
		return "login/loginIdFind2";
	}
		
	// 비밀번호 찾기 창
	@RequestMapping("/loginPwFind") 
	public String loginPwFind(Model model) {
					
		return "login/loginPwFind";
	}	
	
	// 아이디 찾기
	@RequestMapping("/findPw")
	public String findPw(HttpServletRequest request, Model model) {
		
		DaoMember dao = sqlSession.getMapper(DaoMember.class);
		String findPw = dao.findPw(request.getParameter("mId"), request.getParameter("mName"), request.getParameter("mTelno"), request.getParameter("mEmail"));
		model.addAttribute("mPw", findPw);
		
		if (findPw == null) {
			return "login/loginFalse";
		}else
			return "login/loginPwFind2";
	}

	
	
}//----