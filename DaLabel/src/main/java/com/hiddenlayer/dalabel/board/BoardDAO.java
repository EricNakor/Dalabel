package com.hiddenlayer.dalabel.board;

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

	public void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}

	public void deletePost(Board b, HttpServletRequest req) {
		try {
			if (ss.getMapper(BoardMapper.class).deletePost(b) == 1) {
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
			int pageCount = (int) Math.ceil(postCount / (double) DalableOptions.getBoardPostPerPage());
			int start = (page - 1) * DalableOptions.getBoardPostPerPage() + 1;
			int end = page * DalableOptions.getBoardPostPerPage();

			BoardSelector bSel = new BoardSelector(search, start, end);

			List<Board> posts = ss.getMapper(BoardMapper.class).getAllPost(bSel);
			req.setAttribute("posts", posts);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("page", page);
		} catch (Exception e) {

		}
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
//			String token = req.getParameter("token");
//			String lastSuccessToken = (String)req.getSession().getAttribute("successToken");
//			if (lastSuccessToken != null && token.equals(lastSuccessToken)) {
//				req.setAttribute("result", "글쓰기 실패");
//				return;
//			}

			Member m = (Member) req.getSession().getAttribute("loginMember");
			b.setUser_id(m.getUser_id());
			b.setBoard_content(b.getBoard_content().replace("\r\n", "<br>"));
			if (ss.getMapper(BoardMapper.class).writePost(b) == 1) {
				req.setAttribute("result", "글쓰기 성공");
//				req.getSession().setAttribute("successToken", token);
				allPostCount++;
			}
		} catch (Exception e) {
			req.setAttribute("result", "글쓰기 실패");
		}
	}
}
