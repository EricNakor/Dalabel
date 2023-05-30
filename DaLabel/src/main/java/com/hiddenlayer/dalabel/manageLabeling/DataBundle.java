package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

public class DataBundle {
	private BigDecimal bundle_no;
	private String bundle_uploader;
	private String bundle_uploaded_filename;
	private String bundle_data_type;
	private String bundle_descript;
	private BigDecimal bundle_unzip;
	private String bundle_folder_name;
	private BigDecimal bundle_file_count;

	public DataBundle() {
		// TODO Auto-generated constructor stub
		this.bundle_data_type = "0";
		this.bundle_descript = "설명예시";
	}

	public DataBundle(BigDecimal bundle_no, BigDecimal bundle_file_count) {
		// TODO Auto-generated constructor stub
		this.bundle_no = bundle_no;
		this.bundle_file_count = bundle_file_count;
		this.bundle_data_type = "0";
		this.bundle_descript = "설명예시";

	}

	public DataBundle(BigDecimal bundle_no, String bundle_uploader, String bundle_uploaded_filename,
			String bundle_folder_name, String bundle_data_type, String bundle_descript, BigDecimal bundle_unzip,
			BigDecimal bundle_file_count) {
		super();
		this.bundle_no = bundle_no;
		this.bundle_uploader = bundle_uploader;
		this.bundle_uploaded_filename = bundle_uploaded_filename;
//		this.bundle_data_type = bundle_data_type;
//		this.bundle_descript = bundle_descript;
		this.bundle_folder_name = bundle_folder_name;
		this.bundle_unzip = bundle_unzip;
		this.bundle_file_count = bundle_file_count;
		this.bundle_data_type = "0";
		this.bundle_descript = "설명예시";
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

	public String getBundle_data_type() {
		return bundle_data_type;
	}

	public void setBundle_data_type(String bundle_data_type) {
		this.bundle_data_type = bundle_data_type;
	}

	public String getBundle_descript() {
		return bundle_descript;
	}

	public void setBundle_descript(String bundle_descript) {
		this.bundle_descript = bundle_descript;
	}

	public BigDecimal getBundle_unzip() {
		return bundle_unzip;
	}

	public void setBundle_unzip(BigDecimal bundle_unzip) {
		this.bundle_unzip = bundle_unzip;
	}

	public BigDecimal getBundle_file_count() {
		return bundle_file_count;
	}

	public void setBundle_file_count(BigDecimal bundle_file_count) {
		this.bundle_file_count = bundle_file_count;
	}

	public String getBundle_folder_name() {
		return bundle_folder_name;
	}

	public void setBundle_folder_name(String bundle_folder_name) {
		this.bundle_folder_name = bundle_folder_name;
	}

}
