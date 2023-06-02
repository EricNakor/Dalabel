package com.hiddenlayer.dalabel.manageBundle;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public void uploadBundle(DataBundle db, HttpServletRequest req) {
		String loginUser = (String) req.getSession().getAttribute("loginUserID");
		db.setBundle_uploader(loginUser);
		String[] names = fu.bundleUpload(req);
		db.setBundle_uploaded_filename(names[0]);
		db.setBundle_data_type(names[1]);
		db.setBundle_descript(names[2]);
		db.setBundle_folder_name(
				db.getBundle_uploaded_filename().substring(0, db.getBundle_uploaded_filename().lastIndexOf(".")));
		ss.getMapper(ManageBundleMapper.class).regLabelingBundle(db);

		uzt.addTodo(new UnZipInfos(fu.getDataRealPath(loginUser) + names[0], names[1],
				new BigDecimal(ss.getMapper(ManageBundleMapper.class).getBundleNumber(loginUser, names[0]))));
		req.setAttribute("rtVal", db.getBundle_uploaded_filename());
	}

	public void getMyBundle(int page, HttpServletRequest req) {
		String user = (String) req.getSession().getAttribute("loginUserID");
		if (req.getSession().getAttribute("bundleCount") == null) {
			req.getSession().setAttribute("bundleCount",
					ss.getMapper(ManageBundleMapper.class).getAllBundleCount(user));
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
	}

	public void updateBundleFolderName(DataBundle db) {
		ss.getMapper(ManageBundleMapper.class).updateBundleFileName(db);
	}
}
