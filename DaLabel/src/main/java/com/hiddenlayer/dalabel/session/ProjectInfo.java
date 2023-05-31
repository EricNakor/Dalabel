package com.hiddenlayer.dalabel.session;

import java.math.BigDecimal;
import java.util.Stack;

class ProjectInfo {
	private BigDecimal cycle_no;
	private BigDecimal next_todo_no;
	private BigDecimal data_count;
	private Stack<BigDecimal> rest_data;
	private int access_level;

	ProjectInfo() {
		rest_data = new Stack<BigDecimal>();
	}

	BigDecimal getCycle_no() {
		return cycle_no;
	}

	void setCycle_no(BigDecimal cycle_no) {
		this.cycle_no = cycle_no;
	}

	BigDecimal getNext_todo_no() {
		return next_todo_no;
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
}
