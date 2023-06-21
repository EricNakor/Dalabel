package com.hiddenlayer.dalabel.board;

import java.math.BigDecimal;
import java.util.Date;

public class CommentReply {
	private BigDecimal comment_id;
	private BigDecimal inherit_post;
	private BigDecimal cr_depth;
	private BigDecimal cr_parent_id;
	private String cr_writer;
	private String cr_content;
	private Date cr_regist;
	private Date cr_edit;
	
	public CommentReply() {
		// TODO Auto-generated constructor stub
	}

	public CommentReply(BigDecimal comment_id, BigDecimal inherit_post, BigDecimal cr_depth, BigDecimal cr_parent_id,
			String cr_writer, String cr_content, Date cr_regist, Date cr_edit) {
		super();
		this.comment_id = comment_id;
		this.inherit_post = inherit_post;
		this.cr_depth = cr_depth;
		this.cr_parent_id = cr_parent_id;
		this.cr_writer = cr_writer;
		this.cr_content = cr_content;
		this.cr_regist = cr_regist;
		this.cr_edit = cr_edit;
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

	public BigDecimal getCr_depth() {
		return cr_depth;
	}

	public void setCr_depth(BigDecimal cr_depth) {
		this.cr_depth = cr_depth;
	}

	public BigDecimal getCr_parent_id() {
		return cr_parent_id;
	}

	public void setCr_parent_id(BigDecimal cr_parent_id) {
		this.cr_parent_id = cr_parent_id;
	}

	public String getCr_writer() {
		return cr_writer;
	}

	public void setCr_writer(String cr_writer) {
		this.cr_writer = cr_writer;
	}

	public String getCr_content() {
		return cr_content;
	}

	public void setCr_content(String cr_content) {
		this.cr_content = cr_content;
	}

	public Date getCr_regist() {
		return cr_regist;
	}

	public void setCr_regist(Date cr_regist) {
		this.cr_regist = cr_regist;
	}

	public Date getCr_edit() {
		return cr_edit;
	}

	public void setCr_edit(Date cr_edit) {
		this.cr_edit = cr_edit;
	}
	
	
}
