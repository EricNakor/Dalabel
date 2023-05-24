package com.hiddenlayer.dalabel;

import org.springframework.stereotype.Service;

// servlet-context.xml로 이주할것

@Service
public class PageOption {
	private int dataBundlePerPage;
	private int manageLabelingPerPage;
	public PageOption() {
		dataBundlePerPage = 5;
		manageLabelingPerPage = 5;
	}

	public int getDataBundlePerPage() {
		return dataBundlePerPage;
	}

	public void setDataBundlePerPage(int dataBundlePerPage) {
		this.dataBundlePerPage = dataBundlePerPage;
	}

	public int getManageLabelingPerPage() {
		return manageLabelingPerPage;
	}

	public void setManageLabelingPerPage(int manageLabelingPerPage) {
		this.manageLabelingPerPage = manageLabelingPerPage;
	}

	public PageOption(int dataBundlePerPage, int manageLabelingPerPage) {
		super();
		this.dataBundlePerPage = dataBundlePerPage;
		this.manageLabelingPerPage = manageLabelingPerPage;
	}
}

