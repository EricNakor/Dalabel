package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;

public class LabelDoList {
	private String dolabel_user;
	private BigDecimal dolable_bundle;
	private BigDecimal do_state;
	private BigDecimal labeling_score;

	public LabelDoList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LabelDoList(String dolabel_user, BigDecimal dolable_bundle, BigDecimal do_state,
			BigDecimal labeling_score) {
		super();
		this.dolabel_user = dolabel_user;
		this.dolable_bundle = dolable_bundle;
		this.do_state = do_state;
		this.labeling_score = labeling_score;
	}

	public BigDecimal getDo_state() {
		return do_state;
	}

	public void setDo_state(BigDecimal do_state) {
		this.do_state = do_state;
	}

	public String getDolabel_user() {
		return dolabel_user;
	}

	public void setDolabel_user(String dolabel_user) {
		this.dolabel_user = dolabel_user;
	}

	public BigDecimal getDolable_bundle() {
		return dolable_bundle;
	}

	public void setDolable_bundle(BigDecimal dolable_bundle) {
		this.dolable_bundle = dolable_bundle;
	}

	public BigDecimal getLabeling_score() {
		return labeling_score;
	}

	public void setLabeling_score(BigDecimal labeling_score) {
		this.labeling_score = labeling_score;
	}

	 
	
	
	
}
