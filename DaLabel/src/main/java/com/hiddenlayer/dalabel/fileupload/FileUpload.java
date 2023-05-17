package com.hiddenlayer.dalabel.fileupload;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUpload {
	public String profileUpload(HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/image/profile");
		MultipartRequest mr = null;

		try {
			mr = new MultipartRequest(req, path, 50 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			// 파일 용량 안맞으면
			e.printStackTrace();
			return null;
		}

		try {
			String fileName = mr.getParameter("fileName");
			return fileName;
		} catch (Exception e) {
			// 네트워크 문제로 실패하면 올리던 파일 삭제
			File f = new File(path + "/" + mr.getParameter("fileName"));
			f.delete();
			return null;
		}
	}
	
	public String labellingFileUpload(HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/image/labellingFile");
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(req, path, 2 * 1024 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			// 파일 용량 안맞으면
			e.printStackTrace();
			return null;
		}
		
		try {
			String fileName = mr.getParameter("fileName");
			return fileName;
		} catch (Exception e) {
			// 네트워크 문제로 실패하면 올리던 파일 삭제
			File f = new File(path + "/" + mr.getParameter("fileName"));
			f.delete();
			return null;
		}
	}
}
