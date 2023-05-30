package com.hiddenlayer.dalabel.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class FileUpload {
	private String profileIMGrealpath;
	private String dataRealPath;
	
	

	public String getDataRealPath(String loginUser) {
		return dataRealPath + "\\" + loginUser + "\\";
	}

	public boolean deleteProfileIMG(String fileName) {
		return new File(profileIMGrealpath + fileName).delete();
	}

	public String profileUpload(HttpServletRequest req) {
		if (profileIMGrealpath == null) {
			profileIMGrealpath = req.getSession().getServletContext().getRealPath("resources/image/profile/");
		}
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, profileIMGrealpath, 50 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			// 파일 용량 안맞으면
			e.printStackTrace();
			return null;
		}
		try {
			String fileName = mr.getFilesystemName("fileName");
			return fileName;
		} catch (Exception e) {
			return null;
		}
	}

	public String[] bundleUpload(HttpServletRequest req) {
		MultipartRequest mr = null;
		String userID = (String) req.getSession().getAttribute("loginUserID");
		if(dataRealPath==null) {
			dataRealPath = req.getSession().getServletContext().getRealPath("resources/data/");
		}
		String path = dataRealPath + userID;
		File folder = new File(path);

		if (!folder.exists()) {
			try {
				folder.mkdir();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			mr = new MultipartRequest(req, path, 5 * 1024 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			return new String[] {mr.getFilesystemName("fileName"),mr.getParameter("bundle_data_type")};
		} catch (Exception e) {
			e.printStackTrace(); // 파일 용량 안 맞으면 error
			System.out.println("error" + mr.getFilesystemName("fileName"));
			return new String[] {mr.getFilesystemName("fileName"),mr.getParameter("bundle_data_type")};
		}

	}
}
