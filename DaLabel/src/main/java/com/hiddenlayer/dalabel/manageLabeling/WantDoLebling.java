package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;
 
public class WantDoLebling {
	private String want_user;
	private BigDecimal want_what;
	private char want_avail;

	public WantDoLebling() {
		// TODO Auto-generated constructor stub
	}
 
	public WantDoLebling(String want_user, BigDecimal want_what, char want_avail) {
		super();
		this.want_user = want_user;
		this.want_what = want_what;
		this.want_avail = want_avail;
	}

	public String getWant_user() {
		return want_user;
	}

	public void setWant_user(String want_user) {
		this.want_user = want_user;
	}

	public BigDecimal getWant_what() {
		return want_what;
	}

	public void setWant_what(BigDecimal want_what) {
		this.want_what = want_what;
	}

	public char getWant_avail() {
		return want_avail;
	}

	public void setWant_avail(char want_avail) {
		this.want_avail = want_avail;
	}

}
