package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;

public class SearchResultDoLabelingList {
	private BigDecimal project_no;
	private String project_title;
	private String project_requestor;
	private BigDecimal project_how;
	private char dolabel_state;
	
	public SearchResultDoLabelingList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchResultDoLabelingList(BigDecimal project_no, String project_title, String project_requestor,
			BigDecimal project_how, char dolabel_state) {
		super();
		this.project_no = project_no;
		this.project_title = project_title;
		this.project_requestor = project_requestor;
		this.project_how = project_how;
		this.dolabel_state = dolabel_state;
	}

	public BigDecimal getProject_no() {
		return project_no;
	}
	public void setProject_no(BigDecimal project_no) {
		this.project_no = project_no;
	}
	public String getProject_title() {
		return project_title;
	}
	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}
	public String getProject_requestor() {
		return project_requestor;
	}
	public void setProject_requestor(String project_requestor) {
		this.project_requestor = project_requestor;
	}
	public BigDecimal getProject_how() {
		return project_how;
	}
	public void setProject_how(BigDecimal project_how) {
		this.project_how = project_how;
	}
	public char getDolabel_state() {
		return dolabel_state;
	}
	public void setDolabel_state(char dolabel_state) {
		this.dolabel_state = dolabel_state;
	}
	
	
}
