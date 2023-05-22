package com.hiddenlayer.dalabel.dolabeling;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Service
public class DoLabelingDAO {
	@Autowired
	private SqlSession ss;

	public String start(HttpServletRequest req) {
		
		return "home";
	}

	public String nextData(HttpServletRequest req) {

		return "home";
	}

	public String end(HttpServletRequest req) {

		return "home";
	}


	public String getMypage(Locale locale, Model model) {

		return "home";
	}


	public String find(HttpServletRequest req) {

		return "home";
	}


	public String askjoin(HttpServletRequest req) {

		return "home";
	}

}
