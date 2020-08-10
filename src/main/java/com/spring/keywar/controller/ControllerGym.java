package com.spring.keywar.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.keywar.dao.DaoGym;

@Controller
public class ControllerGym {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/gymSearch_click")
	public String fighterSearch(HttpServletRequest request, Model model) {
		return "gym/gymPage";
	}
	
	
	@RequestMapping("/getGymSearch")
	public String gymList(HttpServletRequest request, Model model) {
		
		// Dao 선언
		DaoGym dao = sqlSession.getMapper(DaoGym.class);
		
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
		
		if(request.getParameter("page") == null || request.getParameter("page").equals("")) {
			page = 1;
		}else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("searchCategory") == null || request.getParameter("searchCategory").equals("") ||
				request.getParameter("searchWord") == null || request.getParameter("searchWord").equals("")) {
		
			model.addAttribute("searchCategory", "");
			model.addAttribute("searchWord", "");
			
			rowTotal = dao.count_gymList();
			pageTotal = (double)rowTotal / 10;
			pageTotal = Math.ceil(pageTotal);
			
			// 페이지 처음 뜰 때, 테이블 출력
			model.addAttribute("search", dao.gymList((page-1)*10));
			model.addAttribute("pageTotal", (int)pageTotal);
		} else {
			
			searchCategory = request.getParameter("searchCategory");
			searchWord = request.getParameter("searchWord");
			
			if(searchCategory.equals("mName")) {
				rowTotal = dao.count_gymSearch_mName(searchWord);
			}
			if(searchCategory.equals("gAddress")) {
				rowTotal = dao.count_gymSearch_gAddress(searchWord);
			}
			if(searchCategory.equals("mSports")) {
				rowTotal = dao.count_gymSearch_mSports(searchWord);
			}
			

			pageTotal = (double)rowTotal / 10;
			pageTotal = Math.ceil(pageTotal);
			
			if(searchCategory.equals("mName")) {
				model.addAttribute("search", dao.gymSearch_mName(searchWord, (page-1)*10));
System.out.println(dao.gymSearch_mName(searchWord, (page-1)*10));
			}
			if(searchCategory.equals("gAddress")) {
				model.addAttribute("search", dao.gymSearch_gAddress(searchWord, (page-1)*10));
System.out.println(dao.gymSearch_gAddress(searchWord, (page-1)*10));
			}
			if(searchCategory.equals("mSports")) {
				model.addAttribute("search", dao.gymSearch_mSports(searchWord, (page-1)*10));
System.out.println(dao.gymSearch_mSports(searchWord, (page-1)*10));
			}
			
			// 페이지 처음 뜰 때, 테이블 출력
			model.addAttribute("pageTotal", (int)pageTotal);
			model.addAttribute("searchCategory", searchCategory);
			model.addAttribute("searchWord", searchWord);
		}		
		
		int point = 1;
		if (page > 10)
			point = (page-1) / 10 + 1;
		
		int min_num = (point - 1) * 10 + 1;	// 리스트를 표시할 첫번째 수
		int max_num = min_num + 9;	// 보여줄 리스트 수
		
		if (max_num > pageTotal)
			max_num = (int)pageTotal;
		
		int back = 0;
		if (point >= 2 ) {	// 선택한 리스s트가 2번째일경우 뒤로가기를 만든다.
			back = point * 10 - 10;
		}
		
		int go = 0;
		if (point >= 1 && point < ((int)pageTotal / 10 + 1)) {	// 선택한 리스트가 1번째 이면서 전체 레코드수를 10으로 나눈값보다 작을때 앞으로가기를 만든다.
			go = point * 10 + 1;
		}
		
		model.addAttribute("point", point);
		model.addAttribute("page", page);
		model.addAttribute("min_num", min_num);
		model.addAttribute("max_num", max_num);
		model.addAttribute("back", back);
		model.addAttribute("go", go);
		
		return "gym/gymSearch";
	}
	
	
	@RequestMapping("/gym/gymContent")
	public String gymContent(HttpServletRequest request, Model model) {
		
		// Dao 선언
		DaoGym dao = sqlSession.getMapper(DaoGym.class);
		
		String mId = request.getParameter("mId");
System.out.println(mId);
		
		// 체육관 상세 정보.
		model.addAttribute("content", dao.gymContent(mId));
System.out.println(dao.gymContent(mId));
		// 체육관 이미지 리스트.
		model.addAttribute("gymphoto", dao.gymFile(mId));
System.out.println(dao.gymFile(mId));
		
		return "gym/gymContent";
	}
	
	
}//----