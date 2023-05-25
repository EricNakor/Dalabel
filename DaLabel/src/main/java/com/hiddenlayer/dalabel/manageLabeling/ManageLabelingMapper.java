package com.hiddenlayer.dalabel.manageLabeling;

import java.util.ArrayList;

import com.hiddenlayer.dalabel.manageBundle.ManageSelector;

public interface ManageLabelingMapper {
	public abstract int regLabelingProject(LabelingProject lp);

	public ArrayList<LabelingProject> getMyLabelingProject(ManageSelector ms);

	public LabelingProject getMyDetaillabelingProject(int project_no);
}
