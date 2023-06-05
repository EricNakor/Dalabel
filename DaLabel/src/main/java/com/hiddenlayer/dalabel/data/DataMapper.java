package com.hiddenlayer.dalabel.data;

import com.hiddenlayer.dalabel.manageLabeling.Data;

public interface DataMapper {
	public abstract int insertData(Data data);

	public abstract String getData(Data data);

	public abstract int deleteData(String data_name);
}
