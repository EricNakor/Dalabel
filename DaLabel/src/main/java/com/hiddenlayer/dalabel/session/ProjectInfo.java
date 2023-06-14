package com.hiddenlayer.dalabel.session;

import java.math.BigDecimal;
import java.util.Stack;

class ProjectInfo {
	private BigDecimal cycle_no;
	private BigDecimal next_todo_no;
	private BigDecimal data_count;
	private Stack<BigDecimal> rest_data;
	private int access_level;
	private String type;

	ProjectInfo() {
		rest_data = new Stack<BigDecimal>();
	}

	int getAccess_level() {
		return access_level;
	}

	void setAccess_level(int access_level) {
		this.access_level = access_level;
	}

	BigDecimal getCycle_no() {
		return cycle_no;
	}

	void setCycle_no(BigDecimal cycle_no) {
		this.cycle_no = cycle_no;
	}

	BigDecimal getNext_todo_no() {
		BigDecimal ret = next_todo_no;
		next_todo_no = next_todo_no.add(new BigDecimal(1));
		if(next_todo_no.intValue() > data_count.intValue()) {
			cycle_no.add(new BigDecimal(1));
			next_todo_no = new BigDecimal(1);
		}
		return ret;
	}

	void setNext_todo_no(BigDecimal next_todo_no) {
		this.next_todo_no = next_todo_no;
	}

	BigDecimal getData_count() {
		return data_count;
	}

	void setData_count(BigDecimal data_count) {
		this.data_count = data_count;
	}
	
	void putRest_data(BigDecimal n) {
		rest_data.add(n);
	}
	
	BigDecimal getRest_data() {
		if (rest_data.size()==0) {
			return null;
		}
		return rest_data.pop();
	}

	String getType() {
		return type;
	}

	void setType(String type) {
		this.type = type;
	}
	
}
