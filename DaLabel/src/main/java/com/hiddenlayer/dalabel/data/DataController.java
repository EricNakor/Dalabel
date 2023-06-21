package com.hiddenlayer.dalabel.data;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiddenlayer.dalabel.manageLabeling.Data;
import com.hiddenlayer.dalabel.manageLabeling.DataBundle;
import com.hiddenlayer.dalabel.report.Report;

@Controller
public class DataController {
	@Autowired
	private DataDAO dDAO;

	@RequestMapping(value = "/bundle.needlogin.data.go", method = RequestMethod.GET)
	public String goManageData(HttpServletRequest req, Data data, DataBundle db) {
		req.setAttribute("bundle", db);
		req.setAttribute("data", data);
		req.setAttribute("contentPage", "bundle/bundleData.jsp");
		return "index";
	}

	@RequestMapping(value = "/get.needlogin.bundle.data", method = RequestMethod.GET)
	public String getDataInBundle(Data data, HttpServletRequest req, DataBundle db) {
		dDAO.getData(db, data, req);
		req.setAttribute("contentPage", "bundle/bundleData.jsp");
		return "index";
	}

	@RequestMapping(value = "/delete.needlogin.data", method = RequestMethod.GET)
	public String deleteData(DataBundle db, Data data, HttpServletRequest req) {
		dDAO.deleteData(db, data, req);
		req.setAttribute("contentPage", "bundle/bundleData.jsp");
		return "index";
	}

	@RequestMapping(value = "/data.needlogin.get.reported", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Report> getReportedData(@RequestParam(value = "bundle_no") int bundle_no,
			HttpServletRequest req, @RequestParam(value="report_no") int report_no) {
		return dDAO.getReportedData(req ,bundle_no, report_no);
	}
}
