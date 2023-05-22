package com.hiddenlayer.dalabel.dolabeling;

public class LabelData {
	private int data_bundle;
	private int data_no;
	private String worked_by;
	private String label;
	public LabelData(int data_bundle, int data_no, String worked_by, String label) {
		super();
		this.data_bundle = data_bundle;
		this.data_no = data_no;
		this.worked_by = worked_by;
		this.label = label;
	}
	public LabelData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getData_bundle() {
		return data_bundle;
	}
	public void setData_bundle(int data_bundle) {
		this.data_bundle = data_bundle;
	}
	public int getData_no() {
		return data_no;
	}
	public void setData_no(int data_no) {
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