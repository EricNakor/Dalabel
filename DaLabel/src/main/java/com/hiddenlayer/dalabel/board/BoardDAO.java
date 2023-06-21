package com.hiddenlayer.dalabel.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.DalabelOptions;
import com.hiddenlayer.dalabel.member.Member;

@Service
public class BoardDAO {
	private int allPostCount;

	@Autowired
	private DalabelOptions dalableOptions;

	@Autowired
	private SqlSession ss;

	public BoardDAO() {
		super();
	}

	public void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}

	public void deletePost(BigDecimal board_id, HttpServletRequest req) {
		try {
			if (ss.getMapper(BoardMapper.class).deletePost(board_id) == 1) {
				req.setAttribute("result", "삭제성공");
				allPostCount--;
			} else {
				req.setAttribute("result", "삭제 실패");
			}
		} catch (Exception e) {
			req.setAttribute("result", "삭제 실패");
		}
	}

	public void getAllPost(int page, HttpServletRequest req) {
		try {
			int postCount = allPostCount;
			String search = (String) req.getSession().getAttribute("search");
			if (search == null) {
				search = "";
			} else {
				BoardSelector bSel = new BoardSelector(search, 0, 0);
				postCount = ss.getMapper(BoardMapper.class).getPostCount(bSel);
			}
			int pageCount = (int) Math.ceil(postCount / (double) dalableOptions.getBoardPostPerPage());
			int start = (page - 1) * dalableOptions.getBoardPostPerPage() + 1;
			int end = page * dalableOptions.getBoardPostPerPage();

			// 한번에 표시할 페이징 번호의 갯수
			int pageNum_cnt = 10;

			// 표시되는 페이지 번호 중 마지막 번호
			int endPageNum = (int) (Math.ceil((double) page / (double) pageNum_cnt) * pageNum_cnt);

			// 표시되는 페이지 번호 중 첫번째 번호
			int startPageNum = endPageNum - (pageNum_cnt - 1);

			// 마지막 번호 재계산

			if (endPageNum > pageCount) {
				endPageNum = pageCount;
			}

			boolean prev = page <= 1 ? false : true;
			boolean next = page >= pageCount ? false : true;

			BoardSelector bSel = new BoardSelector(search, start, end);

			List<Board> posts = ss.getMapper(BoardMapper.class).getPost(bSel);

			req.setAttribute("posts", posts);
			req.setAttribute("page", page);
			req.setAttribute("startPageNum", startPageNum);
			req.setAttribute("endPageNum", endPageNum);
			req.setAttribute("prev", prev);
			req.setAttribute("next", next);

		} catch (Exception e) {

		}
	}

	public int getAllPostCount() {
		return allPostCount;
	}

	public void getDetailBoard(int board_id, HttpServletRequest req) {
		req.setAttribute("detailBoard", ss.getMapper(BoardMapper.class).getDetailBoard(board_id));
		req.setAttribute("comment", ss.getMapper(BoardMapper.class).getComment(board_id));
	}

	public void search(String search, HttpServletRequest req) {
		req.getSession().setAttribute("search", search);
	}

	public void setAllPostCount() {
		BoardSelector bSel2 = new BoardSelector("", 0, 0);
		allPostCount = ss.getMapper(BoardMapper.class).getPostCount(bSel2);
	}

	public void setAllPostCount(int allPostCount) {
		this.allPostCount = allPostCount;
	}

	public void updateBoard(HttpServletRequest req, Board b) {
		ss.getMapper(BoardMapper.class).updatePost(b);
	}

	public void writeComment(BoardComment bc, HttpServletRequest req) {
		try {
			String token = req.getParameter("token");
			String lastSuccessToken = (String) req.getSession().getAttribute("successToken");
			if (lastSuccessToken != null && token.equals(lastSuccessToken)) {
				req.setAttribute("result", "댓글쓰기 실패");
				return;
			}

			String user = (String) req.getSession().getAttribute("loginUserID");
			bc.setComment_writer(user);
			if (ss.getMapper(BoardMapper.class).writeComment(bc) == 1) {
				req.setAttribute("result", "댓글쓰기 성공");
				req.getSession().setAttribute("successToken", token);
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "댓글쓰기 실패");
		}
	}

	public void writePost(Board b, HttpServletRequest req) {
		try {
			String token = req.getParameter("token");
			String lastSuccessToken = (String) req.getSession().getAttribute("successToken");
			if (lastSuccessToken != null && token.equals(lastSuccessToken)) {
				req.setAttribute("result", "글쓰기 실패 새로고침");
				return;
			}

			String user = (String) req.getSession().getAttribute("loginUserID");
			b.setBoard_writer(user);
			b.setBoard_content(b.getBoard_content().replace("\r\n", "<br>"));

			if (ss.getMapper(BoardMapper.class).writePost(b) == 1) {
				req.setAttribute("result", "글쓰기 성공");
				req.getSession().setAttribute("successToken", token);
				allPostCount++;
			}
		} catch (Exception e) {
			req.setAttribute("result", "글쓰기 실패");
		}
	}

	public void deleteComment(int comment_id, HttpServletRequest req) {
		ss.getMapper(BoardMapper.class).deleteComment(comment_id);
	}

	public void updateComment(BoardComment bc, HttpServletRequest req) {
//		String user = (String) req.getSession().getAttribute("loginUserID");
//		bc.setComment_writer(user);
		ss.getMapper(BoardMapper.class).updateComment(bc);
	}

	public void writeReply(BoardReply br, HttpServletRequest req) {
		try {
			String token = req.getParameter("token");
			String lastSuccessToken = (String) req.getSession().getAttribute("successToken");
			if (lastSuccessToken != null && token.equals(lastSuccessToken)) {
				req.setAttribute("result", "대댓글쓰기 실패");
				return;
			}

			String user = (String) req.getSession().getAttribute("loginUserID");
			br.setReply_writer(user);
			if (ss.getMapper(BoardMapper.class).writeReply(br) == 1) {
				req.setAttribute("result", "대댓글쓰기 성공");
				req.getSession().setAttribute("successToken", token);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getReply(int comment_id, HttpServletRequest req) {
		req.setAttribute("reply", ss.getMapper(BoardMapper.class).getReply(comment_id));
	}

}
