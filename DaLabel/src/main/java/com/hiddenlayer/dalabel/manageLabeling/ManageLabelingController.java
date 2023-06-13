package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hiddenlayer.dalabel.dolabeling.LabelDoList;

@Controller
public class ManageLabelingController {

	@Autowired
	private ManageLabelingDAO mlDAO;

	@RequestMapping(value = "/reg.needlogin.labeling.go", method = RequestMethod.GET)
	public String goRegLabeling(@RequestParam(value = "bundle_name") String bundle_name,
			@RequestParam(value = "bundle_no") BigDecimal bundle_no, HttpServletRequest req) {
		req.setAttribute("bundle_name", bundle_name);
		req.setAttribute("bundle_no", bundle_no);
		req.setAttribute("contentPage", "manage_labeling/reg_labeling.jsp");
		return "index";
	}

	@RequestMapping(value = "/reg.needlogin.labeling.do", method = RequestMethod.POST)
	public String doRegLabeling(LabelingProject lp, HttpServletRequest req) {
		mlDAO.regLabelingProject(lp, req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/get.needlogin.myUpload.labeling", method = RequestMethod.GET)
	public String getManageLabeling(HttpServletRequest req) {
		mlDAO.getMyLabeling(1, req);
		req.setAttribute("contentPage", "manage_labeling/manage_labeling.jsp");
		return "index";
	}

	@RequestMapping(value = "project.needlogin.page.change", method = RequestMethod.GET)
	public String pageChangeProject(@RequestParam(value = "page") int page, HttpServletRequest req) {
		mlDAO.getMyLabeling(page, req);
		req.setAttribute("contentPage", "manage_labeling/manage_labeling.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/get.needlogin.detail.myproject", method = RequestMethod.GET)
	public String goDetailProject(HttpServletRequest req) {
		mlDAO.getMyDeatilProject(req);
		req.setAttribute("contentPage", "manage_labeling/manage_detail_labeling.jsp");
		return "index";
	}

	@RequestMapping(value = "/update.needlogin.project.accessLevel", method = RequestMethod.GET)
	public String updateAccessLevel(LabelingProject lp, HttpServletRequest req) {
		mlDAO.updateProjectAccessLevel(lp, req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/manage.labeling.user", method = RequestMethod.GET)
	public String getLabelingUser(@RequestParam(value = "project_no") int project_no, HttpServletRequest req) {
		mlDAO.select(project_no, req);
		req.setAttribute("contentPage", "manage_labeling/manage_labeling_user.jsp");
		return "index";
	}

	@RequestMapping(value = "/update.user.access", method = RequestMethod.GET)
	public String updateUserLevel(LabelDoList ld, HttpServletRequest req) {
		mlDAO.changeUserAccess(ld, req); // change
		mlDAO.select(ld.getDolabel_project_no().intValue(), req);
		req.setAttribute("contentPage", "manage_labeling/manage_labeling_user.jsp");
		return "index";
	}
	
}
