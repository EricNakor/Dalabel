package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;

public class LabelDoList {
	private String dolabel_user;
	private BigDecimal dolabel_project_no;
	private BigDecimal dolabel_state;
	private BigDecimal dolabel_score;

	public LabelDoList() {
		// TODO Auto-generated constructor stub
	}

	public LabelDoList(String dolabel_user, BigDecimal dolabel_project_no, BigDecimal dolabel_state,
			BigDecimal dolabel_score) {
		super();
		this.dolabel_user = dolabel_user;
		this.dolabel_project_no = dolabel_project_no;
		this.dolabel_state = dolabel_state;
		this.dolabel_score = dolabel_score;
	}

	public String getDolabel_user() {
		return dolabel_user;
	}

	public void setDolabel_user(String dolabel_user) {
		this.dolabel_user = dolabel_user;
	}

	public BigDecimal getDolabel_project_no() {
		return dolabel_project_no;
	}

	public void setDolabel_project_no(BigDecimal dolabel_project_no) {
		this.dolabel_project_no = dolabel_project_no;
	}

	public BigDecimal getDolabel_state() {
		return dolabel_state;
	}

	public void setDolabel_state(BigDecimal dolabel_state) {
		this.dolabel_state = dolabel_state;
	}

	public BigDecimal getDolabel_score() {
		return dolabel_score;
	}

	public void setDolabel_score(BigDecimal dolabel_score) {
		this.dolabel_score = dolabel_score;
	}

	
}
