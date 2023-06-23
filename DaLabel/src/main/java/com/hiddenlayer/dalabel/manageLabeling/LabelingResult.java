package com.hiddenlayer.dalabel.manageLabeling;

public class LabelingResult {
	private String data_no;
	private String label_result;
	public LabelingResult(String data_no, String label_result) {
		super();
		this.data_no = data_no;
		this.label_result = label_result;
	}
	public LabelingResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getData_no() {
		return data_no;
	}
	public void setData_no(String data_no) {
		this.data_no = data_no;
	}
	public String getLabel_result() {
		return label_result;
	}
	public void setLabel_result(String label_result) {
		this.label_result = label_result;
	}
	
	
}
