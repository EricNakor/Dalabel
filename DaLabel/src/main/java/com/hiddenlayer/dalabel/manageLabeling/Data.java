package com.hiddenlayer.dalabel.manageLabeling;

import java.math.BigDecimal;

public class Data {
	private String data_name;
	private BigDecimal data_where;
	private char data_activation;

	public Data() {
		// TODO Auto-generated constructor stub
	}

	public Data(String data_name, BigDecimal data_where) {
		super();
		this.data_name = data_name;
		this.data_where = data_where;
	}

	public Data(String data_name, BigDecimal data_where, char data_activation) {
		super();
		this.data_name = data_name;
		this.data_where = data_where;
		this.data_activation = data_activation;
	}

	public String getData_name() {
		return data_name;
	}

	public void setData_name(String data_name) {
		this.data_name = data_name;
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
