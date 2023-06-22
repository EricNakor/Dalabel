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

	@RequestMapping(value = "/board.needlogin.go", method = RequestMethod.GET)
	public String boardLists(HttpServletRequest req) {
		bDAO.clearSearch(req);
		if (firstreq) {
			bDAO.setAllPostCount();
			firstreq = false;
		}
		bDAO.getAllPost(1, req);
		bDAO.getCurNotice(1, req);
		TokenGenerator.generate(req);
		
		req.setAttribute("contentPage", "community_board/lists.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.comment.delete", method = RequestMethod.GET)
	public String deleteComment(@RequestParam(value = "inherit_post") int board_id,
			@RequestParam(value = "comment_id") int comment_id, HttpServletRequest req) {
		bDAO.deleteComment(comment_id, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/details.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.post.delete", method = RequestMethod.GET)
	public String deletePost(@RequestParam(value = "board_id") BigDecimal board_id, HttpServletRequest req) {
		bDAO.deletePost(board_id, req);
		bDAO.clearSearch(req);
		bDAO.getAllPost(1, req);
		bDAO.getCurNotice(1, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/lists.jsp");
		return "index";

	}

	@RequestMapping(value = "/board.needlogin.post.write.do", method = RequestMethod.GET)
	public String doUpdatePost(Board b, HttpServletRequest req) {
		bDAO.writePost(b, req);
		bDAO.clearSearch(req);
		bDAO.getAllPost(1, req);
		bDAO.getCurNotice(1, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/lists.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.post.update.do", method = RequestMethod.POST)
	public String doUpdatePost(HttpServletRequest req, Board b) {
		bDAO.updateBoard(req, b);
		bDAO.getAllPost(1, req);
		bDAO.getCurNotice(1, req);
		req.setAttribute("contentPage", "community_board/lists.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.get.detail", method = RequestMethod.GET)
	public String getDetailBoard(@RequestParam(value = "board_id") int board_id, HttpServletRequest req) {
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/details.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.get.reply", method = RequestMethod.GET)
	public String getReply(@RequestParam(value = "board_id") int board_id,
			@RequestParam(value = "inherit_comment") int comment_id, HttpServletRequest req) {
		bDAO.getDetailBoard(board_id, req);
		bDAO.getReply(comment_id, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/details.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.post.update.go", method = RequestMethod.GET)
	public String goUpdatePost(HttpServletRequest req, @RequestParam(value = "board_id") int board_id) {
		bDAO.getDetailBoard(board_id, req);
		req.setAttribute("contentPage", "community_board/update.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.post.write.go", method = RequestMethod.GET)
	public String goWritePost(HttpServletRequest req) {
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/write.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.comment.update", method = RequestMethod.POST)
	public String updateComment(@RequestParam(value = "inherit_post") int board_id, BoardComment bc,
			HttpServletRequest req) {
		bDAO.updateComment(bc, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/details.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.comment.write", method = RequestMethod.POST)
	public String writeComment(@RequestParam(value = "inherit_post") int board_id, BoardComment bc,
			HttpServletRequest req) {
		bDAO.writeComment(bc, req);
//			bDAO.clearSearch(req);
//			bDAO.getAllPost(1, req);
		TokenGenerator.generate(req);
		bDAO.getDetailBoard(board_id, req);
		req.setAttribute("contentPage", "community_board/details.jsp");
		return "index";

	}

	@RequestMapping(value = "/board.needlogin.page.change", method = RequestMethod.GET)
	public String writePageChange(@RequestParam(value = "p") int p, HttpServletRequest req) {
		bDAO.getAllPost(p, req);
		if (p == 1) {
			bDAO.getCurNotice(1, req);
		}
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/lists.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.post.write.do", method = RequestMethod.POST)
	public String writePost(Board b, HttpServletRequest req) {
		bDAO.writePost(b, req);
		bDAO.clearSearch(req);
		bDAO.getAllPost(1, req);
		bDAO.getCurNotice(1, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/lists.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.search", method = RequestMethod.GET)
	public String writeSearch(@RequestParam(value = "search") String search, HttpServletRequest req) {
		bDAO.search(search, req);
		bDAO.getAllPost(1, req);
		bDAO.getCurNotice(1, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/lists.jsp");
		return "index";

	}

	@RequestMapping(value = "/board.needlogin.reply.write", method = RequestMethod.POST)
	public String writeReply(@RequestParam(value = "inherit_post") int board_id, BoardReply br,
			HttpServletRequest req) {
		bDAO.writeReply(br, req);
		TokenGenerator.generate(req);
		bDAO.getDetailBoard(board_id, req);
		req.setAttribute("contentPage", "community_board/details.jsp");
		return "index";

	}

	@RequestMapping(value = "/board.needlogin.reply.delete", method = RequestMethod.GET)
	public String deleteReply(@RequestParam(value = "inherit_post") int board_id,
			@RequestParam(value = "inherit_comment") int comment_id, @RequestParam(value = "reply_id") int reply_id,
			HttpServletRequest req) {
		bDAO.deleteReply(reply_id, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/details.jsp");
		return "index";
	}

	@RequestMapping(value = "/board.needlogin.reply.update", method = RequestMethod.POST)
	public String updateReply(@RequestParam(value = "inherit_post") int board_id,
			@RequestParam(value = "reply_id") int reply_id, BoardReply br, HttpServletRequest req) {
		bDAO.updateReply(br, req);
		bDAO.getDetailBoard(board_id, req);
		TokenGenerator.generate(req);
		req.setAttribute("contentPage", "community_board/details.jsp");
		return "index";
	}

}
