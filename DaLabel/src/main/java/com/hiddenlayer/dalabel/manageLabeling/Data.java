package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

public class Data {
	private BigDecimal data_no;
	private BigDecimal data_where;
	private char data_activation;

	public Data() {
		// TODO Auto-generated constructor stub
	}

	public Data(BigDecimal data_no, BigDecimal data_where, char data_activation) {
		super();
		this.data_no = data_no;
		this.data_where = data_where;
		this.data_activation = data_activation;
	}

	public BigDecimal getData_no() {
		return data_no;
	}

	public void setData_no(BigDecimal data_no) {
		this.data_no = data_no;
	}

	public BigDecimal getData_where() {
		return data_where;
	}

	public void setData_where(BigDecimal data_where) {
		this.data_where = data_where;
	}

	public char getData_activation() {
		return data_activation;
	}

	public void setData_activation(char data_activation) {
		this.data_activation = data_activation;
	}

}
