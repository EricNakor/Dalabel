package com.hiddenlayer.dalabel.manageBundle;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hiddenlayer.dalabel.manageLabeling.DataBundle;
import com.hiddenlayer.dalabel.member.MemberDAO;

@Controller
public class ManageBundleController {

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private ManageBundleDAO mlDAO;

	@RequestMapping(value = "/upload.bundle.go", method = RequestMethod.GET)
	public String goRegBundle(HttpServletRequest req) {
		mDAO.isLogined(req);
		return "upload";
	}

	@RequestMapping(value = "/upload.bundle.do", method = RequestMethod.POST)
	public String doRegBundle(HttpServletRequest req, DataBundle db) {
		mDAO.isLogined(req);
		mlDAO.uploadBundle(db, req);
		return "home";
	}

	@RequestMapping(value = "/get.my.bundle", method = RequestMethod.GET)
	public String getMyBundle(HttpServletRequest req) {
		mDAO.isLogined(req);
		mlDAO.getMyBundle(1, req);
		return "bundle/manage_bundle";
	}

	@RequestMapping(value = "/bundle.page.change", method = RequestMethod.GET)
	public String snsPageChange(@RequestParam(value = "page") int page, HttpServletRequest req) {
		mDAO.isLogined(req);
		mlDAO.getMyBundle(page, req);
		return "bundle/manage_bundle";
	}
	
	@RequestMapping(value = "/reg.bundle.go", method = RequestMethod.GET)
	public String goRegLabeling(@RequestParam(value = "bundle") String bundle, HttpServletRequest req) {
		mDAO.isLogined(req);
		return "manage_labeling/reg_labeling";
	}

}
