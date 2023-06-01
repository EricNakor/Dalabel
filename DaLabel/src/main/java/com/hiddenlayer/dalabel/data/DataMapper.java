package com.hiddenlayer.dalabel.data;

import java.util.List;

import com.hiddenlayer.dalabel.manageLabeling.Data;

public interface DataMapper {
	public abstract int insertData(Data data);

	public abstract List<Data> getData(int bundle_no);

	public abstract int deleteData(String data_name);
}
