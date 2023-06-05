package com.hiddenlayer.dalabel.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.Queue;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.data.DataMapper;
import com.hiddenlayer.dalabel.manageBundle.ManageBundleMapper;
import com.hiddenlayer.dalabel.manageLabeling.Data;
import com.hiddenlayer.dalabel.manageLabeling.DataBundle;

@Service
public class UnZipperThread extends Thread {
	@Autowired
	private SqlSession ss;

	private Queue<UnZipInfos> fileInfos;
	private UnZipInfos fileInfo;
	private String fileEnd;
	private File file;
	private ZipEntry ze;
	private String fileName;
	private String folderName;
	private ZipInputStream zis;
	private String endtag;
	private String innerFileName;
	private int idx;
	private BigDecimal bundleNo;
	private int status_running;

	public UnZipperThread() {
		super();
		fileInfos = new LinkedList<UnZipInfos>();
		// TODO Auto-generated constructor stub
	}

	public void addTodo(UnZipInfos info) {
		fileInfos.add(info);
		if (status_running == 0) {
			start();
			status_running = 1;
		}

	}

	@Override
	public void run() {
		while (true) {
			if (this.fileInfos.size() > 0) {
				fileInfo = fileInfos.poll();
				fileName = fileInfo.getFileName();
				endtag = fileInfo.getEndtag();
				bundleNo = fileInfo.getBundleNumber();
				folderName = fileName.substring(0, fileName.length() - 4);
				try {
					File zipFile = new File(fileName);
					zis = new ZipInputStream(new BufferedInputStream(new FileInputStream(zipFile)));
					makeFolder(folderName);
					idx = 0;

					while ((ze = zis.getNextEntry()) != null) {
						innerFileName = ze.getName();
						fileEnd = innerFileName.substring(innerFileName.lastIndexOf('.') + 1);
						if (!endtag.equals(fileEnd)) {
							continue;
						}
						idx++;
						file = new File(folderName, idx + "." + fileEnd);
						if (!ze.isDirectory()) {
							try {
								createFile(file, zis);
								ss.getMapper(DataMapper.class).insertData(new Data(idx + "." + fileEnd, bundleNo));
							} catch (Throwable e) {
								e.printStackTrace();
							}
						}
					}
					ss.getMapper(ManageBundleMapper.class)
							.updateBundleAfterUnzip(new DataBundle(bundleNo, new BigDecimal(idx)));

				} catch (Exception e) {
					e.printStackTrace();
					continue;
				} finally {
					try {
						zis.close(); // catch로 빠져도 닫음
					} catch (Exception e) {
					}
				}
			} else {
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}

	private void makeFolder(String folderName) {
		File f = new File(folderName);
		if (!f.exists()) {
			try {
				f.mkdir();
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
		}
		return;
	}

	private void createFile(File file, ZipInputStream zis) throws Throwable {
		FileOutputStream fos = null;
		try {

			fos = new FileOutputStream(file);
			byte[] buffer = new byte[256];
			int size = 0;
			while ((size = zis.read(buffer)) > 0) {
				fos.write(buffer, 0, size);
			}
		} catch (Throwable e) {
			throw e;
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}

			}

		}

	}
}