package com.spring.keywar.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.keywar.dao.DaoFighter;
import com.spring.keywar.dto.DtoGym;

@Controller
public class ControllerFighter {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/fighterSearch_click")
	public String fighterSearch(HttpServletRequest request, Model model) {
		return "fighter/fighterPage";
	}
		
	@RequestMapping("/getFighterSearch")
	public String getfighterList(HttpServletRequest request, Model model) {

		// 큐브
		// HttpSession session
		// request.getSession();
		// String loginId
		// session.getAttribute("loginId").toString();
		// if ()
		// loginId = "";
		String loginId;
		
		HttpSession session = request.getSession();     // 세션 객체만들기
		if(session.getAttribute("loginId")==null) {
			loginId = "";
			System.out.println("loginId = " + loginId);
		}else {
			loginId = session.getAttribute("loginId").toString();
			System.out.println("loginId = " + loginId);
		}
		
		
			
		// Dao 선언
		DaoFighter dao = sqlSession.getMapper(DaoFighter.class);
		// 검색 카테고리
		String searchCategory = "";
		// 검색어
		String searchWord = "";
		// 총 컬럼 수
		double rowTotal = 0;
		// 총 페이지 수 = (총 컬럼 수 / 페이지 당 보여줄 갯수) 올림.
		double pageTotal = 0;
		// 현재 위치 페이지
		int page = 0;

		if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}

		if (request.getParameter("searchCategory") == null || request.getParameter("searchCategory").equals("")
				|| request.getParameter("searchWord") == null || request.getParameter("searchWord").equals("")) {

			model.addAttribute("searchCategory", "");
			model.addAttribute("searchWord", "");

			// 선수 총 컬럼 수 불러옴.
			rowTotal = dao.count_fighterList();
			pageTotal = (double) rowTotal / 10;
			pageTotal = Math.ceil(pageTotal);
			
			model.addAttribute("search", dao.fighterList((page-1)*10));
			model.addAttribute("pageTotal", (int)pageTotal);
			
		} else {
			
			searchCategory = request.getParameter("searchCategory");
			searchWord = request.getParameter("searchWord");
			
			if(searchCategory.equals("mId")) {
				rowTotal = dao.count_fighterSearch_mId(searchWord);
			}
			if(searchCategory.equals("mArea")) {
				rowTotal = dao.count_fighterSearch_mArea(searchWord);
			}
			if(searchCategory.equals("mSports")) {
				rowTotal = dao.count_fighterSearch_mSports(searchWord);
			}
				
			pageTotal = (double)rowTotal / 10;
			pageTotal = Math.ceil(pageTotal);
			
			
			if(searchCategory.equals("mId") | searchCategory.equals("mArea")) {
				model.addAttribute("search", dao.fighterSearch_mIdmArea(searchCategory, searchWord, (page-1)*10));
			}
			if(searchCategory.equals("mSports")) {
				model.addAttribute("search", dao.fighterSearch_mSports(searchWord, (page-1)*10));
			}
			
			
			// 페이지 처음 뜰 때, 테이블 출력
			model.addAttribute("pageTotal", (int)pageTotal);
			model.addAttribute("searchCategory", searchCategory);
			model.addAttribute("searchWord", searchWord);
		}	
		
		int pageIndex = 1;
		if (page > 10)
			pageIndex = (page-1) / 10 + 1;
		
		int min_num = (pageIndex - 1) * 10 + 1;	// 리스트를 표시할 첫번째 수
		int max_num = min_num + 9;	// 보여줄 리스트 수
		
		if (max_num > pageTotal)
			max_num = (int)pageTotal;
		
		int back = 0;
		if (pageIndex >= 2 ) {	// 선택한 리스s트가 2번째일경우 뒤로가기를 만든다.
			back = pageIndex * 10 - 10;
		}
		
		int go = 0;
		if (pageIndex >= 1 && pageIndex < ((int)pageTotal / 10 + 1)) {	// 선택한 리스트가 1번째 이면서 전체 레코드수를 10으로 나눈값보다 작을때 앞으로가기를 만든다.
			go = pageIndex * 10 + 1;
		}
			
		// 페이지 처음 뜰 때, 테이블 출력
//		model.addAttribute("pageTotal", (int)pageTotal);
//		model.addAttribute("searchCategory", searchCategory);
//		model.addAttribute("searchWord", searchWord);
		
		model.addAttribute("point", pageIndex);
		model.addAttribute("page", page);
		model.addAttribute("min_num", min_num);
		model.addAttribute("max_num", max_num);
		model.addAttribute("back", back);
		model.addAttribute("go", go);

		return "fighter/fighterSearch";
	}
	
	
	@RequestMapping("/fighter/fighterContent")
	public String fighterContent(HttpServletRequest request, Model model) {
		
		// Dao 선언
		DaoFighter dao = sqlSession.getMapper(DaoFighter.class);
		model.addAttribute("content", dao.fighterContent(request.getParameter("mId")));
		model.addAttribute("GYMLIST", dao.fighterGymList());
		
		
		return "fighter/fighterContent";
	}
	

}// ----
