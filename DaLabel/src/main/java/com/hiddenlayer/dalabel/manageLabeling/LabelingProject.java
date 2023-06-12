package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

public class LabelingProject {
	private BigDecimal project_no;
	private String project_title;
	private String project_requestor;
	private BigDecimal project_access_level;
	private String project_guide;
	private BigDecimal project_how;
	private String project_category;
	private char project_progress;
	private BigDecimal project_bundle_no;

	public LabelingProject() {
		// TODO Auto-generated constructor stub
	}

	public LabelingProject(BigDecimal project_no, String project_title, String project_requestor,
			BigDecimal project_access_level, String project_guide, BigDecimal project_how, String project_category,
			char project_progress, BigDecimal project_bundle_no) {
		super();
		this.project_no = project_no;
		this.project_title = project_title;
		this.project_requestor = project_requestor;
		this.project_access_level = project_access_level;
		this.project_guide = project_guide;
		this.project_how = project_how;
		this.project_category = project_category;
		this.project_progress = project_progress;
		this.project_bundle_no = project_bundle_no;
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

	public BigDecimal getProject_access_level() {
		return project_access_level;
	}

	public void setProject_access_level(BigDecimal project_access_level) {
		this.project_access_level = project_access_level;
	}

	public String getProject_guide() {
		return project_guide;
	}

	public void setProject_guide(String project_guide) {
		this.project_guide = project_guide;
	}

	public BigDecimal getProject_how() {
		return project_how;
	}

	public void setProject_how(BigDecimal project_how) {
		this.project_how = project_how;
	}

	public String getProject_category() {
		return project_category;
	}

	public void setProject_category(String project_category) {
		this.project_category = project_category;
	}

	public char getProject_progress() {
		return project_progress;
	}

	public void setProject_progress(char project_progress) {
		this.project_progress = project_progress;
	}

	public BigDecimal getProject_bundle_no() {
		return project_bundle_no;
	}

	public void setProject_bundle_no(BigDecimal project_bundle_no) {
		this.project_bundle_no = project_bundle_no;
	}

}
