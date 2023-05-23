package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

public class DataBundle {
	private BigDecimal bundle_no;
	private String bundle_title;
	private String bundle_requestor;
	private BigDecimal bundle_access;
	private String bundle_guied;
	private BigDecimal bundle_type;
	private String bundle_category;
	private char bundle_state;

	public DataBundle() {
		// TODO Auto-generated constructor stub
	}

	public String getBundle_requestor() {
		return bundle_requestor;
	}

	public void setBundle_requestor(String bundle_requestor) {
		this.bundle_requestor = bundle_requestor;
	}

	public char getBundle_state() {
		return bundle_state;
	}

	public void setBundle_state(char bundle_state) {
		this.bundle_state = bundle_state;
	}

	public DataBundle(BigDecimal bundle_no, String bundle_title, String bundle_requestor, BigDecimal bundle_access,
			String bundle_guied, BigDecimal bundle_type, String bundle_category, char bundle_state) {
		super();
		this.bundle_no = bundle_no;
		this.bundle_title = bundle_title;
		this.bundle_requestor = bundle_requestor;
		this.bundle_access = bundle_access;
		this.bundle_guied = bundle_guied;
		this.bundle_type = bundle_type;
		this.bundle_category = bundle_category;
		this.bundle_state = bundle_state;
	}

	public BigDecimal getBundle_no() {
		return bundle_no;
	}

	public void setBundle_no(BigDecimal bundle_no) {
		this.bundle_no = bundle_no;
	}

	public String getBundle_title() {
		return bundle_title;
	}

	public void setBundle_title(String bundle_title) {
		this.bundle_title = bundle_title;
	}

	public String getBundle_requester() {
		return bundle_requestor;
	}

	public void setBundle_requester(String bundle_requester) {
		this.bundle_requestor = bundle_requester;
	}

	public BigDecimal getBundle_access() {
		return bundle_access;
	}

	public void setBundle_access(BigDecimal bundle_access) {
		this.bundle_access = bundle_access;
	}

	public String getBundle_guied() {
		return bundle_guied;
	}

	public void setBundle_guied(String bundle_guied) {
		this.bundle_guied = bundle_guied;
	}

	public BigDecimal getBundle_type() {
		return bundle_type;
	}

	public void setBundle_type(BigDecimal bundle_type) {
		this.bundle_type = bundle_type;
	}

	public String getBundle_category() {
		return bundle_category;
	}

	public void setBundle_category(String bundle_category) {
		this.bundle_category = bundle_category;
	}
}
