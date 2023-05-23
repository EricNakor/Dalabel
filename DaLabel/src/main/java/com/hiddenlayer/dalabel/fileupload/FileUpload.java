package com.hiddenlayer.dalabel.fileupload;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class FileUpload {
	private String profileIMGrealpath;

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

	public String labellingFileUpload(HttpServletRequest req) {
		String route = req.getSession().getServletContext().getRealPath("resources/image/labeling_bundle/"); // 절대경로
//		MultipartRequest mr = null;
//		try {
//			mr = new MultipartRequest(req, route, 2 * 1024 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
//		} catch (Exception e) {
//			e.printStackTrace(); // 파일 용량 안 맞으면 error
//			return;
//		}
		ZipInputStream zis = null;
		try { // 해당 경로에 .zip이 있어야 하는데, 즉, 톰캣 가상서버에 zip파일을 먼저 올린다음에 푸는 행위를 시작해야 함
			zis = new ZipInputStream(new BufferedInputStream(new FileInputStream(new File(route, "Desktop.zip")))); // 경로에
																													// 있는
																													// .zip
																													// 파일을
																													// 선택
			ZipEntry ze = null;
			BufferedOutputStream bos = null;
			int len = 0, idx = 1;
			while ((ze = zis.getNextEntry()) != null) { // unzip 해야하는 다음 파일이 존재한다면(!=null) 실행
				if (ze.getName().endsWith(".jpg")) {
					bos = new BufferedOutputStream(new FileOutputStream(route + idx++ + ".jpg")); // 해당 경로에, idx(숫자)++
																									// 이름으로 된 .jpg를 생성
					while ((len = zis.read()) != -1) {
						bos.write(len); // unzip 완료
					}
					zis.closeEntry(); // close후 다음 파일을 찾아서 떠남 -> 다음 파일이 존재할 경우 while문의 조건식으로 다시 돌아감
				}
			}
			bos.close(); // while문이 정상적으로 끝나면, 다 쓴 상태일테니 닫아줌
		} catch (Exception e) {
			return null;
		} finally {
			try {
				zis.close(); // catch로 빠져도 닫음
			} catch (Exception e) {
			}
		}
		return null;
	}
}
