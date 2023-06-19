package com.hiddenlayer.dalabel.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hiddenlayer.dalabel.member.MemberDAO;
import com.hiddenlayer.dalabel.session.UserLoginSession;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private UserLoginSession sessionmap;
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse response, Object handler)
			throws Exception {
	
		String userid = (String) req.getSession().getAttribute("loginUserID");
		if (userid == null || sessionmap.getSessionIDWithUserID(userid) == null) {
			response.sendRedirect("login.go");
			return false;
		}
		if(!req.getSession().getId().equals(sessionmap.getSessionIDWithUserID(userid))) {
			mDAO.logout(req);
			response.sendRedirect("login.go");
			return false;
		}
		return super.preHandle(req, response, handler);
	}
}
