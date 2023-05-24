package com.hiddenlayer.dalabel.manageBundle;

public class ManageBundleSelector {
	private String login_user;
	private int start;
	private int end;

	public ManageBundleSelector() {
		// TODO Auto-generated constructor stub
	}

	public ManageBundleSelector(String login_user, int start, int end) {
		super();
		this.login_user = login_user;
		this.start = start;
		this.end = end;
	}

	public String getLogin_user() {
		return login_user;
	}

	public void setLogin_user(String login_user) {
		this.login_user = login_user;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
}
