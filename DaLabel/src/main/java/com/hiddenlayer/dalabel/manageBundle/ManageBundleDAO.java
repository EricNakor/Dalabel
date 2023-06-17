package com.hiddenlayer.dalabel.manageBundle;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hiddenlayer.dalabel.manageLabeling.DataBundle;
import com.hiddenlayer.dalabel.util.FileUpload;
import com.hiddenlayer.dalabel.util.PageOption;
import com.hiddenlayer.dalabel.util.UnZipInfos;
import com.hiddenlayer.dalabel.util.UnZipperThread;

@Service
public class ManageBundleDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private FileUpload fu;

	@Autowired
	private UnZipperThread uzt;

	@Autowired
	private PageOption po;

	private int bundleCount;

	public void uploadBundle(DataBundle db, HttpServletRequest req, MultipartHttpServletRequest multiFile) {
		String loginUser = (String) req.getSession().getAttribute("loginUserID");
		db.setBundle_uploader(loginUser);
		String[] names = fu.bundleUpload(req, multiFile);
		db.setBundle_uploaded_filename(names[0]);
		db.setBundle_data_type(names[1]);
		db.setBundle_descript(names[2]);
		String foldername = db.getBundle_uploaded_filename().substring(names[0].indexOf("_") + 1, names[0].length());
		db.setBundle_folder_name(foldername.substring(0, foldername.lastIndexOf(".")));
		ss.getMapper(ManageBundleMapper.class).regLabelingBundle(db);

		uzt.addTodo(new UnZipInfos(fu.getDataRealPath(loginUser) + names[0], names[1],
				new BigDecimal(ss.getMapper(ManageBundleMapper.class).getBundleNumber(loginUser, names[0]))));
		req.setAttribute("rtVal", db.getBundle_uploaded_filename());
		req.getSession().setAttribute("bundleCount", bundleCount + 1);
	}

	public void getMyBundle(int page, HttpServletRequest req) {
		String user = (String) req.getSession().getAttribute("loginUserID");
		if (req.getSession().getAttribute("bundleCount") == null) {
			bundleCount = ss.getMapper(ManageBundleMapper.class).getAllBundleCount(user);
			req.getSession().setAttribute("bundleCount", bundleCount);
		}

		int bundlePageCount = (int) Math
				.ceil((Integer) req.getSession().getAttribute("bundleCount") / (double) po.getDataBundlePerPage());
		int start = (page - 1) * po.getDataBundlePerPage() + 1;
		int end = page * po.getDataBundlePerPage();
		ManageSelector ms = new ManageSelector(user, start, end);
		List<DataBundle> bundles = ss.getMapper(ManageBundleMapper.class).getAllBundle(ms);

		req.setAttribute("bundles", bundles);
		req.setAttribute("bundlePageCount", bundlePageCount);
		req.setAttribute("page", page);
	}

	public void deleteBundle(int bundle_no, HttpServletRequest req) {
		ss.getMapper(ManageBundleMapper.class).deleteBundle(bundle_no);
		req.getSession().setAttribute("bundleCount", bundleCount + -1);
	}

}
