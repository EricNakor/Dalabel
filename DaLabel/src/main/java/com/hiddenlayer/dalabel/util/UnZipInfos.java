package com.hiddenlayer.dalabel.util;

import java.math.BigDecimal;

public class UnZipInfos {
	private String fileName;
	private String endtag;
	private BigDecimal bundleNumber;
	public UnZipInfos(String fileName, String endtag, BigDecimal bundleNumber) {
		super();
		this.fileName = fileName;
		this.endtag = endtag;
		this.bundleNumber = bundleNumber;
	}
	public UnZipInfos() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getEndtag() {
		return endtag;
	}
	public void setEndtag(String endtag) {
		this.endtag = endtag;
	}
	public BigDecimal getBundleNumber() {
		return bundleNumber;
	}
	public void setBundleNumber(BigDecimal bundleNumber) {
		this.bundleNumber = bundleNumber;
	}
	
}
