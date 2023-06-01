package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hiddenlayer.dalabel.manageLabeling.Data;
import com.hiddenlayer.dalabel.manageLabeling.LabelingProject;
import com.hiddenlayer.dalabel.session.ProjectSession;

@Service
public class DoLabelingDAO {
	@Autowired
	private SqlSession ss;

	@Autowired
	private ProjectSession ps;

	public void start(HttpServletRequest req, LabelingProject lp) {
		ps.putUserIDWithProjectNo((String) req.getSession().getAttribute("loginUserID"), lp.getProject_no());
	}

	public String nextDataName(HttpServletRequest req, LabelData ld) {
		String userid = (String) req.getSession().getAttribute("loginUserID");
		if (userid.equals(ld.getWorked_by())) {
			if (req.getSession().getAttribute("workingNow") != null
					&& req.getSession().getAttribute("workingNow").equals(ld.getData_no())) {
				ss.getMapper(DataDoLabelingMapper.class).addLabelData(ld);
			}
			if (ps.getProjectNoWithUserID(userid) != null) {
				Data d = ps.getNextData(userid);
				req.getSession().setAttribute("workingNow", new BigDecimal(d.getData_name().split("[.]")[0]));
				return d.getData_name();
			}
		}
		return null;
	}

	public void end(HttpServletRequest req) {
		String userid = (String) req.getSession().getAttribute("loginUserID");
		BigDecimal workingnow = (BigDecimal) req.getSession().getAttribute("workingNow");
		if (workingnow != null) {
			ps.pushMissingData(ps.getProjectNoWithUserID(userid), workingnow);
			req.getSession().removeAttribute("workingNow");
		}
		ps.removeUserIDWithProjectNo(userid);
	}

	public void getMypageCount(HttpServletRequest req) {
		if (req.getSession().getAttribute("joinProjectCount") == null) {
			req.setAttribute("joinProjectCount", ss.getMapper(DataDoLabelingMapper.class)
					.getJoinProjectCount((String) req.getSession().getAttribute("loginUserID")));
		}

	}

	public ArrayList<LabelDoList> find(HttpServletRequest req, int start, int end) {
		return ss.getMapper(DataDoLabelingMapper.class)
				.findLabelDoList((String) req.getSession().getAttribute("loginUserID"), start, end);
	}

	public void askjoin(HttpServletRequest req, BigDecimal project_no) {
		if (ps.isExist(project_no)) {
			int access_level = ps.getAccessLevel(project_no);
			int user_rate = (Integer) req.getSession().getAttribute("loginUserRating");
			if (access_level >= 16) {
				if ((access_level & user_rate) == ((access_level - 16))) {
					addJoinPermitted(req, project_no);
				} else if (((access_level & user_rate) | 8) == access_level - 16) {
					addJoinNeedPermission(req, project_no);
				}
			} else {
				if ((access_level & user_rate) > 0) {
					addJoinPermitted(req, project_no);
				} else if ((access_level & 8) > 0) {
					addJoinNeedPermission(req, project_no);
				}
			}
		}

	}

	private void addJoinNeedPermission(HttpServletRequest req, BigDecimal project_no) {
		ss.getMapper(DataDoLabelingMapper.class).addLabelDoList(new LabelDoList(
				(String) req.getSession().getAttribute("loginUserID"), project_no, new BigDecimal(0), null));
		incJoinPageCount(req);
	}

	private void addJoinPermitted(HttpServletRequest req, BigDecimal project_no) {
		ss.getMapper(DataDoLabelingMapper.class).addLabelDoList(new LabelDoList(
				(String) req.getSession().getAttribute("loginUserID"), project_no, new BigDecimal(1), null));
		incJoinPageCount(req);
	}

	private void incJoinPageCount(HttpServletRequest req) {
		if (req.getSession().getAttribute("joinProjectCount") != null) {
			req.getSession().setAttribute("joinProjectCount",
					(Integer) req.getSession().getAttribute("joinProjectCount") + 1);
		}
	}

	public ArrayList<LabelDoList> show(HttpServletRequest req, int start, int end) {
		return ss.getMapper(DataDoLabelingMapper.class)
				.findLabelDoList((String) req.getSession().getAttribute("loginUserID"), start, end);
	}
}
