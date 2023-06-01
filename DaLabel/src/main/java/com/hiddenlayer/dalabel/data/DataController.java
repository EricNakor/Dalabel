package com.hiddenlayer.dalabel.data;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DataController {
	@Autowired
	private DataDAO dDAO;

	@RequestMapping(value = "/get.needlogin.bundle.data", method = RequestMethod.GET)
	public String getDataInBundle(@RequestParam(value = "bundle_no") int bundle_no, HttpServletRequest req) {
		dDAO.getData(bundle_no, req);
		return "bundle/bundleData";
	}

	@RequestMapping(value = "/delete.needlogin.data", method = RequestMethod.GET)
	public String deleteData(@RequestParam(value = "data_name") String data_name,
			@RequestParam(value = "bundle_no") int bundle_no, HttpServletRequest req) {
		dDAO.deleteData(data_name);
		dDAO.getData(bundle_no, req);
		return "bundle/bundleData";
	}
}
