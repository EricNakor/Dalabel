package com.hiddenlayer.dalabel.report;

import java.math.BigDecimal;
import java.util.Date;

public class Report {
	private BigDecimal report_no;
	private String report_by;
	private String report_content;
	private String report_data;
	private BigDecimal report_project_no;
	private Date report_date;

	public Report() {
		// TODO Auto-generated constructor stub
	}

	public Report(BigDecimal report_no, String report_by, String report_content, String report_data,
			BigDecimal report_project_no, Date report_date) {
		super();
		this.report_no = report_no;
		this.report_by = report_by;
		this.report_content = report_content;
		this.report_data = report_data;
		this.report_project_no = report_project_no;
		this.report_date = report_date;
	}

	public BigDecimal getReport_no() {
		return report_no;
	}

	public void setReport_no(BigDecimal report_no) {
		this.report_no = report_no;
	}

	public String getReport_by() {
		return report_by;
	}

	public void setReport_by(String report_by) {
		this.report_by = report_by;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_data() {
		return report_data;
	}

	public void setReport_data(String report_data) {
		this.report_data = report_data;
	}

	public BigDecimal getReport_project_no() {
		return report_project_no;
	}

	public void setReport_project_no(BigDecimal report_project_no) {
		this.report_project_no = report_project_no;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
}
