package com.hiddenlayer.dalabel.session;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.hiddenlayer.dalabel.member.MemberDAO;


public class SessionConfig implements HttpSessionListener {
	@Autowired
	private MemberDAO mDAO;
	
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		se.getSession().setMaxInactiveInterval(5);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		mDAO.deleteSessionFromSessionMap((String) se.getSession().getAttribute("loginUserID"));			

	}
}
