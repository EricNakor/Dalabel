package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.dolabeling.LabelDoList;
import com.hiddenlayer.dalabel.manageBundle.ManageSelector;
import com.hiddenlayer.dalabel.util.PageOption;

@Service
public class ManageLabelingDAO {
	// 등록 - 데이터 선택해서 오픈하기.
	@Autowired
	private SqlSession ss;

	@Autowired
	private PageOption po;

	public void regLabelingProject(LabelingProject lp, HttpServletRequest req) {
		lp.setProject_requestor((String) req.getSession().getAttribute("loginUserID"));
		ss.getMapper(ManageLabelingMapper.class).regLabelingProject(lp);
	}

	public void getMyLabeling(int page, HttpServletRequest req) {
		String user = (String) req.getSession().getAttribute("loginUserID");
		if (req.getSession().getAttribute("projectCount") == null) {
			req.getSession().setAttribute("projectCount",
					ss.getMapper(ManageLabelingMapper.class).getAllMyProjectCount(user));
		}

		int projectPageCount = (int) Math
				.ceil((Integer) req.getSession().getAttribute("projectCount") / (double) po.getProjectPerPage());
		int start = (page - 1) * po.getProjectPerPage() + 1;
		int end = page * po.getProjectPerPage();
		ManageSelector ms = new ManageSelector(user, start, end);
		List<LabelingProject> projects = ss.getMapper(ManageLabelingMapper.class).getMyLabelingProject(ms);
		req.setAttribute("projects", projects);
		req.setAttribute("projectPageCount", projectPageCount);
		req.setAttribute("page", page);
	}

	public void getMyDeatilProject(HttpServletRequest req) {
		LabelingProject project = ss.getMapper(ManageLabelingMapper.class)
				.getMyDeatilProject(Integer.parseInt(req.getParameter("project_no")));
		req.setAttribute("project", project);
	}
	
	// 프로젝트 권한설정 관리
	public void updateProjectAccessLevel(LabelingProject lp, HttpServletRequest req) {
		ss.getMapper(ManageLabelingMapper.class).updateProjectAccessLevel(lp);
	}
	// 정산시작하기
	// 참여인원 관리 - 조회, 대기, 수락, 거부, 밴, (초대)
	public void select(int no, HttpServletRequest req) {
		req.setAttribute("mlu", ss.getMapper(ManageLabelingMapper.class).selectLabelingUser(no)); // 모든 대기다 명단이 나옴
	}
//	
	public void changeUserAccess(LabelDoList ld, HttpServletRequest req) {
		ss.getMapper(ManageLabelingMapper.class).changeUserAccess(ld); // 수락, 거부, 밴할 때 호출할 함수
	}
}
