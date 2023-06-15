package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;

public class LabelData {
	private BigDecimal project_no;
	private String data_no;
	private String worked_by;
	private String label;

	public LabelData() {
		// TODO Auto-generated constructor stub
	}

	public LabelData(BigDecimal project_no, String data_no, String worked_by, String label) {
		super();
		this.project_no = project_no;
		this.data_no = data_no;
		this.worked_by = worked_by;
		this.label = label;
	}

	public BigDecimal getProject_no() {
		return project_no;
	}

	public void setProject_no(BigDecimal project_no) {
		this.project_no = project_no;
	}

	public String getData_no() {
		return data_no;
	}

	public void setData_no(String data_no) {
		this.data_no = data_no;
	}

	public String getWorked_by() {
		return worked_by;
	}

	public void setWorked_by(String worked_by) {
		this.worked_by = worked_by;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}


}