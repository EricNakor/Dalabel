package com.hiddenlayer.dalabel.session;

import java.math.BigDecimal;
import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public class ProjectSession {
	private HashMap<BigDecimal, ProjectInfo> projectInfos;
	private HashMap<String, BigDecimal> userIDtoProjectNo;
	
	public ProjectSession() {
		super();
		userIDtoProjectNo = new HashMap<String, BigDecimal>();
		projectInfos = new HashMap<BigDecimal, ProjectInfo>();
	}
	public void removeUserIDWithProjectNo(String userid) {
		userIDtoProjectNo.remove(userid);
	}
	
	public void putUserIDWithProjectNo(String userid, BigDecimal projectNo) {
		userIDtoProjectNo.put(userid, projectNo);
	}
	
	public BigDecimal getProjectNoWithUserID(String userid) {
		return userIDtoProjectNo.get(userid);
	}
	
	
	public void createDoLabeling(BigDecimal project_no, BigDecimal data_file_count) {
		ProjectInfo info = new ProjectInfo();
		info.setNext_todo_no(new BigDecimal(1));
		info.setData_count(data_file_count);
		info.setCycle_no(new BigDecimal(0));
		projectInfos.put(project_no,info);
	}
	
	public void terminateDoLabeling(BigDecimal project_no) {
		projectInfos.remove(project_no);
	}
	
	public void pushMissingData(BigDecimal project_no, BigDecimal data_no) {
		projectInfos.get(project_no).putRest_data(data_no);
	}
	public BigDecimal getMissingData(BigDecimal project_no) {
		return projectInfos.get(project_no).getRest_data();
	}
	
}
