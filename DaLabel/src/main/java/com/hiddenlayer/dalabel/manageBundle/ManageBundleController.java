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
	private ManageBundleDAO mbDAO;

	@RequestMapping(value = "/upload.needlogin.bundle.go", method = RequestMethod.GET)
	public String goRegBundle(HttpServletRequest req) {
		mDAO.isLogined(req);
		return "upload";
	}

	@RequestMapping(value = "/upload.needlogin.bundle.do", method = RequestMethod.POST)
	public String doRegBundle(HttpServletRequest req, DataBundle db) {
		mDAO.isLogined(req);
		mbDAO.uploadBundle(db, req);
		return "home";
	}


	@RequestMapping(value = "/get.needlogin.my.bundle", method = RequestMethod.GET)
	public String getMyBundle(HttpServletRequest req) {
		mDAO.isLogined(req);
		mbDAO.getMyBundle(1, req);
		return "bundle/manage_bundle";
	}

	@RequestMapping(value = "/bundle.needlogin.page.change", method = RequestMethod.GET)
	public String snsPageChange(@RequestParam(value = "page") int page, HttpServletRequest req) {
		mDAO.isLogined(req);
		mbDAO.getMyBundle(page, req);
		return "bundle/manage_bundle";
	}

	@RequestMapping(value = "/delete.needlogin.bundle", method = RequestMethod.POST)
	public String deleteBundle(@RequestParam(value = "bundle_no") int bundle_no, HttpServletRequest req) {
		mDAO.isLogined(req);
		mbDAO.deleteBundle(bundle_no, req);
		return "home";
	}

	@RequestMapping(value = "/update.needlogin.file.name", method = RequestMethod.GET)
	public String updateBundleFolderName(DataBundle db) {
		mbDAO.updateBundleFolderName(db);
		return "home";
	}
}
