package com.hiddenlayer.dalabel.session;

import java.math.BigDecimal;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;


public class SessionConfig implements HttpSessionListener {
	@Autowired
	UserLoginSession uls;
	@Autowired
	ProjectSession ps;
	
	
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
		if(se.getSession().getAttribute("workingNowNumber")!=null) {
			ps.pushMissingData(ps.getProjectNoWithUserID(userid), (BigDecimal)se.getSession().getAttribute("workingNowNumber"));
		}
		try {
			ps.removeUserIDWithProjectNo(userid);			
		} catch (Exception e) {
		}

	}
}
