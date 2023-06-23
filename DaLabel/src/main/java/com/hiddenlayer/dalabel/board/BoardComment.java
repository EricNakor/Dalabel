package com.hiddenlayer.dalabel.board;

import java.math.BigDecimal;
import java.util.Date;

public class BoardComment {
	private BigDecimal comment_id;
	private BigDecimal inherit_post;
	private String comment_writer;
	private String comment_content;
	private Date comment_regist;
	private Date comment_edit;
	private int comment_delete;
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}

	public BoardComment(BigDecimal comment_id, BigDecimal inherit_post, String comment_writer, String comment_content,
			Date comment_regist, Date comment_edit, int comment_delete) {
		super();
		this.comment_id = comment_id;
		this.inherit_post = inherit_post;
		this.comment_writer = comment_writer;
		this.comment_content = comment_content;
		this.comment_regist = comment_regist;
		this.comment_edit = comment_edit;
		this.comment_delete = comment_delete;
	}

	public BigDecimal getComment_id() {
		return comment_id;
	}

	public void setComment_id(BigDecimal comment_id) {
		this.comment_id = comment_id;
	}

	public BigDecimal getInherit_post() {
		return inherit_post;
	}

	public void setInherit_post(BigDecimal inherit_post) {
		this.inherit_post = inherit_post;
	}

	public String getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_regist() {
		return comment_regist;
	}

	public void setComment_regist(Date comment_regist) {
		this.comment_regist = comment_regist;
	}

	public Date getComment_edit() {
		return comment_edit;
	}

	public void setComment_edit(Date comment_edit) {
		this.comment_edit = comment_edit;
	}

	public int getComment_delete() {
		return comment_delete;
	}

	public void setComment_delete(int comment_delete) {
		this.comment_delete = comment_delete;
	}



	

}
