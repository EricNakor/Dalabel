package com.hiddenlayer.dalabel.session;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public class UserLoginSession {
	private HashMap<String, String> userIDtoSessionID;
	
	
	public UserLoginSession() {
		super();
		userIDtoSessionID = new HashMap<String, String>();
	}
	
	public void removeUserIDWithSessionID(String userid) {
		userIDtoSessionID.remove(userid);
	}
	
	public void putUserIDWithSessionID(String userid, String sessionid) {
		userIDtoSessionID.put(userid, sessionid);
	}
	
	public String getSessionIDWithUserID(String userid) {
		return userIDtoSessionID.get(userid);
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return userIDtoSessionID.toString();
	}
}
