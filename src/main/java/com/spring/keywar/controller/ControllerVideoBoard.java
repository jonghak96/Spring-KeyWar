package com.spring.keywar.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.keywar.dao.DaoMatch;
import com.spring.keywar.dao.DaoVideoBoard;
import com.spring.keywar.service.FileUploadService;

@Controller
public class ControllerVideoBoard {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping("/getVideoboardSearch")
	public String freeboardList(HttpServletRequest request, Model model) {
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
		
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
			
			rowTotal = dao.count_videoboardList();
			pageTotal = (double)rowTotal / 5;
			pageTotal = Math.ceil(pageTotal);
			
			
			// 페이지 처음 뜰 때, 테이블 출력
			model.addAttribute("search", dao.videoboardList((page-1)*5));
			model.addAttribute("pageTotal", (int)pageTotal);
		} else {
			
			searchCategory = request.getParameter("searchCategory");
			searchWord = request.getParameter("searchWord");
			
			if(searchCategory.equals("bTitle")) {
				rowTotal = dao.count_videoboardSearch_bTitle(searchWord);
			}
			if(searchCategory.equals("mId")) {
				rowTotal = dao.count_videoboardSearch_mId(searchWord);
			}
			
			
			
			pageTotal = (double)rowTotal / 5;
			pageTotal = Math.ceil(pageTotal);
			
			if(searchCategory.equals("bTitle")) {
				model.addAttribute("search", dao.videoboardSearch_bTitle(searchWord ,(page-1)*5));
			}
			if(searchCategory.equals("mId")) {
				model.addAttribute("search", dao.videoboardSearch_mId(searchWord ,(page-1)*5));
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
		
//		절대값
//		HttpSession session = request.getSession();     // 세션 객체만들기
//		String sessionid = session.getAttribute("loginId").toString();
//		int idCheck = dao.gymIdCheck(sessionid);
		model.addAttribute("IDCHECK", 1);
		
		model.addAttribute("point", point);
		model.addAttribute("page", page);
		model.addAttribute("min_num", min_num);
		model.addAttribute("max_num", max_num);
		model.addAttribute("back", back);
		model.addAttribute("go", go);
		
		
		return "videoboard/boardSearch";
	}
	
	
	@RequestMapping("/videoboard/boardWrite")
	public String boardWrite() {
		return "videoboard/boardWrite";
	}

	
	@RequestMapping("/writeVideoboard")
	public String writeVideoboard(
			HttpServletRequest request,
			Model model,
			@RequestParam("mResult") String mResult,
			@RequestParam("member_mSeqno") String member_mSeqno,
			@RequestParam("rival_mSeqno") String rival_mSeqno,
			@RequestParam("mId") String mId,
			@RequestParam("bTitle") String bTitle,
			@RequestParam("bContent") String bContent,
			@RequestParam("imgSrc") String imgSrc, // ????
			@RequestParam("videoFile") MultipartFile videoFile) {
		
		// 동적 저장 장소.
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/");
		System.out.println(uploadPath);
		// 영상 업로드.
		String url = fileUploadService.restore(videoFile, uploadPath);
		model.addAttribute("url", url);
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
		// 글 작성하기. // 작성자 잘 들어가는지 확인하기!!!!
		dao.videoboardWrite(bTitle, bContent, mId);
		// 파일 첨부하기. (파일은 일단 절대값 넣음)  // 작성자 잘 들어가는지 확인하기!!!! // 썸네일 추출하기!!!!
		dao.videoboardWriteFile("test", "test", url, mId);
		
		// Dao 선언
		DaoMatch dao2 = sqlSession.getMapper(DaoMatch.class);
		// 영상 등록할 때, 전적 갱신해주기.
		dao2.matchCompleted(mId, member_mSeqno, rival_mSeqno);
		
		return "videoboard/boardSearch";
	}
	
	
	@RequestMapping("/videoboard/boardContent")
	public String boardContent(HttpServletRequest request, Model model) {
		
		String bSeqno = request.getParameter("bSeqno");
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
		request.setAttribute("boardContent", dao.videoboardContent(bSeqno));
		dao.viewCount(bSeqno);
		
		return "videoboard/boardContent";
	}
	
	
	
	
}//----
