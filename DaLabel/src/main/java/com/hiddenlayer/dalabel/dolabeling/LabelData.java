package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;

public class LabelData {
	private BigDecimal data_bundle;
	private BigDecimal data_no;
	private String worked_by;
	private String label;

	public LabelData() {
		// TODO Auto-generated constructor stub
	}

	public LabelData(BigDecimal data_bundle, BigDecimal data_no, String worked_by, String label) {
		super();
		this.data_bundle = data_bundle;
		this.data_no = data_no;
		this.worked_by = worked_by;
		this.label = label;
	}

	public BigDecimal getData_bundle() {
		return data_bundle;
	}

	public void setData_bundle(BigDecimal data_bundle) {
		this.data_bundle = data_bundle;
	}

	public BigDecimal getData_no() {
		return data_no;
	}

	public void setData_no(BigDecimal data_no) {
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