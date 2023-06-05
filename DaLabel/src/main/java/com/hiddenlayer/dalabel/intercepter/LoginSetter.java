package com.hiddenlayer.dalabel.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginSetter extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse response, Object handler)
			throws Exception {
	
		String userid = (String) req.getSession().getAttribute("loginUserID");
		if(userid==null) {
			req.setAttribute("loginContents", "notLoginStatus");
		}else {
			req.setAttribute("loginContents", "yesLoginStatus");
		}

		return super.preHandle(req, response, handler);
	}
}
