package com.hiddenlayer.dalabel.session;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;


public class SessionConfig implements HttpSessionListener {
	@Autowired
	UserLoginSession uls;
	
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		String userid = (String) se.getSession().getAttribute("loginUserID");
		try {
			uls.removeUserIDWithSessionID(userid);			
		} catch (Exception e) {
		}
		try {
			uls.removeUserIDWithProjectNo(userid);			
		} catch (Exception e) {
		}

	}
}
