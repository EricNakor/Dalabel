package com.hiddenlayer.dalabel.member;

import java.io.File;
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
		sessionmap.remove((String)req.getSession().getAttribute("loginUserID"));
		req.getSession().setAttribute("loginUserID", null);
	}
	
	public boolean isLogined(HttpServletRequest req) {
		String userid = (String)req.getSession().getAttribute("loginUserID");
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
	
	public void joinMember(HttpServletRequest req) {
		
	}
	public void withdraw(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginUserID");
			if(ss.getMapper(AccountMapper.class).withdraw(m) == 1) {
				req.setAttribute("result", "탈퇴성공");
				
				String path = req.getSession().getServletContext().getRealPath("resources/profile");
				String file = URLDecoder.decode(m.getUser_img(), "utf-8");
				new File(path + "/" + file).delete();
				
			} else {
				req.setAttribute("result", "탈퇴실패");				
			}			
		} catch (Exception e) {
			req.setAttribute("result", "탈퇴실패");				
		}
	
}
