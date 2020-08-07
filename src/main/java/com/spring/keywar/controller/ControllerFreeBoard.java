package com.spring.keywar.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.keywar.dao.DaoFreeBoard;

@Controller
public class ControllerFreeBoard {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/freeboard/freeboardSearch")
	public String freeboardList(HttpServletRequest request, Model model) {
		
		// Dao 선언
		DaoFreeBoard dao = sqlSession.getMapper(DaoFreeBoard.class);
		
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
		
			request.setAttribute("searchCategory", "");
			request.setAttribute("searchWord", "");
			
			rowTotal = dao.count_freeboardList();
System.out.println(rowTotal);
			pageTotal = (double)rowTotal / 5;
			pageTotal = Math.ceil(pageTotal);
			
			
			// 페이지 처음 뜰 때, 테이블 출력
			model.addAttribute("search",dao.freeboardList((page-1)*5));
System.out.println(dao.freeboardList((page-1)*5).get(0).getFbSeqno());
System.out.println(dao.freeboardList((page-1)*5).get(1).getFbSeqno());
			model.addAttribute("pageTotal", (int)pageTotal);
			
		} else {
			
			searchCategory = request.getParameter("searchCategory");
			searchWord = request.getParameter("searchWord");
			
			if(searchCategory.equals("fbTitle")) {
				rowTotal = dao.count_freeboardSearch_fbTitle(searchWord);
System.out.println(rowTotal);
			}
			
			if(searchCategory.equals("mId")) {
				rowTotal = dao.count_freeboardSearch_mId(searchWord);
System.out.println(rowTotal);
			}
			
			pageTotal = (double)rowTotal / 5;
			pageTotal = Math.ceil(pageTotal);
			
			if(searchCategory.equals("fbTitle")) {
				model.addAttribute("search",dao.freeboardSearch_fbTitle(searchWord ,(page-1)*5));
System.out.println(dao.freeboardSearch_fbTitle(searchWord ,(page-1)*5));
			}
			
			if(searchCategory.equals("mId")) {
				model.addAttribute("search",dao.freeboardSearch_mId(searchWord ,(page-1)*5));
System.out.println(dao.freeboardSearch_mId(searchWord ,(page-1)*5));
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
		
		return "freeboard/freeboardSearch";
	}
	
	
	

	
	
	
}//----