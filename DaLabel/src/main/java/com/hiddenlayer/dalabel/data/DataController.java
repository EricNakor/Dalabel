package com.hiddenlayer.dalabel.data;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hiddenlayer.dalabel.manageLabeling.Data;

@Controller
public class DataController {
	@Autowired
	private DataDAO dDAO;

	@RequestMapping(value = "/bundle.needlogin.data.go", method = RequestMethod.GET)
	public String goManageData(@RequestParam(value = "bundle_no") int bundle_no,
			@RequestParam(value = "bundle_folder_name") String bundle_folder_name, HttpServletRequest req) {
		req.setAttribute("data_where", bundle_no);
		req.setAttribute("bundle_folder_name", bundle_folder_name);
		req.setAttribute("contentPage", "bundle/bundleData.jsp");
		return "index";
	}

	@RequestMapping(value = "/get.needlogin.bundle.data", method = RequestMethod.GET)
	public String getDataInBundle(@RequestParam(value = "bundle_folder_name") String bundle_folder_name, Data data,
			HttpServletRequest req) {
		dDAO.getData(bundle_folder_name, data, req);
		req.setAttribute("data_where", data.getData_where());
		req.setAttribute("bundle_folder_name", bundle_folder_name);
		req.setAttribute("contentPage", "bundle/bundleData.jsp");
		return "index";
	}

	@RequestMapping(value = "/delete.needlogin.data", method = RequestMethod.GET)
	public String deleteData(@RequestParam(value = "bundle_folder_name") String bundle_folder_name, Data data,
			HttpServletRequest req) {
		dDAO.deleteData(data.getData_name());
		dDAO.getData(bundle_folder_name, data, req);
		req.setAttribute("data_where", data.getData_where());
		req.setAttribute("bundle_folder_name", bundle_folder_name);
		req.setAttribute("contentPage", "bundle/bundleData.jsp");
		return "index";
	}
}
