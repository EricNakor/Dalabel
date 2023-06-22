package com.hiddenlayer.dalabel.data;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.manageLabeling.Data;
import com.hiddenlayer.dalabel.manageLabeling.DataBundle;
import com.hiddenlayer.dalabel.report.Report;
import com.hiddenlayer.dalabel.report.ReportMapper;

@Service
public class DataDAO {
	@Autowired
	private SqlSession ss;

	public void getData(DataBundle db, Data data, HttpServletRequest req) {
		Data result = ss.getMapper(DataMapper.class).getData(data);
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

//	public ArrayList<Data> getReportData(int data_where) {
//		return (ArrayList<Data>) ss.getMapper(DataMapper.class).getReportedData(data_where); 
//	}

	public ArrayList<Report> getReportedData(HttpServletRequest req, int bundle_no, int report_no) {
		String username = (String)req.getSession().getAttribute("loginUserID");
		return (ArrayList<Report>) ss.getMapper(ReportMapper.class).getReportedData(bundle_no, username,report_no);
	}
}
