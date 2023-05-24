package com.hiddenlayer.dalabel.session;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public class UserLoginSession {
	private HashMap<String, String> hs;
	
	
	public UserLoginSession() {
		super();
		hs = new HashMap<String, String>();
	}
	
	public void remove(String userid) {
		hs.remove(userid);
	}
	
	public void put(String userid, String sessionid) {
		hs.put(userid, sessionid);
	}
	
	public String get(String userid) {
		return hs.get(userid);
	}
}
