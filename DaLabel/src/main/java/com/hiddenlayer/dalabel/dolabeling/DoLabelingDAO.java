package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public String nextData(HttpServletRequest req, LabelData ld) {
		if (req.getSession().getAttribute("loginUserID").equals(ld.getWorked_by())) {
			if (req.getSession().getAttribute("workingNow") != null
					&& req.getAttribute("workingNow").equals(ld.getData_no())) {
				ss.getMapper(DataDoLabelingMapper.class).addLabelData(ld);
			}
			
//			여기서 sql 쓸것. 다음 데이터 가져오기.
		}
		return null;
	}

	public void end(HttpServletRequest req) {
		String userid = (String) req.getSession().getAttribute("loginUserID");
		BigDecimal workingnow = (BigDecimal)req.getSession().getAttribute("workingNow");
		if(workingnow!=null) {
			ps.pushMissingData(ps.getProjectNoWithUserID(userid), workingnow);
			req.getSession().removeAttribute("workingNow");
		}
		ps.removeUserIDWithProjectNo(userid);
	}
	

	public String getMypage(HttpServletRequest req) {
		
		return "home";
	}

	public String find(HttpServletRequest req) {

		return "home";
	}

	public String askjoin(HttpServletRequest req) {

		return "home";
	}

}
