package com.hiddenlayer.dalabel.member;

import java.util.Date;

public class Member {
	private String user_id;
	private String user_email;
	private String user_name;
	private String user_pw;
	private Date user_birth;
	private String nickname;
	private String user_img;
	private String user_address;

	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String user_id, String user_email, String user_name, String user_pw, Date user_birth, String nickname,
			String user_img, String user_address) {
		super();
		this.user_id = user_id;
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_birth = user_birth;
		this.nickname = nickname;
		this.user_img = user_img;
		this.user_address = user_address;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

}
