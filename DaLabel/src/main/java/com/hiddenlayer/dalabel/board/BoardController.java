package com.hiddenlayer.dalabel.board;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hiddenlayer.dalabel.TokenGenerator;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO bDAO;

	private boolean firstreq;

	public BoardController() {
		firstreq = true;
	}

	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardLists(HttpServletRequest req) {
		bDAO.clearSearch(req);
		if (firstreq) {
			bDAO.setAllPostCount();
			firstreq = false;
		}
		bDAO.getAllPost(1, req);
		bDAO.getCurNotice(1, req);
		TokenGenerator.generate(req);

		return "community_board/lists";
//			req.setAttribute("contentPage", "community_board/lists.jsp");
//			req.setAttribute("contentPage", "home.jsp");
	}

	@RequestMapping(value = "/board.needlogin.comment.delete", method = RequestMethod.GET)
	public String deleteComment(@RequestParam(value = "inherit_post") int board_id,
			@RequestParam(value = "comment_id") int comment_id, HttpServletRequest req) {
		bDAO.deleteComment(comment_id, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		return "community_board/details";
	}
	@RequestMapping(value = "/board.needlogin.post.delete", method = RequestMethod.GET)
	public String deletePost(@RequestParam(value = "board_id") BigDecimal board_id, HttpServletRequest req) {
		bDAO.deletePost(board_id, req);
		bDAO.clearSearch(req);
		bDAO.getAllPost(1, req);
		TokenGenerator.generate(req);
//			req.setAttribute("contentPage", "community_board/detail.jsp");
		return "community_board/lists";
//			req.setAttribute("contentPage", "home.jsp");

	}

	@RequestMapping(value = "/board.needlogin.post.write.do", method = RequestMethod.GET)
	public String doUpdatePost(Board b, HttpServletRequest req) {
		bDAO.writePost(b, req);
		bDAO.clearSearch(req);
		bDAO.getAllPost(1, req);
		TokenGenerator.generate(req);
		return "community_board/lists";
	}

	@RequestMapping(value = "/board.needlogin.post.update.do", method = RequestMethod.POST)
	public String doUpdatePost(HttpServletRequest req, Board b) {
		bDAO.updateBoard(req, b);
		bDAO.getAllPost(1, req);
		return "community_board/lists";
	}

	@RequestMapping(value = "/board.needlogin.get.detail", method = RequestMethod.GET)
	public String getDetailBoard(@RequestParam(value = "board_id") int board_id, HttpServletRequest req) {
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		return "community_board/details";
	}

	@RequestMapping(value = "/board.needlogin.get.reply", method = RequestMethod.GET)
	public String getReply(@RequestParam(value = "board_id") int board_id,
			@RequestParam(value = "inherit_comment") int comment_id, HttpServletRequest req) {
		bDAO.getDetailBoard(board_id, req);
		bDAO.getReply(comment_id, req);
		TokenGenerator.generate(req);
		return "community_board/details";
	}
	@RequestMapping(value = "/board.needlogin.post.update.go", method = RequestMethod.GET)
	public String goUpdatePost(HttpServletRequest req, @RequestParam(value = "board_id") int board_id) {
		bDAO.getDetailBoard(board_id, req);
		return "community_board/update";
	}

	@RequestMapping(value = "/board.needlogin.post.write.go", method = RequestMethod.GET)
	public String goWritePost(HttpServletRequest req) {
		TokenGenerator.generate(req);
		return "community_board/write";
	}

	@RequestMapping(value = "/board.needlogin.comment.update", method = RequestMethod.GET)
	public String updateComment(@RequestParam(value = "inherit_post") int board_id, BoardComment bc,
			HttpServletRequest req) {
		bDAO.updateComment(bc, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		return "community_board/details";
	}

@RequestMapping(value = "/board.needlogin.comment.write", method = RequestMethod.GET)
	public String writeComment(@RequestParam(value = "inherit_post") int board_id, BoardComment bc,
			HttpServletRequest req) {
		bDAO.writeComment(bc, req);
//			bDAO.clearSearch(req);
//			bDAO.getAllPost(1, req);
		TokenGenerator.generate(req);
		bDAO.getDetailBoard(board_id, req);
//			req.setAttribute("contentPage", "community_board/detail.jsp");
		return "community_board/details";

//			req.setAttribute("contentPage", "home.jsp");
//		return "home";
	}
	
	@RequestMapping(value = "/board.needlogin.page.change", method = RequestMethod.GET)
	public String writePageChange(@RequestParam(value = "p") int p, HttpServletRequest req) {
		bDAO.getAllPost(p, req);
		if (p == 1) {
			bDAO.getCurNotice(1, req);
		}
		TokenGenerator.generate(req);
//			req.setAttribute("contentPage", "community_board/write.jsp");
		return "community_board/lists";
//			req.setAttribute("contentPage", "home.jsp");
	}

	@RequestMapping(value = "/board.needlogin.post.write.do", method = RequestMethod.POST)
	public String writePost(Board b, HttpServletRequest req) {
		bDAO.writePost(b, req);
		bDAO.clearSearch(req);
		bDAO.getAllPost(1, req);
		TokenGenerator.generate(req);
//			req.setAttribute("contentPage", "community_board/write.jsp");
		return "community_board/lists";
//			req.setAttribute("contentPage", "home.jsp");
	}

	@RequestMapping(value = "/board.needlogin.search", method = RequestMethod.GET)
	public String writeSearch(@RequestParam(value = "search") String search, HttpServletRequest req) {
		bDAO.search(search, req);
		bDAO.getAllPost(1, req);
		TokenGenerator.generate(req);
//			req.setAttribute("contentPage", "community_board/lists.jsp");
		return "community_board/lists";
//			req.setAttribute("contentPage", "home.jsp");

	}
	
	@RequestMapping(value="/board.needlogin.comment.update", method = RequestMethod.GET)
	public String updateComment(@RequestParam(value = "inherit_post") int board_id, BoardComment bc, HttpServletRequest req) {
		bDAO.updateComment(bc, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		return "community_board/details";
	}

	@RequestMapping(value = "/board.needlogin.reply.write", method = RequestMethod.GET)
	public String writeReply(@RequestParam(value = "inherit_post") int board_id, BoardReply br, HttpServletRequest req) {
		bDAO.writeReply(br, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		return "community_board/details";

	}

	@RequestMapping(value = "/board.needlogin.search", method = RequestMethod.GET)
	public String writeSearch(@RequestParam(value = "search") String search, HttpServletRequest req) {
		bDAO.search(search, req);
		bDAO.getAllPost(1, req);
	@RequestMapping(value = "/board.needlogin.comment.delete", method = RequestMethod.GET)
	public String deleteComment(@RequestParam(value = "inherit_post") int board_id, @RequestParam(value = "comment_id") int comment_id,HttpServletRequest req) {
		bDAO.deleteComment(comment_id, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		return "community_board/details";
	}
	
	@RequestMapping(value = "/board.needlogin.get.reply", method = RequestMethod.GET)
	public String getReply(@RequestParam(value = "board_id") int board_id, @RequestParam(value = "inherit_comment") int comment_id,HttpServletRequest req) {
		bDAO.getDetailBoard(board_id, req);
		bDAO.getReply(comment_id, req);
		TokenGenerator.generate(req);
//			req.setAttribute("contentPage", "community_board/lists.jsp");
		return "community_board/lists";
//			req.setAttribute("contentPage", "home.jsp");

	}

}
