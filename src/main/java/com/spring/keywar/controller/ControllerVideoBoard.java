package com.spring.keywar.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.keywar.dao.DaoMatch;
import com.spring.keywar.dao.DaoVideoBoard;
import com.spring.keywar.service.FileUploadService;
import com.spring.keywar.service.VideoThread;

@Controller
public class ControllerVideoBoard {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping("/getVideoboardSearch")
	public String VideoboardList(HttpServletRequest request, Model model) {
		
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
		dao.videoboardWriteFile(imgSrc, "test", url, mId);
		
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
		// 영상게시판 내용 띄우기.
		model.addAttribute("boardContent", dao.videoboardContent(bSeqno));
		// 조회수 카운트.
		dao.viewCount(bSeqno);
		// 영상게시물 댓글 띄우기.
		model.addAttribute("commentContentVideo", dao.videoboardCommentContent(bSeqno));
		
		return "videoboard/boardContent";
	}
	
	
	@RequestMapping("/videoBoardLikeCount")
	public String likeCount(HttpServletRequest request) {
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
		dao.likeCount(request.getParameter("bSeqno"));
		
		return "redirect:getVideoboardSearch";
	}
	
	
	@RequestMapping("/videoboardDelete")
	public String videoboardDelete(HttpServletRequest request) {
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
		dao.videoboardDelete(request.getParameter("bSeqno"));
		
		return "redirect:getVideoboardSearch";
	}
	
	
	@RequestMapping("/videoboardUpdate")
	public String videoboardUpdate(HttpServletRequest request) {
		
System.out.println(request.getParameter("bSeqno"));
System.out.println(request.getParameter("bTitle"));
System.out.println(request.getParameter("bContent"));
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
		dao.videoboardUpdate(request.getParameter("bTitle"), request.getParameter("bContent"), request.getParameter("bSeqno"));
		
		return "redirect:getVideoboardSearch";
	}
	
	
	@RequestMapping("/videoboardCommentWrite")
	public String videoboardCommentWrite(HttpServletRequest request, Model model) {
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
// 지금은 작성자에서 불러옴. 로그인하면 세션값으로 불러와야함.		request.getParameter("mId")
		dao.videoboardCommentWrite(request.getParameter("cContent"), request.getParameter("bSeqno"), "jong");
		
		return "redirect:getVideoboardSearch";
	}
	
	
	@RequestMapping("/videoboardCommentDelete")
	public String videoboardCommentDelete(HttpServletRequest request) {
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
		dao.videoboardCommentDelete(request.getParameter("cSeqno"));
		
		return "redirect:getVideoboardSearch";
	}
	
	
	@RequestMapping("/videoboardCommentUpdate")
	public String videoboardCommentUpdate(HttpServletRequest request) {
		
		// Dao 선언
		DaoVideoBoard dao = sqlSession.getMapper(DaoVideoBoard.class);
		dao.videoboardCommentUpdate(request.getParameter("cContent"), request.getParameter("cSeqno"));
		
		return "redirect:getVideoboardSearch";
	}
	
	
	@RequestMapping("/videoThumbnail")
	public String videoThumbnail(MultipartHttpServletRequest multi, Model model) {
		
		// ---- 이미지 -----------------------------------------------		
		// 현재 시간 구하기
		System.out.println("memberSignUp");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
		Date date = new Date();
		String time = format.format(date);
		
		String uploadPath = multi.getSession().getServletContext().getRealPath("/resources/thumbnail/" + time);
		System.out.println("uploadPath = " + uploadPath);
		
		// 폴더 만들기
		File imgsDir = new File(uploadPath);
		if(!imgsDir.exists()) {
			try {
				imgsDir.mkdirs();
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("폴더가 이미 생성되어있습니다.");
		}
		
		int maxSize =1024 *1024 *100;// 한번에 올릴 수 있는 파일 용량 : 100M로 제한
					
		try{
			MultipartFile multiFile = multi.getFile("videoFile");
			
			File file = multipartFileToFile(multiFile);			
			
			// Sumnail 만드는 스레드 ----------------------------------------------------

			double plusSize = 1;
			int threadSize = 8;
			
			// thread 생성
			VideoThread[] videoThreads = new VideoThread[threadSize];
			
			for (int i = 0 ; i < videoThreads.length ; i++) {
				videoThreads[i] = new VideoThread(file, threadSize, i, plusSize, uploadPath);
				videoThreads[i].start();
			}
			System.out.println("쓰레드 시작");
			
			for (int i = 0 ; i < videoThreads.length; i++) {
				videoThreads[i].join();
			}
			System.out.println("쓰레드 종료");
			System.out.println("videolength = " + videoThreads.length);
			
			String[] uploadFilePath = new String[5];
			for (int i = 0 ; i < 5 ; i++) {
				uploadFilePath[i] = "resources/thumbnail/" + time + "/" + i + ".png";
				System.out.println("UploadPath" + i + " = " + uploadFilePath[i]);
			}
			
			model.addAttribute("UPLOADFILEPATH", uploadFilePath);
			
			// ------------------------------------------------------------------------

			
	    }catch(Exception e){
	        e.printStackTrace();
	    }	
		// -----------------------------------------------------------------
		
		return "videoboard/imgList";
	}
		
	// MultiFile -> File Conversion
	public File multipartFileToFile(MultipartFile mfile) throws IllegalStateException, IOException {
		File file = new File(mfile.getOriginalFilename());
		mfile.transferTo(file);
		return file;
	}
	
	
	
}//----
