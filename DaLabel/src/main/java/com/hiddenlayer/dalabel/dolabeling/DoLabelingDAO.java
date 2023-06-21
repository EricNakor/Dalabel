package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.manageBundle.ManageBundleMapper;
import com.hiddenlayer.dalabel.manageLabeling.Data;
import com.hiddenlayer.dalabel.manageLabeling.LabelingProject;
import com.hiddenlayer.dalabel.manageLabeling.ManageLabelingMapper;
import com.hiddenlayer.dalabel.report.Report;
import com.hiddenlayer.dalabel.report.ReportMapper;
import com.hiddenlayer.dalabel.session.ProjectSession;

@Service
public class DoLabelingDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private ProjectSession ps;

	public void start(HttpServletRequest req, LabelingProject lp) {
		if (req.getSession().getAttribute("workingNowNumber") != null) {
			req.getSession().removeAttribute("workingNow");
			ps.pushMissingData(ps.getProjectNoWithUserID((String) req.getSession().getAttribute("loginUserID")),
					(BigDecimal) req.getSession().getAttribute("workingNowNumber"));
			req.getSession().removeAttribute("workingNowNumber");
		}

		ps.putUserIDWithProjectNo((String) req.getSession().getAttribute("loginUserID"), lp.getProject_no());
		req.setAttribute("projectDetailInfo",
				ss.getMapper(ManageLabelingMapper.class).getMyDeatilProject(lp.getProject_no().intValue()));
		String filePath = ss.getMapper(ManageBundleMapper.class).getBundleFilePath(lp.getProject_no().intValue());
		req.setAttribute("filePath", filePath.substring(0, filePath.length() - 4));
	}

	public String nextDataName(HttpServletRequest req, LabelData ld) {
		String userid = (String) req.getSession().getAttribute("loginUserID");
		// 조건식 수정해야할 수 있음. AJAX가 들어오는것에 따라 처리해야하기 때문에.
		Data d = null;
		int flag = 0;
		if (userid.equals(ld.getWorked_by())) {
			if (ps.getProjectNoWithUserID(userid) != null && req.getSession().getAttribute("workingNow") != null
					&& req.getSession().getAttribute("workingNow").equals(ld.getData_no())) {
				ss.getMapper(DataDoLabelingMapper.class).addLabelData(ld);
				flag = 1;
			}
			if (ps.getProjectNoWithUserID(userid) != null
					&& (req.getSession().getAttribute("workingNow") == null || flag == 1)) {
				d = ps.getNextData(userid);
			}

		}
		if (d == null) {
			return (String) req.getSession().getAttribute("workingNow");
		} else {
			req.getSession().setAttribute("workingNow", d.getData_name());
			req.getSession().setAttribute("workingNowNumber", d.getData_where());
			return d.getData_name();
		}
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
			req.getSession().setAttribute("joinProjectCount", ss.getMapper(DataDoLabelingMapper.class)
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

	// start는 project number. 프로젝트 고유넘버 기준으로 그것보다 작은걸 getnum개만큼 가져옴.
	public ArrayList<SearchResultDoLabelingList> show(HttpServletRequest req, int start, int getnum) {
		if (start == -1) {
			start = Integer.MAX_VALUE;
		}
		return ss.getMapper(DataDoLabelingMapper.class).findAccessableDoList(
				(String) req.getSession().getAttribute("loginUserID"),
				new BigDecimal((Integer) req.getSession().getAttribute("loginUserRating")), start, getnum);
	}

	// data report

	public int writeReport(Report r, HttpServletRequest req) {
		try {
			System.out.println("신고try");
//			String token = req.getParameter("token");
//			String lastSuccessToken = (String) req.getSession().getAttribute("successToken");
//			if (lastSuccessToken != null && token.equals(lastSuccessToken)) {
//				req.setAttribute("result", "글쓰기 실패 새로고침");
//				return 0;
//			}

			String user = (String) req.getSession().getAttribute("loginUserID");
			r.setReport_by(user);
			r.setReport_content(r.getReport_content().replace("\r\n", "<br>"));

			req.setAttribute("result", "글쓰기 성공");
//			req.getSession().setAttribute("successToken", token);
			return ss.getMapper(ReportMapper.class).writeReport(r);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("신고catch");
			req.setAttribute("result", "글쓰기 실패");
			return 0;
		}
	}
}
