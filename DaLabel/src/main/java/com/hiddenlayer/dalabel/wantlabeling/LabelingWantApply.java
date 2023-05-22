package com.hiddenlayer.dalabel.wantlabeling;

import java.math.BigDecimal;

public class LabelingWantApply {
	private String want_user;
	private BigDecimal want_what;
	private boolean want_avail;

	public LabelingWantApply() {
		// TODO Auto-generated constructor stub
	}

	public LabelingWantApply(String want_user, BigDecimal want_what, boolean want_avail) {
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

	public boolean isWant_avail() {
		return want_avail;
	}

	public void setWant_avail(boolean want_avail) {
		this.want_avail = want_avail;
	}
}
