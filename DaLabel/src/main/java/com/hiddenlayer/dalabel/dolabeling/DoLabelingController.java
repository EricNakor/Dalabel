package com.hiddenlayer.dalabel.dolabeling;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DoLabelingController {
	
	@Autowired
	private DoLabelingDAO dlDAO;
	
//	라벨링 시작시 호출.
	@RequestMapping(value = "/doLabeling.start", method = RequestMethod.GET)
	public String start(Locale locale, Model model) {
		
		return "home";
	}
	
//	라벨링중 다음 데이타 부르기용도. AJAX로 호출됨. 토큰을 이용한 보안설정 고려할것. 세션종료시 토큰무효화하도록 토큰설계.
	@RequestMapping(value = "/doLabeling.next", method = RequestMethod.POST)
	public String nextData(Locale locale, Model model) {
		
		return "home";
	}
	
//	라벨링 종료버튼 누를시 호출됨.
	@RequestMapping(value = "/doLabeling.done", method = RequestMethod.GET)
	public String end(Locale locale, Model model) {

		
		return "home";
	}
	
//	라벨링 마이페이지. join버튼 누른 것들과 정산 등이 떠야함.
	@RequestMapping(value = "/doLabeling.mypage", method = RequestMethod.GET)
	public String getMypage(Locale locale, Model model) {
		
		return "home";
	}

//	라벨링 할거 찾기위해 라벨링 목록을 보면 보여야함.
	@RequestMapping(value = "/doLabeling.find", method = RequestMethod.GET)
	public String find(Locale locale, Model model) {
		
		return "home";
	}
	
//	라벨링 하겠다고 참여하기 버튼을 누른경우 호출됨.
	@RequestMapping(value = "/doLabeling.askjoin", method = RequestMethod.GET)
	public String askjoin(Locale locale, Model model) {

		
		return "home";
	}
	
}
