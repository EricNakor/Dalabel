package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManageLabelingDAO {
	// 등록 - 데이터 선택해서 오픈하기.
	@Autowired
	private SqlSession ss;

	public void regLabelingProject(LabelingProject lp, HttpServletRequest req, BigDecimal bundle_no) {
		lp.setProject_requestor((String) req.getSession().getAttribute("loginUserID"));
		lp.setProject_bundle_no(bundle_no);
		ss.getMapper(ManageLabelingMapper.class).regLabelingProject(lp);
	}
	// 프로젝트 권한설정 관리
	// 정산시작하기
	// 참여인원 관리 - 조회, 킥, 수락, 거부

}
