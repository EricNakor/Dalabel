package com.hiddenlayer.dalabel.session;

import java.math.BigDecimal;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.data.DataMapper;
import com.hiddenlayer.dalabel.manageLabeling.Data;

@Service
public class ProjectSession {
	private HashMap<BigDecimal, ProjectInfo> projectInfos;
	private HashMap<String, BigDecimal> userIDtoProjectNo;
	
	@Autowired
	private SqlSession ss;
	
	public ProjectSession() {
		super();
		userIDtoProjectNo = new HashMap<String, BigDecimal>();
		projectInfos = new HashMap<BigDecimal, ProjectInfo>();
	}
	
	@Override
	public String toString() {
		String rt = "{";
		for(BigDecimal kv:projectInfos.keySet()) {
			rt += kv+"-";
		}
		return rt+"}";
	}
	
	public Data getNextData(String userid) {
		// 매퍼로 가져올것.
		BigDecimal project_no = getProjectNoWithUserID(userid);
		ProjectInfo pif = projectInfos.get(project_no);
		if (pif==null) {
			return null;
		}
		BigDecimal data_no = null;
		Data rtData = null;
		while(true) {
			if((data_no = pif.getRest_data())==null) {
				data_no = pif.getNext_todo_no();
				rtData = ss.getMapper(DataMapper.class).getNextData(project_no, data_no);
				if(rtData!=null) {
					return rtData;
				}
			}else {
				rtData=ss.getMapper(DataMapper.class).getNextData(project_no, data_no);
				if(rtData!=null) {
					return rtData;
				}
			}
			if(pif.getCycle_no().intValue()==15) {
				terminateDoLabeling(project_no);
				return null;
			}
			
		}
	}
	
	public boolean isExist(BigDecimal project_no) {
		if (projectInfos.get(project_no)==null) {
			return false;
		}
		return true;
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
	
	public void createDoLabeling(BigDecimal project_no, BigDecimal data_file_count, BigDecimal project_access_level) {
		ProjectInfo info = new ProjectInfo();
		info.setNext_todo_no(new BigDecimal(1));
		info.setData_count(data_file_count);
		info.setCycle_no(new BigDecimal(0));
		info.setAccess_level(project_access_level.intValue());
		projectInfos.put(project_no,info);
	}
	
	public void changeAccessLevel(BigDecimal project_no, BigDecimal project_access_level) {
		projectInfos.get(project_no).setAccess_level(project_access_level.intValue());
	}
	
	public int getAccessLevel(BigDecimal project_no) {
		return projectInfos.get(project_no).getAccess_level();
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
