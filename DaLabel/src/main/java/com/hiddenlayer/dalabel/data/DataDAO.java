package com.hiddenlayer.dalabel.data;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.manageLabeling.Data;

@Service
public class DataDAO {
	@Autowired
	private SqlSession ss;

	public void getData(String bundle_folder_name, Data data, HttpServletRequest req) {
		String d = ss.getMapper(DataMapper.class).getData(data);
		req.setAttribute("dataName", d);
		req.setAttribute("bundle_folder_name", bundle_folder_name);
	}

	public void deleteData(String data_name) {
		ss.getMapper(DataMapper.class).deleteData(data_name);
	}
	public ArrayList<Data> getReportedData(int data_where) {
		return (ArrayList<Data>) ss.getMapper(DataMapper.class).getReportedData(data_where); 
	}
}
