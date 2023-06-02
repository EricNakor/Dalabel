package com.hiddenlayer.dalabel.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hiddenlayer.dalabel.TokenGenerator;
import com.hiddenlayer.dalabel.member.MemberDAO;

@Controller
public class BoardController {

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private BoardDAO bDAO;

	@RequestMapping(value = "/board.lists", method = RequestMethod.GET)
	public String boardLists(HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.clearSearch(req);
			bDAO.getAllPost(1, req);
			TokenGenerator.generate(req);
			req.setAttribute("contentPage", "community_board/lists.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "home";
	}
	
	@RequestMapping(value = "/board.delete", method = RequestMethod.GET)
	public String deletePost(Board b, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.deletePost(b, req);
			bDAO.clearSearch(req);
			bDAO.getAllPost(1, req);
			TokenGenerator.generate(req);
			req.setAttribute("contentPage", "community_board/write.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "home";
	}

	@RequestMapping(value = "/board.page.change", method = RequestMethod.GET)
	public String writePageChange(@RequestParam(value = "p") int p, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.getAllPost(p, req);
			TokenGenerator.generate(req);
			req.setAttribute("contentPage", "community_board/write.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "home";
	}
	
	@RequestMapping(value = "/board.write", method = RequestMethod.GET)
	public String writePost(Board b, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.writePost(b, req);
			bDAO.clearSearch(req);
			bDAO.getAllPost(1, req);
			TokenGenerator.generate(req);
			req.setAttribute("contentPage", "community_board/write.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "home";
	}

	@RequestMapping(value = "/board.search", method = RequestMethod.GET)
	public String writeSearch(@RequestParam(value = "search") String search, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.search(search, req);
			bDAO.getAllPost(1, req);
			TokenGenerator.generate(req);
			req.setAttribute("contentPage", "community_board/write.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "home";
	}
	
}
