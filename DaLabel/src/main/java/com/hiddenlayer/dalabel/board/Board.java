package com.hiddenlayer.dalabel.board;

import java.math.BigDecimal;
import java.util.List;

public class Board {
	private BigDecimal board_id;
	private String board_category;
	private String user_id;
	private String board_title;
	private String board_content;
	private String board_file;
	private String board_regist;
	private String board_edit;
	private int board_delete;

	// 댓글
	private List<BoardComment> b_comment;

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(BigDecimal board_id, String board_category, String user_id, String board_title, String board_content,
			String board_file, String board_regist, String board_edit, int board_delete, List<BoardComment> b_comment) {
		super();
		this.board_id = board_id;
		this.board_category = board_category;
		this.user_id = user_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_regist = board_regist;
		this.board_edit = board_edit;
		this.board_delete = board_delete;
		this.b_comment = b_comment;
	}

	public BigDecimal getBoard_id() {
		return board_id;
	}

	public void setBoard_id(BigDecimal board_id) {
		this.board_id = board_id;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_file() {
		return board_file;
	}

	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}

	public String getBoard_regist() {
		return board_regist;
	}

	public void setBoard_regist(String board_regist) {
		this.board_regist = board_regist;
	}

	public String getBoard_edit() {
		return board_edit;
	}

	public void setBoard_edit(String board_edit) {
		this.board_edit = board_edit;
	}

	public int getBoard_delete() {
		return board_delete;
	}

	public void setBoard_delete(int board_delete) {
		this.board_delete = board_delete;
	}

	public List<BoardComment> getB_comment() {
		return b_comment;
	}

	public void setB_comment(List<BoardComment> b_comment) {
		this.b_comment = b_comment;
	}

}
