package com.hiddenlayer.dalabel.manageBundle;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hiddenlayer.dalabel.data.DataDAO;
import com.hiddenlayer.dalabel.manageLabeling.DataBundle;

@Controller
public class ManageBundleController {

	@Autowired
	private ManageBundleDAO mbDAO;

	@RequestMapping(value = "/upload.needlogin.bundle.go", method = RequestMethod.GET)
	public String goRegBundle(HttpServletRequest req) {
		req.setAttribute("link", "upload.needlogin.bundle.do");
		return "upload";
	}

	@RequestMapping(value = "/upload.needlogin.bundle.do", method = RequestMethod.POST)
	public String doRegBundle(HttpServletRequest req, DataBundle db, MultipartHttpServletRequest multiFile) {
		mbDAO.uploadBundle(db, req, multiFile);
		return "close";
	}


	@RequestMapping(value = "/get.needlogin.my.bundle", method = RequestMethod.GET)
	public String getMyBundle(HttpServletRequest req) {
		mbDAO.getMyBundle(1, req);
		req.setAttribute("contentPage", "bundle/manage_bundle.jsp");
		return "index";
	}

	@RequestMapping(value = "/bundle.needlogin.page.change", method = RequestMethod.GET)
	public String snsPageChange(@RequestParam(value = "page") int page, HttpServletRequest req) {
		mbDAO.getMyBundle(page, req);
		req.setAttribute("contentPage", "bundle/manage_bundle.jsp");
		return "index";
	}

	@RequestMapping(value = "/delete.needlogin.bundle", method = RequestMethod.POST)
	public String deleteBundle(@RequestParam(value = "bundle_no") int bundle_no, HttpServletRequest req) {
		mbDAO.deleteBundle(bundle_no, req);
		mbDAO.getMyBundle(1, req);
		req.setAttribute("contentPage", "bundle/manage_bundle.jsp");
		return "index";
	}

	@RequestMapping(value = "/update.needlogin.folder.name", method = RequestMethod.GET)
	public String updateBundleFolderName(DataBundle db, HttpServletRequest req, @RequestParam(value = "bundle_no") int bundle_no,
			@RequestParam(value = "bundle_folder_name") String bundle_folder_name) {
		mbDAO.updateBundleFolderName(db);
		req.setAttribute("data_where", bundle_no);
		req.setAttribute("bundle_folder_name", bundle_folder_name);
		req.setAttribute("contentPage", "bundle/bundleData.jsp");
		return "index";
	}
}
