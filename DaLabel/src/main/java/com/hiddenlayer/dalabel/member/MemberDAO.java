
package com.hiddenlayer.dalabel.member;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.fileupload.FileUpload;

@Service
public class MemberDAO {
	private HashMap<String, String> sessionmap;
	private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyyMMdd");
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private FileUpload fu;

	
	public void deleteSessionFromSessionMap(String userid) {
		sessionmap.remove(userid);			

	}
	
	public MemberDAO() {
		super();
		sessionmap = new HashMap<String, String>();
	}

	public void login(Member m, HttpServletRequest req) {
		System.out.println(sessionmap);
		try {
			ArrayList<Member> member = ss.getMapper(AccountMapper.class).getUserinfo(m);
			Member user = member.get(0);
			if (user != null) {
				if (user.getUser_pw().equals(m.getUser_pw())) {
					req.getSession().setAttribute("loginUserID", user.getUser_id());
					req.getSession().setAttribute("loginUserIMG",
							(user.getUser_img() != null) ? user.getUser_img() : "defaultprofile.jpg");
					req.setAttribute("loginResult", "로그인 성공");
					sessionmap.put(user.getUser_id(), req.getSession().getId());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void logout(HttpServletRequest req) {
		System.out.println(sessionmap);
		sessionmap.remove((String) req.getSession().getAttribute("loginUserID"));
		req.getSession().removeAttribute("loginUserID");
		req.getSession().removeAttribute("loginUserIMG");
	}

	public boolean isLogined(HttpServletRequest req) {
		String userid = (String) req.getSession().getAttribute("loginUserID");
		if (userid == null || sessionmap.get(userid) == null) {
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
		try {
			String year = req.getParameter("year");
			int month = Integer.parseInt(req.getParameter("month"));
			int day = Integer.parseInt(req.getParameter("day"));
			String birth = String.format("%s%02d%02d", year, month, day);
			m.setUser_birth(SDF.parse(birth));
			ss.getMapper(AccountMapper.class).addMember(m);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void info(HttpServletRequest req) {
		try {
			Member m = new Member();
			m.setUser_id((String) req.getSession().getAttribute("loginUserID"));
			ArrayList<Member> userinfo = ss.getMapper(AccountMapper.class).getUserinfo(m);
			m = userinfo.get(0);
			req.setAttribute("memberInfo", m);			
		} catch (Exception e) {
		}
	}

	public void update(Member m, HttpServletRequest req) {
		// 컨트롤러에서 세션 검사 + PW 입력받아서 확인 후, 유효하면 수정페이지로 -> 거기서 수정하기 누르면 최종 수정됨
		// 이 Method는 최종 수정단계를 구현함
		try {
			m.setUser_id((String) req.getSession().getAttribute("loginUserID"));
			m.setUser_birth(SDF.parse(req.getParameter("birth")));
			ss.getMapper(AccountMapper.class).changeMember(m);
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
	}

	public void deleteMember(HttpServletRequest req) {
		Member m = new Member();
		m.setUser_id((String) req.getSession().getAttribute("loginUserID"));
		if (ss.getMapper(AccountMapper.class).deleteMember(m) == 1) {
			logout(req);
		}
	}

	public void updateProfile(HttpServletRequest req) {
		String fileName = fu.profileUpload(req);
		System.out.println(fileName);
		String userID = (String) req.getSession().getAttribute("loginUserID");
		String userIMG = (String) req.getSession().getAttribute("loginUserIMG");
		if (!("defaultprofile.jpg").equals(userIMG)) {
			fu.deleteProfileIMG(userIMG);
		}
		req.getSession().setAttribute("loginUserIMG", fileName);
		Member m = new Member();
		m.setUser_id(userID);
		m.setUser_img(fileName);
		ss.getMapper(AccountMapper.class).changeMemberIMG(m);
	}
	

	public int idCheck(String user_id) {
		int result = ss.getMapper(AccountMapper.class).checkId(user_id);
		return result;
	}
}
