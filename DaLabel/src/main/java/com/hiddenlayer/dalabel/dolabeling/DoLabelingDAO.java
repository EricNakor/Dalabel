package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;
import java.util.ArrayList;

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

	public void askjoin(HttpServletRequest req, LabelDoList ld) {
		if (req.getSession().getAttribute("joinProjectCount")!=null) {
			req.getSession().setAttribute("joinProjectCount",(Integer)req.getSession().getAttribute("joinProjectCount")+1);
		}
		
		ss.getMapper(DataDoLabelingMapper.class).addLabelDoList(ld);
		// 권한 체크하기 + 만약 부족한 권한에 accepted 조건만 만족할 경우 수락대기로 넣기 + 그게 아니라면 바로 허용하기.
	}

	public ArrayList<LabelDoList> show(HttpServletRequest req, int start, int end) {
		return null;
	}
}
