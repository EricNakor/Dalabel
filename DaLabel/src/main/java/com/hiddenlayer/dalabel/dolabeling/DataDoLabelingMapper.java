package com.hiddenlayer.dalabel.dolabeling;

import java.math.BigDecimal;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface DataDoLabelingMapper {
	public abstract int addLabelData(LabelData labeldata);
	public abstract int addLabelDoList(LabelDoList labeldolist);
	public abstract ArrayList<LabelDoList> findLabelDoList(@Param("userid")String userid, @Param("start") int start, @Param("end")int end);
	public abstract int updateLabelState(LabelDoList labeldolist);
	public abstract int getJoinProjectCount(@Param("userid") String id);
	public abstract ArrayList<SearchResultDoLabelingList> findAccessableDoList(@Param("userid")String userid, @Param("grade")BigDecimal userrating, @Param("projectstart") int projectstart, @Param("getnum")int getnum);
}
