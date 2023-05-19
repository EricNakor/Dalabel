
package com.hiddenlayer.dalabel.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;

	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String goLogin(Member m, HttpServletRequest req) {
		mDAO.isLogined(req);
		req.setAttribute("contentPage", "home.jsp");
		return "member/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String memberLogin(Member m, HttpServletRequest req) {
		mDAO.login(m, req);
		mDAO.isLogined(req);
		req.setAttribute("contentPage", "home.jsp");
		return "home";
	}

	@RequestMapping(value = "/member.logout", method = RequestMethod.GET)
	public String memberLogout(HttpServletRequest req) {
		mDAO.isLogined(req);
		mDAO.logout(req);
		req.setAttribute("contentPage", "home.jsp");
		return "home";
	}

	@RequestMapping(value = "/member.join.go", method = RequestMethod.GET)
	public String goJoin(HttpServletRequest req) {
		req.setAttribute("contentPage", "home.jsp");
		return "member/join";
	}

	@RequestMapping(value = "/member.join.do", method = RequestMethod.POST)
	public String memberJoin(Member m, HttpServletRequest req) {
		mDAO.joinMember(m, req);
		req.setAttribute("contentPage", "home.jsp");
		return "home";
	}

	@RequestMapping(value = "/member.delete", method = RequestMethod.POST)
	public String memberDelete(HttpServletRequest req) {
		mDAO.isLogined(req);
		mDAO.deleteMember(req);
		req.setAttribute("contentPage", "home.jsp");
		return "home";
	}

	@RequestMapping(value = "/member.info", method = RequestMethod.GET)
	public String memberInfo(HttpServletRequest req) {
		mDAO.isLogined(req);
		mDAO.info(req);
		return "member/info";
	}

	@RequestMapping(value = "/member.update.go", method = RequestMethod.GET)
	public String goUpdate(HttpServletRequest req) {
		mDAO.isLogined(req);
		mDAO.info(req);
		return "member/update";
	}

	@RequestMapping(value = "/member.update.do", method = RequestMethod.POST)
	public String memberUpdate(HttpServletRequest req, Member m) {
		mDAO.isLogined(req);
		mDAO.update(m, req);
		return "home";
	}

	@RequestMapping(value = "/try.upload", method = RequestMethod.GET)
	public String profile(HttpServletRequest req) {
		mDAO.isLogined(req);
		return "upload";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String updateProfile(HttpServletRequest req) {
		mDAO.isLogined(req);
		mDAO.updateProfile(req);
		return "member/info";
	}
}
