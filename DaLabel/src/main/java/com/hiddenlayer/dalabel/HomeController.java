package com.hiddenlayer.dalabel;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		model.addAttribute("serverTime", "Hello world! 한글테스트" );
		
		return "login";
	}
	
	@RequestMapping(value = "/goLabelling", method = RequestMethod.GET)
	public String goLabelling(HttpServletRequest req, HttpServletResponse res) {
		return "labelling/goLabelling";
	}
	
	@RequestMapping(value = "/doLabelling", method = RequestMethod.GET)
	public String doLabelling(HttpServletRequest req, HttpServletResponse res) {
		return "labelling/doLabelling";
	}
}
