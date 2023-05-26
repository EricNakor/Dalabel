package com.hiddenlayer.dalabel.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.member.Member;

@Service
public class BoardDAO {
	public int allPostCount;
	
	@Autowired
	private SqlSession ss;

	public void setAllPostCount() {
		allPostCount = ss.getMapper(BoardMapper.class).getPostCount();
		System.out.println(allPostCount);
	}
	
	public void getAllPost(int page, HttpServletRequest req) {
		try {
			List<Board> posts = ss.getMapper(BoardMapper.class).getAllPost();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
