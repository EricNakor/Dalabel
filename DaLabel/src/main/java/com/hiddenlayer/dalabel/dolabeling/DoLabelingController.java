package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiddenlayer.dalabel.manageLabeling.LabelingProject;

@Controller
public class DoLabelingController {
	
	@Autowired
	private DoLabelingDAO dlDAO;
	
//	라벨링 시작시 호출.
	@RequestMapping(value = "/doLabeling.needlogin.start", method = RequestMethod.GET)
	public String start(HttpServletRequest req, LabelingProject lp) {
		dlDAO.start(req,lp);
		return "home";
	}
	
//	라벨링중 다음 데이타 부르기용도. AJAX로 호출됨. 토큰을 이용한 보안설정 고려할것. 세션종료시 토큰무효화하도록 토큰설계.

	@RequestMapping(value = "/doLabeling.needlogin.next", method = RequestMethod.GET)
	public @ResponseBody String nextData(HttpServletRequest req, LabelData ld) {
		return dlDAO.nextDataName(req, ld);
	}
	
//	라벨링 종료버튼 누를시 호출됨.
	@RequestMapping(value = "/doLabeling.needlogin.done", method = RequestMethod.GET)
	public String end(HttpServletRequest req) {
		return "home";
	}
	
//	라벨링 마이페이지. ajax로 상세리스트 조회하며, 여기서는 단순 페이지 리턴 + 총 데이터 수량만 조회한다.
	@RequestMapping(value = "/doLabeling.needlogin.mypage", method = RequestMethod.GET)
	public String getMypage(HttpServletRequest req) {
		dlDAO.getMypageCount(req);
		return "home";
	}

//	페이지에 보여줄 데이터를 리턴한다.
	@RequestMapping(value = "/doLabeling.needlogin.mypage.find", method = RequestMethod.GET,  produces = "application/json; charset=utf-8")
	public @ResponseBody ArrayList<LabelDoList> find(HttpServletRequest req, @RequestParam(value="start") int start, @RequestParam(value="end")int end) {
		return dlDAO.find(req, start, end);
	}
	
//	참여가능페이지를 리턴한다.
	@RequestMapping(value = "/doLabeling.needlogin.showable", method = RequestMethod.GET)
	public String showAble(HttpServletRequest req) {
		return "labeling/show_labelable_projects";
	}
	
	// 참여 가능한 프로젝트를 일정갯수 리턴한다. 이미 참여했다면 status까지 필요하다.
	@RequestMapping(value = "/doLabeling.needlogin.show", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody ArrayList<SearchResultDoLabelingList> show(HttpServletRequest req,  @RequestParam(value="start") int start, @RequestParam(value="end")int end) {
		return dlDAO.show(req, start, end);
	}
	
//	라벨링 하겠다고 참여하기 버튼을 누른경우 호출됨.
	@RequestMapping(value = "/doLabeling.needlogin.askjoin", method = RequestMethod.GET)
	public String askjoin(HttpServletRequest req, @RequestParam(value="project_no")int project_no) {
		dlDAO.askjoin(req, new BigDecimal(project_no));
		return "home";
	}
	
}
