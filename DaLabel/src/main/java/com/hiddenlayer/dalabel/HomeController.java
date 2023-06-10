package com.hiddenlayer.dalabel;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hiddenlayer.dalabel.board.BoardDAO;
import com.hiddenlayer.dalabel.member.MemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private BoardDAO bDAO;

	private boolean firstReq;

	public HomeController() {
		firstReq = true;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

//		if (firstReq) {
//			bDAO.setAllPostCount();
//			firstReq = false;
//		}

		model.addAttribute("serverTime", "Hello world! 한글테스트");

		return "home";
	}

}
