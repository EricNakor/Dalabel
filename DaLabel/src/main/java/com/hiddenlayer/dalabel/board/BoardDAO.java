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
	private DalabelOptions DalableOptions;

	@Autowired
	private SqlSession ss;

	public BoardDAO() {
		super();
		allPostCount = 0;
	}

	public int getAllPostCount() {
		return allPostCount;
	}

	public void setAllPostCount(int allPostCount) {
		this.allPostCount = allPostCount;
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
			int pageCount = (int) Math.ceil(postCount / (double) DalableOptions.getBoardPostPerPage());
			int start = (page - 1) * DalableOptions.getBoardPostPerPage() + 1;
			int end = page * DalableOptions.getBoardPostPerPage();

			if (search == null) {
				search = "";
			} else {
				BoardSelector bSel = new BoardSelector(search, start, end);
				postCount = ss.getMapper(BoardMapper.class).getPostCount(bSel);
			}
			BoardSelector bSel = new BoardSelector(search, start, end);

			// 댓글 불러오기
			List<Board> posts = ss.getMapper(BoardMapper.class).getPost(bSel);

//			for (Board b : posts) {
//				b.setB_comment(ss.getMapper(BoardMapper.class).getComment(b));
//			}

			req.setAttribute("posts", posts);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("page", page);
		} catch (Exception e) {

		}
	}

	public void getDetailBoard(int board_id, HttpServletRequest req) {
		req.setAttribute("detailBoard", ss.getMapper(BoardMapper.class).getDetailBoard(board_id));
	}

	public void search(String search, HttpServletRequest req) {
		req.getSession().setAttribute("search", search);
	}

	public void setAllPostCount() {
		BoardSelector bSel2 = new BoardSelector("", 0, 0);
		allPostCount = ss.getMapper(BoardMapper.class).getPostCount(bSel2);
	}

	public void writePost(Board b, HttpServletRequest req) {
		try {
			String token = req.getParameter("token");
			String lastSuccessToken = (String) req.getSession().getAttribute("successToken");
			if (lastSuccessToken != null && token.equals(lastSuccessToken)) {
				req.setAttribute("result", "글쓰기 실패");
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

	public void writeComment(BoardComment bc, HttpServletRequest req) {
		try {
			String token = req.getParameter("token");
			String lastSuccessToken = (String) req.getSession().getAttribute("successToken");
			if (lastSuccessToken != null && token.equals(lastSuccessToken)) {
				req.setAttribute("result", "댓글쓰기 실패");
				return;
			}

			Member m = (Member) req.getSession().getAttribute("loginMember");
			bc.setUser_id(m.getUser_id());
			if (ss.getMapper(BoardMapper.class).writeComment(bc) == 1) {
				req.setAttribute("result", "댓글쓰기 성공");
				req.getSession().setAttribute("successToken", token);
				allPostCount++;
			}
		} catch (Exception e) {
			req.setAttribute("result", "댓글쓰기 실패");
		}
	}
}
