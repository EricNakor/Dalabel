package com.hiddenlayer.dalabel.data;


import java.math.BigDecimal;

import org.apache.ibatis.annotations.Param;

import com.hiddenlayer.dalabel.manageLabeling.Data;

public interface DataMapper {
	public abstract int insertData(Data data);

	public abstract String getData(Data data);

	public abstract int deleteData(String data_name);
	
	public abstract Data getNextData(@Param("project_no")BigDecimal project_no, @Param("rest_no")BigDecimal rest_no);
}
