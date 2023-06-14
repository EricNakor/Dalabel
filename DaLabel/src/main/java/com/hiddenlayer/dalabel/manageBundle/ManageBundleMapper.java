package com.hiddenlayer.dalabel.manageBundle;

import java.math.BigDecimal;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hiddenlayer.dalabel.manageLabeling.DataBundle;
import com.hiddenlayer.dalabel.manageLabeling.LabelingProject;

public interface ManageBundleMapper {
	public abstract int regLabelingBundle(DataBundle db);
	public abstract ArrayList<DataBundle> getAllBundle(ManageSelector ms);
	public abstract int getAllBundleCount(String id);
	public abstract int deleteBundle(int bundle_no);
	public abstract int getBundleNumber(@Param("userId") String id, @Param("fileName") String fileName);
	public abstract int updateBundleAfterUnzip(DataBundle db);
	public abstract int updateBundleFileName(DataBundle db);
	public abstract String getBundleFilePath(@Param("bundle_no")int project_no);
}
