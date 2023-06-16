package com.hiddenlayer.dalabel.board;

import java.math.BigDecimal;
import java.util.Date;

public class BoardReply {
	private BigDecimal reply_id;
	private BigDecimal inherit_comment;
	private String reply_writer;
	private String reply_content;
	private Date reply_regist;
	private Date reply_edit;
	private int reply_delete;

	public BoardReply() {
		// TODO Auto-generated constructor stub
	}

	public BoardReply(BigDecimal reply_id, BigDecimal inherit_comment, String reply_writer, String reply_content,
			Date reply_regist, Date reply_edit, int reply_delete) {
		super();
		this.reply_id = reply_id;
		this.inherit_comment = inherit_comment;
		this.reply_writer = reply_writer;
		this.reply_content = reply_content;
		this.reply_regist = reply_regist;
		this.reply_edit = reply_edit;
		this.reply_delete = reply_delete;
	}

	public BigDecimal getReply_id() {
		return reply_id;
	}

	public void setReply_id(BigDecimal reply_id) {
		this.reply_id = reply_id;
	}

	public BigDecimal getInherit_comment() {
		return inherit_comment;
	}

	public void setInherit_comment(BigDecimal inherit_comment) {
		this.inherit_comment = inherit_comment;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_regist() {
		return reply_regist;
	}

	public void setReply_regist(Date reply_regist) {
		this.reply_regist = reply_regist;
	}

	public Date getReply_edit() {
		return reply_edit;
	}

	public void setReply_edit(Date reply_edit) {
		this.reply_edit = reply_edit;
	}

	public int getReply_delete() {
		return reply_delete;
	}

	public void setReply_delete(int reply_delete) {
		this.reply_delete = reply_delete;
	}

}
