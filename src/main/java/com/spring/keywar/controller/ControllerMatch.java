package com.spring.keywar.controller;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.keywar.dao.DaoFighter;
import com.spring.keywar.dao.DaoMatch;
import com.spring.keywar.dto.DtoMatch;
import com.spring.keywar.dto.DtoMemberCustomer;
import com.spring.keywar.dto.DtoMemberGym;

@Controller
public class ControllerMatch {

	@Autowired
	private SqlSession sqlSession; // b
	
	@RequestMapping("/matching")
	public String name(HttpServletRequest request, Model model) {

		// Dao 선언
		DaoMatch dao = sqlSession.getMapper(DaoMatch.class);

		String myId = request.getParameter("myId");
		String gymSeqno = request.getParameter("gymSeqno");
		String rival = request.getParameter("rivalId");
		// ------- 날짜 ------
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String hour = request.getParameter("hour");
		String minute = request.getParameter("minute");
		
		Calendar calendar = Calendar.getInstance();
		String dates = Integer.toString(calendar.get(Calendar.YEAR)) + "-" + month + "-" + day + " " + hour + ":" + minute + ":00";
		// -----------------	
		
		dao.matchInsert(myId, rival, gymSeqno, dates);
		
		return "redirect:main";
	}
	
	
	@RequestMapping("/matchRecord")
	public String matchRecord(Model model) {
		
		return "match/matchRecord";
	}
		
	@RequestMapping("matchingList")
	public String matchingList(HttpServletRequest request, Model model) {

		// Dao 선언
		DaoMatch dao = sqlSession.getMapper(DaoMatch.class);
		
	 	String id = request.getParameter("mId"); 
	 	String type = request.getParameter("mType");
	 	String matchSeqno = null;
	 	
	 	System.out.println("id = " + id);
	 	System.out.println("type = " + type);
	 	
	 	if (request.getParameter("matchSeqno") != null) {
	 		matchSeqno = request.getParameter("matchSeqno");
	 		int typed = Integer.parseInt(type);
	 		dao.matchIngChange(matchSeqno, ++typed);
	 	}
	 	
	 	if (request.getParameter("cancle") != null) {
	 		System.out.println("cancle");
	 		matchSeqno = request.getParameter("matchSeqno");
	 		dao.matchIngCancle(matchSeqno);
	 	}
		
	 	// 메칭 리스트 왼쪽 구하기
	 	ArrayList<Integer> memberSeqno = dao.matchListMemberSeqno(type, id);	 		 	
	 	ArrayList<DtoMemberCustomer> member = new ArrayList<DtoMemberCustomer>();
	 	for (int i = 0 ; i < memberSeqno.size() ; i++) {
	 		member.add(dao.matchListMember(memberSeqno.get(i), memberSeqno.get(i)));
	 	}
	 	
	 	// 메칭 리스트 오른쪽 구하기
	 	ArrayList<Integer> rivalSeqno = dao.matchListRivalSeqno(type, id);		 	
	 	ArrayList<DtoMemberCustomer> rival = new ArrayList<DtoMemberCustomer>();
	 	for (int i = 0 ; i < rivalSeqno.size() ; i++) {
	 		rival.add(dao.matchListMember(rivalSeqno.get(i), rivalSeqno.get(i)));
	 	}
	 	
	 	// 메칭 된 gym 구하기
	 	ArrayList<Integer> gymSeqno = dao.matchListGymSeqno(type, id);		 	
	 	ArrayList<DtoMemberGym> gym = new ArrayList<DtoMemberGym>();
	 	for (int i = 0 ; i < rivalSeqno.size() ; i++) {
	 		gym.add(dao.matchListGym(gymSeqno.get(i), gymSeqno.get(i)));
	 	}
	 	
	 	ArrayList<DtoMatch> matchSeqnoList = dao.matchListSeqno(type, id);
	 	
	 	model.addAttribute("MEMBER", member);
	 	model.addAttribute("RIVAL", rival);
	 	model.addAttribute("GYM", gym);
	 	model.addAttribute("MATCHSEQNO", matchSeqnoList);
	 	
	 	if (request.getParameter("matchSeqno") != null || request.getParameter("cancle") != null) {
	 		return "redirect:matchRecord";
	 	}
	 	
		return "match/matchingList";
	}
	
	
	
	
	
}//----
