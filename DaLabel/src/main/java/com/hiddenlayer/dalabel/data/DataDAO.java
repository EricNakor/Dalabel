package com.hiddenlayer.dalabel.data;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.manageLabeling.Data;
import com.hiddenlayer.dalabel.manageLabeling.DataBundle;

@Service
public class DataDAO {
	@Autowired
	private SqlSession ss;

	public void getData(DataBundle db, Data data, HttpServletRequest req) {
		Data result =ss.getMapper(DataMapper.class).getData(data);
		req.setAttribute("data_name", result.getData_name());
		req.setAttribute("data_activation", result.getData_activation());
		req.setAttribute("bundle", db);
		req.setAttribute("data", data);
	}

	public void deleteData(DataBundle db, Data data, HttpServletRequest req) {
		ss.getMapper(DataMapper.class).deleteData(data.getData_name());
		req.setAttribute("bundle", db);
		req.setAttribute("data", data);
	}
	public ArrayList<Data> getReportedData(int data_where) {
		return (ArrayList<Data>) ss.getMapper(DataMapper.class).getReportedData(data_where); 
	}
}
