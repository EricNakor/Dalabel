package com.hiddenlayer.dalabel.manageLabeling;

import java.util.ArrayList;

import com.hiddenlayer.dalabel.manageBundle.ManageSelector;

public interface ManageLabelingMapper {
	public abstract int regLabelingProject(LabelingProject lp);

	public abstract ArrayList<LabelingProject> getMyLabelingProject(ManageSelector ms);

	public abstract LabelingProject getMyDetaillabelingProject(int project_no);
	
	public abstract int getAllMyProjectCount(String user_id);
	
	public abstract int updateProjectAccessLevel(LabelingProject lp);
}
