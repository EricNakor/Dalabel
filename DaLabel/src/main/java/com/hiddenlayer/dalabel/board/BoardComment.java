package com.hiddenlayer.dalabel.board;

import java.math.BigDecimal;
import java.util.Date;

public class BoardComment {
	private BigDecimal commnet_id;
	private BigDecimal board_id;
	private String user_id;
	private Date comment_content;
	private Date comment_regist;
	private String comment_edit;
	private int comment_delete;

	public BoardComment(BigDecimal commnet_id, BigDecimal board_id, String user_id, Date comment_content,
			Date comment_regist, String comment_edit, int comment_delete) {
		super();
		this.commnet_id = commnet_id;
		this.board_id = board_id;
		this.user_id = user_id;
		this.comment_content = comment_content;
		this.comment_regist = comment_regist;
		this.comment_edit = comment_edit;
		this.comment_delete = comment_delete;
	}

	public BigDecimal getCommnet_id() {
		return commnet_id;
	}

	public void setCommnet_id(BigDecimal commnet_id) {
		this.commnet_id = commnet_id;
	}

	public BigDecimal getBoard_id() {
		return board_id;
	}

	public void setBoard_id(BigDecimal board_id) {
		this.board_id = board_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getComment_content() {
		return comment_content;
	}

	public void setComment_content(Date comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_regist() {
		return comment_regist;
	}

	public void setComment_regist(Date comment_regist) {
		this.comment_regist = comment_regist;
	}

	public String getComment_edit() {
		return comment_edit;
	}

	public void setComment_edit(String comment_edit) {
		this.comment_edit = comment_edit;
	}

	public int getComment_delete() {
		return comment_delete;
	}

	public void setComment_delete(int comment_delete) {
		this.comment_delete = comment_delete;
	}

}
