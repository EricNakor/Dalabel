package com.hiddenlayer.dalabel.dolabeling;

import java.util.ArrayList;

public interface DataDoLabelingMapper {
	public abstract int addLabelData(LabelData labeldata);
	public abstract int addLabelDoList(LabelDoList labeldolist);
	public abstract ArrayList<LabelDoList> findLabelDoList(LabelDoList labeldolist);
	public abstract int updateLabelState(LabelDoList labeldolist);
}
