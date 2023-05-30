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

import com.hiddenlayer.dalabel.session.UserLoginSession;

@Service
public class DoLabelingDAO {
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private UserLoginSession uls;

	public void start(HttpServletRequest req) {
		
		String userid = (String)req.getSession().getAttribute("loginUserID");
		uls.putUserIDWithProjectNo(userid, null);
		
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
