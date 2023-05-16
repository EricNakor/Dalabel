package com.hiddenlayer.dalabel.member;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {

	private HashMap<String, String> sessionmap;

	@Autowired
	private SqlSession ss;

	public MemberDAO() {
		super();
		sessionmap = new HashMap<String, String>();
	}

	public void login(Member m, HttpServletRequest req) {
		try {
			ArrayList<Member> member = ss.getMapper(AccountMapper.class).getUserinfo(m);
			Member user = member.get(0);
			if (user != null) {
				if (user.getUser_pw().equals(m.getUser_pw())) {
					req.getSession().setAttribute("loginUserID", user.getUser_id());
					req.setAttribute("loginResult", "로그인 성공");
					sessionmap.put(user.getUser_id(), req.getSession().getId());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void logout(HttpServletRequest req) {
		sessionmap.remove((String) req.getSession().getAttribute("loginUserID"));
		req.getSession().setAttribute("loginUserID", null);
	}

	public boolean isLogined(HttpServletRequest req) {
		String userid = (String) req.getSession().getAttribute("loginUserID");
		if (userid == null) {
			return false;
		}
		if (sessionmap.get(userid) == null) {
			return false;
		}
		if (req.getSession().getId().equals(sessionmap.get(userid))) {
			return true;
		} else {
			logout(req);
			return false;
		}
	}

	public void joinMember(Member m, HttpServletRequest req) {
		// user_birth는 받아서 넣어야 함 year + month + day
		// user_address도 마찬가지 address1 + address2 + address3 -> 우편번호 + 주소 + 상세주소
		try {
			m.setUser_birth(new SimpleDateFormat("yyyyMMdd")
					.parse(req.getParameter("year") + req.getParameter("month") + req.getParameter("day")));
			m.setUser_address(String.format("%s!%s!%s",
					req.getParameter("address1") + req.getParameter("address2") + req.getParameter("address3")));
			ss.getMapper(AccountMapper.class).addMember(m);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "가입 실패");
		}
	}
}
