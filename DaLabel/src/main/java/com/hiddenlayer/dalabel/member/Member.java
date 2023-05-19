package com.hiddenlayer.dalabel.member;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Member {
	private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyyMMdd");
	private String user_id;
	private String user_email;
	private String user_name;
	private String user_pw;
	private Date user_birth;
	private String user_img;
	private int user_isdeleted;
	private Date user_deleted_date;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public int getUser_isdeleted() {
		return user_isdeleted;
	}

	public void setUser_isdeleted(int user_isdeleted) {
		this.user_isdeleted = user_isdeleted;
	}

	public Date getUser_deleted_date() {
		return user_deleted_date;
	}

	public void setUser_deleted_date(Date user_deleted_date) {
		this.user_deleted_date = user_deleted_date;
	}

	public Member(String user_id, String user_email, String user_name, String user_pw, Date user_birth, String user_img,
			int user_isdeleted, Date user_deleted_date) {
		super();
		this.user_id = user_id;
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_birth = user_birth;
		this.user_img = user_img;
		this.user_isdeleted = user_isdeleted;
		this.user_deleted_date = user_deleted_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public Date getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}
	
	public void setUser_birth_formatted(String user_birth_formatted) {
		try {
			this.user_birth = SDF.parse(user_birth_formatted);	
		} catch (Exception e) {
			this.user_birth = new Date();
		}
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

}
