package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

public class DataBundle {
	private BigDecimal bundle_no;
	private String bundle_uploader;
	private String bundle_uploaded_filename;
	private String bundle_folder_name;
	private String bundle_data_type;

	public DataBundle() {
		// TODO Auto-generated constructor stub
	}

	public DataBundle(BigDecimal bundle_no, String bundle_uploader, String bundle_uploaded_filename,
			String bundle_folder_name, String bundle_data_type) {
		super();
		this.bundle_no = bundle_no;
		this.bundle_uploader = bundle_uploader;
		this.bundle_uploaded_filename = bundle_uploaded_filename;
		this.bundle_folder_name = bundle_folder_name;
		this.bundle_data_type = bundle_data_type;
	}

	public BigDecimal getBundle_no() {
		return bundle_no;
	}

	public void setBundle_no(BigDecimal bundle_no) {
		this.bundle_no = bundle_no;
	}

	public String getBundle_uploader() {
		return bundle_uploader;
	}

	public void setBundle_uploader(String bundle_uploader) {
		this.bundle_uploader = bundle_uploader;
	}

	public String getBundle_uploaded_filename() {
		return bundle_uploaded_filename;
	}

	public void setBundle_uploaded_filename(String bundle_uploaded_filename) {
		this.bundle_uploaded_filename = bundle_uploaded_filename;
	}

	public String getBundle_folder_name() {
		return bundle_folder_name;
	}

	public void setBundle_folder_name(String bundle_folder_name) {
		this.bundle_folder_name = bundle_folder_name;
	}

	public String getBundle_data_type() {
		return bundle_data_type;
	}

	public void setBundle_data_type(String bundle_data_type) {
		this.bundle_data_type = bundle_data_type;
	}

}
