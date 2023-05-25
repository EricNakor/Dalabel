package com.hiddenlayer.dalabel.manageLabeling;

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
	public String goRegLabeling(@RequestParam(value = "bundle_name") String bundle_name, HttpServletRequest req) {
		mDAO.isLogined(req);
		mlDAO.regLabelingProject(bundle_name , req);
		return "manage_labeling/reg_labeling";
	}
}
