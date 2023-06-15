
package com.hiddenlayer.dalabel.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;

	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String goLogin(Member m, HttpServletRequest req) {
		req.setAttribute("contentPage", "member/login.jsp");
		return "index";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String memberLogin(Member m, HttpServletRequest req) {
		mDAO.login(m, req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.needlogin.logout", method = RequestMethod.GET)
	public String memberLogout(HttpServletRequest req) {
		mDAO.logout(req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.join.go", method = RequestMethod.GET)
	public String goJoin(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.join.do", method = RequestMethod.POST)
	public String memberJoin(Member m, HttpServletRequest req) {
		mDAO.joinMember(m, req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.needlogin.delete", method = RequestMethod.POST)
	public String memberDelete(HttpServletRequest req) {
		mDAO.deleteMember(req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.needlogin.info", method = RequestMethod.GET)
	public String memberInfo(HttpServletRequest req) {
		mDAO.info(req);
		req.setAttribute("contentPage", "member/info.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.needlogin.update.go", method = RequestMethod.POST)
	public String goUpdate(HttpServletRequest req) {
		mDAO.info(req);
		req.setAttribute("contentPage", "member/update.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.needlogin.update.do", method = RequestMethod.POST)
	public String memberUpdate(HttpServletRequest req, Member m) {
		mDAO.update(m, req);
		mDAO.info(req);
		req.setAttribute("contentPage", "member/info.jsp");
		return "index";
	}

	@RequestMapping(value = "/try.needlogin.upload", method = RequestMethod.GET)
	public String profile(HttpServletRequest req) {
		req.setAttribute("link", "profile.needlogin.upload");
		return "upload";
	}

	@RequestMapping(value = "/profile.needlogin.upload", method = RequestMethod.POST)
	public String updateProfile(HttpServletRequest req, MultipartHttpServletRequest multiFile) {
		mDAO.updateProfile(req, multiFile);
		return "close";
	}
	
	@RequestMapping(value = "/member.idcheck", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody int idCheck(@RequestParam("user_id") String user_id) {
		int result = mDAO.idCheck(user_id);
		return result;
	}

}
