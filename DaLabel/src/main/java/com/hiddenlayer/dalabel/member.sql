create table member (
	user_id varchar2(15 char) primary key,
	user_email varchar2(15 char) not null,
	user_name varchar2(5 char) not null,
	user_pw varchar2(15 char) not null,
	user_birth date not null,
	user_nickname varchar2(10 char) not null,
	user_img varchar2(100 char) not null,
	user_address varchar2(100 char) not null
)