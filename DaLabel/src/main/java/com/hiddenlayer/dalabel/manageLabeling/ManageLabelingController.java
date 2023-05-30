package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hiddenlayer.dalabel.member.MemberDAO;

@Controller
public class ManageLabelingController {

	@Autowired
	private ManageLabelingDAO mlDAO;

	@Autowired
	private MemberDAO mDAO;

	@RequestMapping(value = "/reg.labeling.go", method = RequestMethod.GET)
	public String goRegLabeling(@RequestParam(value = "bundle_name") String bundle_name,
			@RequestParam(value = "bundle_no") BigDecimal bundle_no, HttpServletRequest req) {
		mDAO.isLogined(req);
		req.setAttribute("bundle_name", bundle_name);
		req.setAttribute("bundle_no", bundle_no);
		return "manage_labeling/reg_labeling";
	}

	@RequestMapping(value = "/reg.labeling.do", method = RequestMethod.POST)
	public String doRegLabeling(LabelingProject lp, HttpServletRequest req) {
		mDAO.isLogined(req);
		mlDAO.regLabelingProject(lp, req);
		return "home";
	}

	@RequestMapping(value = "/get.myUpload.labeling", method = RequestMethod.GET)
	public String getManageLabeling(HttpServletRequest req) {
		mlDAO.getMyLabeling(1, req);
		return "manage_labeling/manage_labeling";
	}

	@RequestMapping(value = "/get.detail.myproject", method = RequestMethod.GET)
	public String goDetailProject(HttpServletRequest req) {
		mlDAO.getMyDeatilProject(req);
		return "manage_labeling/manage_detail_labeling";
	}

	@RequestMapping(value = "/update.project.accessLevel", method = RequestMethod.GET)
	public String updateAccessLevel(LabelingProject lp, HttpServletRequest req) {
		mlDAO.updateProjectAccessLevel(lp, req);
		return "home";
	}
}
