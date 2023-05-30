package com.hiddenlayer.dalabel.util;

import org.springframework.stereotype.Service;

// servlet-context.xml로 이주할것

@Service
public class PageOption {
	private int dataBundlePerPage;
	private int manageLabelingPerPage;
	private int projectPerPage;

	public PageOption() {
		dataBundlePerPage = 5;
		manageLabelingPerPage = 5;
		projectPerPage = 5;
	}

	public PageOption(int dataBundlePerPage, int manageLabelingPerPage, int projectPerPage) {
		super();
		this.dataBundlePerPage = dataBundlePerPage;
		this.manageLabelingPerPage = manageLabelingPerPage;
		this.projectPerPage = projectPerPage;
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

	public int getProjectPerPage() {
		return projectPerPage;
	}

	public void setProjectPerPage(int projectPerPage) {
		this.projectPerPage = projectPerPage;
	}

}
