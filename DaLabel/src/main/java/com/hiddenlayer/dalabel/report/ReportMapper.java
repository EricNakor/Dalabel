package com.hiddenlayer.dalabel.report;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface ReportMapper {
	
	public abstract int writeReport(Report r);
	
	public abstract List<Report> getReportedData(@Param("project_no") int bundle_no, @Param("username")String username, @Param("report_no")int report_no);
}
