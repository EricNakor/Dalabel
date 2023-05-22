package com.hiddenlayer.dalabel.wantlabeling;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hiddenlayer.dalabel.fileupload.FileUpload;

@Controller
public class LabelingWantController {
	
	@Autowired
	FileUpload fu;
	
	@RequestMapping(value = "/asd", method=RequestMethod.GET)
	public String regDo(HttpServletRequest req) {
		fu.labellingFileUpload(req);
		return "regLabelling";
	}
}
