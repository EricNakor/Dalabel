create table board(
	board_id number(8) not null primary key,
	board_category varchar2(20) not null,
	board_writer varchar2(15 char) references member(user_id),
--	제목, 내용은 넉넉잡았음
	board_title varchar2(60) not null,
	board_content varchar2(600) not null,
	board_regist date default sysdate not null,
	board_edit date default sysdate not null,
-- 0이 현재 노출 되는거, 1이 삭제한거
	board_delete number(1) not null,
	constraint post_writer 
		foreign key (board_writer)
		references member(user_id)
		on delete cascade );

create sequence board_seq start with 1 increment by 1;

select * from board;

--insert into board 
--value (board_seq.nextval, board_id, board_category, board_writer, board_title, board_content, board_file, sysdate, sysdate, 0)

create table post_comment(
	comment_id number(8) not null primary key,
	inherit_post number(8) not null,
	comment_writer varchar2(15 char) not null,
	comment_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null,
	comment_delete number(1) not null,
	constraint b_comment
		foreign key(inherit_post) references board(board_id)
		on delete cascade,
	foreign key(comment_writer) references member(user_id)
);

drop table post_comment cascade constraints purge;
drop sequence post_comment_seq;
create sequence post_comment_seq;

select * from post_comment;

--select*
--from comment
--where board_id = 11

select * from member;

create table reply(
	reply_id number(8) primary key,
	inherit_comment number(8) not null,
	reply_writer varchar2(15 char) not null,
	reply_content varchar2(600) not null,
	reply_regist date not null,
	reply_edit date not null,
	reply_delete number(1) not null,
	foreign key(inherit_comment) references post_comment(comment_id),
	foreign key(reply_writer) references member(user_id)
);

create sequence reply_seq;

select * from reply;

drop table reply cascade constraints purge;
drop sequence reply_seq cascade constraints purge;


create table reply(
	inherit_comment number(8) references post_comment(comment_id),
	reply_writer varchar2(15 char) references member(user_id),
	reply_content varchar2(600) not null,
	comment_regist date default sysdate not null,
	comment_edit date default sysdate not null	
);

--select board_id, board_category, user_id, board_title, board_content, board_file, board_regist
--from  board order by board_regist desc;


create table comment_reply (
	comment_id number(8) not null primary key,
	inherit_post number(8) not null,
	cr_depth number(1) not null,
	cr_parent_id number(8) not null,
	cr_writer varchar2(15 char) not null,
	cr_content varchar2(600) not null,
	cr_regist date not null,
	cr_edit date not null,
	constraint b_c
		foreign key(inherit_post) references board(board_id)
		on delete cascade
);

create sequence comment_reply_seq;