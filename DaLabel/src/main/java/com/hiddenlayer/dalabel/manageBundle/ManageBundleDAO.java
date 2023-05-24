package com.hiddenlayer.dalabel.manageBundle;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiddenlayer.dalabel.PageOption;
import com.hiddenlayer.dalabel.fileupload.FileUpload;
import com.hiddenlayer.dalabel.manageLabeling.DataBundle;

@Service
public class ManageBundleDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private FileUpload fu;

	@Autowired
	private PageOption po;

	public void uploadBundle(DataBundle db, HttpServletRequest req) {
		db.setBundle_uploader((String) req.getSession().getAttribute("loginUserID"));
		String name = fu.labelingFileUpload(req);
		db.setBundle_uploaded_filename(name);
		db.setBundle_folder_name(name);
		ss.getMapper(ManageBundleMapper.class).regLabelingBundle(db);
	}

	public void getMyBundle(int page, HttpServletRequest req) {
		String user = (String) req.getSession().getAttribute("loginUserID");
		if (req.getSession().getAttribute("bundleCount") == null) {
			req.getSession().setAttribute("bundleCount", ss.getMapper(ManageBundleMapper.class).getAllBundleCount(user));
		}

		int bundlePageCount = (int) Math.ceil((Integer) req.getSession().getAttribute("bundleCount") / (double) po.getDataBundlePerPage());
		int start = (page - 1) * po.getDataBundlePerPage() + 1;
		int end = page * po.getDataBundlePerPage();
		ManageSelector mbs = new ManageSelector(user, start, end);
		List<DataBundle> bundles = ss.getMapper(ManageBundleMapper.class).getAllBundle(mbs);
		req.setAttribute("bundles", bundles);
		req.setAttribute("bundlePageCount", bundlePageCount);
		req.setAttribute("page", page);
	}
}
