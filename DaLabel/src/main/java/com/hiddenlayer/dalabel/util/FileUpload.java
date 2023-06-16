package com.hiddenlayer.dalabel.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	private String fileUploadMr(String path, MultipartHttpServletRequest multiFile) throws Exception{
		File uploadFolder = new File(path);
		OutputStream os = null;
		try {
			if (!uploadFolder.exists()) {
				uploadFolder.mkdir();
			}
			MultipartFile file = multiFile.getFile("fileName");
			String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			fileName= fileName.substring(fileName.indexOf("_") + 1, fileName.length());
			String uploadPath = path+"\\"+fileName;
			os = new FileOutputStream(new File(uploadPath));
			byte[] bytes = file.getBytes();
			os.write(bytes);
			return fileName;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			os.close();
		}
	}
	
	public String profileUpload(HttpServletRequest req,MultipartHttpServletRequest multiFile) {
		if (profileIMGrealpath == null) {
			profileIMGrealpath = req.getSession().getServletContext().getRealPath("resources/image/profile/");
		}
		try {
			return fileUploadMr(profileIMGrealpath, multiFile);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String[] bundleUpload(HttpServletRequest req,MultipartHttpServletRequest multiFile) {
		String userID = (String) req.getSession().getAttribute("loginUserID");
		if (dataRealPath == null) {
			dataRealPath = req.getSession().getServletContext().getRealPath("resources/data/");
		}
		String path = dataRealPath + userID;
		String returnName = null;
		try {
			returnName=fileUploadMr(path, multiFile);
			return new String[] { returnName, multiFile.getParameter("bundle_data_type"),
					multiFile.getParameter("bundle_descript") };
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return null;
		}

	}
}
