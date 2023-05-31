package com.hiddenlayer.dalabel.data;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.manageLabeling.Data;

@Service
public class DataDAO {
	@Autowired
	private SqlSession ss;

	public void getData(int bundle_no, HttpServletRequest req) {
		List<Data> datas = ss.getMapper(DataMapper.class).getData(bundle_no);
		req.setAttribute("datas", datas);
		System.out.println(datas);
	}

	public void deleteData(String data_name) {
		ss.getMapper(DataMapper.class).deleteData(data_name);
	}
}
